#!/bin/bash

linecount=0
processes=$(mysql -B -e "show processlist" | grep basededatos)
oldIfs=$IFS
IFS='
'
echo "Checking for slow MySQL queries..."
for line in $processes
do
    if [ "$linecount" -gt 0 ]
        then
            pid=$(echo "$line" | cut -f1)
            length=$(echo "$line" | cut -f6)
            query=$(echo "$line" | cut -f8)
            #Id User    Host    db  Command Time    State   Info
            if [ "$length" -gt 45 ]
                then
                    #echo "$pid = $length"
                    echo "WARNING:  Killing query with pid=$pid with total execution time of $length seconds! (query=$query)"
                    killoutput=$(echo "kill query $pid" | mysql )
                    echo "Result of killing $pid:  $killoutput"
            fi
    fi
    linecount=`expr $linecount + 1`
done
IFS=$oldIfs
