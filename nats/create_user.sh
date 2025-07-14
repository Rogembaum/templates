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

if [ -z "$NATS_USER_ACCOUNT_NAME" ]; then
  echo "NATS_USER_ACCOUNT_NAME environment variable is not set."
  exit 1
fi

if [ -z "$NATS_USER_ACCOUNT_JWT" ]; then
  echo "NATS_USER_ACCOUNT_JWT environment variable is not set."
  exit 1
fi

if [ -z "$NATS_USER_NAME" ]; then
  echo "NATS_USER_NAME environment variable is not set."
  exit 1
fi

if [ -z "$NATS_USER_SECRET" ]; then
  echo "NATS_USER_SECRET environment variable is not set."
  exit 1
fi

# Check if the secret exists
kubectl get secret "$NATS_USER_SECRET" -n "$K8S_NAMESPACE"

if [ $? -eq 0 ]; then
  echo "Secret $NATS_USER_SECRET already exists."
  exit 0;
fi

set -e

echo "Secret $NATS_USER_SECRET not found. Creating..."

NATS_OPERATOR_JWT_FILENAME="/tmp/operator.jwt"
NATS_SYSTEM_ACCOUNT_JWT_FILENAME="/tmp/system_account.jwt"
NATS_USER_ACCOUNT_JWT_FILENAME="/tmp/account.jwt"

# Prepare import files
echo -n "$NATS_OPERATOR_JWT" > $NATS_OPERATOR_JWT_FILENAME
echo -n "$NATS_SYSTEM_ACCOUNT_JWT" > $NATS_SYSTEM_ACCOUNT_JWT_FILENAME
echo -n "$NATS_USER_ACCOUNT_JWT" > $NATS_USER_ACCOUNT_JWT_FILENAME

nsc import keys -d /keys
nsc import keys -d /account-keys

echo "NATS keys imported."

# Import operator and system account
nsc add operator --force -u $NATS_OPERATOR_JWT_FILENAME
nsc edit operator -u "$NATS_URL"
nsc import account --file $NATS_SYSTEM_ACCOUNT_JWT_FILENAME

# Import a specific account
nsc import account --file $NATS_USER_ACCOUNT_JWT_FILENAME

echo "Operator and accounts imported. Creating a new account..."

# Create a new user
nsc add user --account "$NATS_USER_ACCOUNT_NAME" --name "$NATS_USER_NAME"
nsc generate creds --account "$NATS_USER_ACCOUNT_NAME" --name "$NATS_USER_NAME" -o ./user.creds

echo "User $NATS_USER_NAME created. Creating a secret..."

kubectl create secret generic "$NATS_USER_SECRET" -n "$K8S_NAMESPACE" \
  --from-literal="ACCOUNT_NAME=$NATS_USER_ACCOUNT_NAME" \
  --from-literal="USER_NAME=$NATS_USER_NAME" \
  --from-file="CREDENTIALS=./user.creds"

echo "Secret $NATS_USER_SECRET created!"