LOGFILE=/var/www/html/netlog/networklogfile
EVENTSFILE=/var/www/html/netlog/networkeventsfile
INETEVENTSFILE=/var/www/html/netlog/networkineteventsfile
ROUTEREVENTSFILE=/var/www/html/netlog/networkroutereventsfile
ROUTERSTAT=/var/www/html/netlog/router.status
NETWORKSTAT=/var/www/html/netlog/network.status
REMOTEHOST=8.8.8.8
ROUTER=192.168.0.1
OLDRSTAT=`cat $ROUTERSTAT`
OLDNSTAT=`cat $NETWORKSTAT`
MYDATE=`date`
ping -c 1 $ROUTER
RETVAL=$?
if [ $RETVAL -eq 0 ]
then
	ROUTERLINE="<font color=02892e><b>Router is UP</b></font>"
	RSTAT="UP"
else
	ROUTERLINE="<font color=ae0202><b>Router is DOWN</b></font>"
	RSTAT="DOWN"
fi
ping -c 1 $REMOTEHOST
RETVAL=$?
if [ $RETVAL -eq 0 ]
then
	NETWORKLINE="<font color=02892e><b>Internet link is UP</b></font>"
	NSTAT="UP"
else
	NETWORKLINE="<font color=ae0202><b>Internet link is DOWN</b></font>"
	NSTAT="DOWN"
fi
echo "<tr>" >> $LOGFILE
echo "<td>" >> $LOGFILE
echo $MYDATE >> $LOGFILE
echo "</td>">> $LOGFILE
echo "<td>" >> $LOGFILE
echo $ROUTERLINE >> $LOGFILE
echo "</td>">> $LOGFILE
echo "<td>">> $LOGFILE
echo $NETWORKLINE >> $LOGFILE
echo "</td>">> $LOGFILE
echo "</tr>">> $LOGFILE

if [ $OLDRSTAT != $RSTAT ]
then
	echo "<tr>">> $ROUTEREVENTSFILE
	echo "<td>">> $ROUTEREVENTSFILE
	echo $MYDATE >> $ROUTEREVENTSFILE
	echo "</td>">> $ROUTEREVENTSFILE
	echo "<td>" >> $ROUTEREVENTSFILE
	echo $ROUTERLINE >> $ROUTEREVENTSFILE
	echo "</td>">> $ROUTEREVENTSFILE
	echo "</tr>">> $ROUTEREVENTSFILE

	echo "<tr>">> $EVENTSFILE
	echo "<td>">> $EVENTSFILE
	echo $MYDATE >> $EVENTSFILE
	echo "</td>">> $EVENTSFILE
	echo "<td>" >> $EVENTSFILE
	echo $ROUTERLINE >> $EVENTSFILE
	echo "</td>">> $EVENTSFILE
	echo "</tr>">> $EVENTSFILE
	echo $RSTAT > $ROUTERSTAT
fi

if [ $OLDNSTAT != $NSTAT ]
then
	echo "<tr>">> $INETEVENTSFILE
	echo "<td>">> $INETEVENTSFILE
	echo $MYDATE >> $INETEVENTSFILE
	echo "</td>">> $INETEVENTSFILE
	echo "<td>" >> $INETEVENTSFILE
	echo $NETWORKLINE >> $INETEVENTSFILE
	echo "</td>">> $INETEVENTSFILE
	echo "</tr>">> $INETEVENTSFILE

	echo "<tr>">> $EVENTSFILE
	echo "<td>">> $EVENTSFILE
	echo $MYDATE >> $EVENTSFILE
	echo "</td>">> $EVENTSFILE
	echo "<td>" >> $EVENTSFILE
	echo $NETWORKLINE >> $EVENTSFILE
	echo "</td>">> $EVENTSFILE
	echo "</tr>">> $EVENTSFILE
	echo $NSTAT > $NETWORKSTAT
fi

