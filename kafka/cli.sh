# set count partition - by default 1part/1topic
bin/kafka-topics.sh -- create \
    --partitions 12 \
    --topic tst

# replication partitions
bin/kafka-topics.sh -- create \
    --replication-factor 3 \
    --topic tst


min.insync.replicas = 1


acks = all