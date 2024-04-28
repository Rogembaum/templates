#!/bin/bash
old_days="60"
old_date=$(date -d "${old_days} days ago" +%s)
array=(warpsparker issbackup)

for indexname in ${array[*]}
do
    printf "   %s\n" $indexname
    # indexname="warpsparker*"

    for index in $(curl -XGET "http://localhost:9200/_cat/indices?index=${indexname}-*" |awk '{print $3}'); do

        indexdate=$(echo ${index}| sed -E 's/.*([0-9]{4}\.[0-9]{2}\.[0-9]{2}).*/\1/'| sed 's|\.|-|g')
        indextimestamp=$(date -d ${indexdate} +%s)
        
        if (( ${indextimestamp} < ${old_date} )); then
            echo "Index $index will be deleted"
            curl -v  -XDELETE "http://localhost:9200/${index}"
        fi

    done

done



