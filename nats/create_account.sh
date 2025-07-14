#!/usr/bin/env bash

set -o pipefail

if [ -z "$NATS_URL" ]; then
  echo "NATS_URL environment variable is not set."
  exit 1
fi

if [ -z "$NATS_OPERATOR_JWT" ]; then
  echo "NATS_OPERATOR_JWT environment variable is not set."
  exit 1
fi

if [ -z "$NATS_SYSTEM_ACCOUNT_JWT" ]; then
  echo "NATS_SYSTEM_ACCOUNT_JWT environment variable is not set."
  exit 1
fi

if [ -z "$K8S_NAMESPACE" ]; then
  echo "K8S_NAMESPACE environment variable is not set."
  exit 1
fi

if [ -z "$NATS_ACCOUNT_NAME" ]; then
  echo "NATS_ACCOUNT_NAME environment variable is not set."
  exit 1
fi

if [ -z "$NATS_ACCOUNT_SECRET" ]; then
  echo "NATS_ACCOUNT_SECRET environment variable is not set."
  exit 1
fi

if [ -z "$NATS_ACCOUNT_KEYS_SECRET" ]; then
  echo "NATS_ACCOUNT_KEYS_SECRET environment variable is not set."
  exit 1
fi

# Check if the secret exists
kubectl get secret "$NATS_ACCOUNT_SECRET" -n "$K8S_NAMESPACE"

if [ $? -eq 0 ]; then
  echo "Secret $NATS_ACCOUNT_SECRET already exists."
  exit 0;
fi

set -e

echo "Secret $NATS_ACCOUNT_SECRET not found. Creating..."

NATS_OPERATOR_JWT_FILENAME="/tmp/operator.jwt"
NATS_SYSTEM_ACCOUNT_JWT_FILENAME="/tmp/system_account.jwt"

# Prepare import files
echo -n "$NATS_OPERATOR_JWT" > $NATS_OPERATOR_JWT_FILENAME
echo -n "$NATS_SYSTEM_ACCOUNT_JWT" > $NATS_SYSTEM_ACCOUNT_JWT_FILENAME

nsc import keys -d /keys

echo "NATS keys imported."

# Import operator and system account
nsc add operator --force -u $NATS_OPERATOR_JWT_FILENAME
nsc edit operator -u "$NATS_URL"
nsc import account --file $NATS_SYSTEM_ACCOUNT_JWT_FILENAME

echo "Operator and System Account imported. Creating a new account..."

# Create and push a new account
nsc add account "$NATS_ACCOUNT_NAME"
nsc edit account -n "$NATS_ACCOUNT_NAME" --js-mem-storage 512M --js-disk-storage 512M  --js-streams 100 --js-consumer 100
nsc export keys --account "$NATS_ACCOUNT_NAME" -d ./account-keys
nsc push -a "$NATS_ACCOUNT_NAME"

echo "Account $NATS_ACCOUNT_NAME created and pushed. Creating a secret..."

ACCOUNT_JWT="$(nsc describe account --raw "$NATS_ACCOUNT_NAME")"

kubectl create secret generic "$NATS_ACCOUNT_SECRET" -n "$K8S_NAMESPACE" \
  --from-literal="ACCOUNT_NAME=$NATS_ACCOUNT_NAME" \
  --from-literal="ACCOUNT_JWT=$ACCOUNT_JWT"

echo "Secret $NATS_ACCOUNT_SECRET created!"

kubectl create secret generic "$NATS_ACCOUNT_KEYS_SECRET" -n "$K8S_NAMESPACE" --from-file=./account-keys

echo "Secret $NATS_ACCOUNT_KEYS_SECRET created!"



-------------------------------------------------------------------------------
1. Устанавливаем зависимости

Перед использованием убедись, что у тебя установлены:

    tar (для создания архива)
    openssl (для шифрования)
    aws-cli (для загрузки в S3)

    
2. Скрипт для экспорта, шифрования и загрузки в S3

#!/bin/bash
set -e  # Прерывать выполнение при ошибке

# Проверяем, что передан аккаунт
if [ -z "$NATS_ACCOUNT_NAME" ]; then
  echo "Ошибка: Переменная NATS_ACCOUNT_NAME не задана!"
  exit 1
fi

# Проверяем, что переданы данные для S3
if [ -z "$S3_BUCKET" ] || [ -z "$S3_KEY" ]; then
  echo "Ошибка: S3_BUCKET и S3_KEY должны быть заданы!"
  exit 1
fi

# Проверяем, что есть пароль для шифрования
if [ -z "$ENCRYPTION_PASSWORD" ]; then
  echo "Ошибка: ENCRYPTION_PASSWORD не задан!"
  exit 1
fi

# Создаем временную папку
TEMP_DIR=$(mktemp -d)
ARCHIVE_NAME="keys_${NATS_ACCOUNT_NAME}_$(date +%Y%m%d_%H%M%S).tar.gz"
ENCRYPTED_ARCHIVE="${ARCHIVE_NAME}.enc"

echo "Экспортируем ключи аккаунта $NATS_ACCOUNT_NAME..."
nsc export keys --account "$NATS_ACCOUNT_NAME" -d "$TEMP_DIR"

# Создаем архив
tar -czf "$ARCHIVE_NAME" -C "$TEMP_DIR" .

# Шифруем архив с помощью AES-256
openssl enc -aes-256-cbc -salt -pbkdf2 -in "$ARCHIVE_NAME" -out "$ENCRYPTED_ARCHIVE" -k "$ENCRYPTION_PASSWORD"

# Загружаем зашифрованный архив в S3
echo "Загружаем архив в S3..."
aws s3 cp "$ENCRYPTED_ARCHIVE" "s3://$S3_BUCKET/$S3_KEY/$ENCRYPTED_ARCHIVE"

# Очистка временных файлов
rm -rf "$TEMP_DIR" "$ARCHIVE_NAME" "$ENCRYPTED_ARCHIVE"

echo "Готово! Архив успешно загружен в s3://$S3_BUCKET/$S3_KEY/$ENCRYPTED_ARCHIVE"

3. Переменные окружения

Перед запуском скрипта настрой переменные:

export NATS_ACCOUNT_NAME="my-nats-account"
export S3_BUCKET="my-secure-nats-backups"
export S3_KEY="backups"
export ENCRYPTION_PASSWORD="SuperSecurePassword"


Расшифровка архива после скачивания

Если тебе нужно восстановить ключи:

aws s3 cp "s3://my-secure-nats-backups/backups/keys_my-nats-account_20240319_120000.tar.gz.enc" .
openssl enc -aes-256-cbc -d -pbkdf2 -in "keys_my-nats-account_20240319_120000.tar.gz.enc" -out "keys_my-nats-account.tar.gz" -k "SuperSecurePassword"
tar -xzf "keys_my-nats-account.tar.gz"