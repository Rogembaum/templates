#!/bin/bash
indexname="warpsparker*"
old_days="60"
old_date=$(date -d "${old_days} days ago" +%s)
for index in $(curl -u user:pass  -XGET "http://localhost:9200/_cat/indices?index=*-${indexname}-*" |awk '{print $3}''); do
indexdate=$(echo ${index}| sed -E 's/.*([0-9]{4}\.[0-9]{2}\.[0-9]{2}).*/\1/'| sed 's|\.|-|g')
indextimestamp=$(date -d ${indexdate} +%s)
if (( ${indextimestamp} < ${old_date} )); then
curl -u user:pass -XDELETE "http://localhost:9200/${index}"
fi
done