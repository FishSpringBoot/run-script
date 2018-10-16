#!/bin/bash

start(){
 now=`date "+%Y%m%d"`
 exec java -Xms256m -Xmx512m -jar $1 > "$now"_run.log 2>&1 &
 tail -f "$now"_run.log  
}
#停止方法  
stop(){
 ps -ef|grep java|grep $1|awk '{print $2}'|while read pid  
 do
        echo "kill pid $pid"
    kill -9 $pid
 done
}
 
case "$1" in
start)
start $2
;;
stop)
stop $2
;;
restart)
stop $2
start $2
;;
*)
printf 'Usage: %s {start|stop|restart}\n' "$prog"
exit 1
;;
esac
