#!/bin/bash
start(){
 now=`date "+%Y%m%d%H%M%S"`
 exec java -Xms256m -Xmx512m -jar $2 > "$now"_run.log 2>&1 &
 tail -f "$now"_run.log  
}
#停止方法  
stop(){
 ps -ef|grep java|awk '{print $2}'|while read pid  
 do
    kill -9 $pid
 done
}
 
case "$1" in
start)
start
;;
stop)
stop
;;
restart)
stop
start
;;
*)
printf 'Usage: %s {start|stop|restart}\n' "$prog"
exit 1
;;
esac

