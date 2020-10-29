<title>Network Uptime Logs</title>
<center>
<h1>Network Uptime Logs</h1>
<hr>
<font size=+1><b>
[
<a href="index.php">Main Index</a>
|
<a href="inetlog.php">Inet Events Log</a>
|
<a href="routerlog.php">Router Events Log</a>
|
<a href="eventlog.php">All Events Log</a>
|
<a href="fulllog.php">Full Log</a>



]
</b></font>
<hr>
<h2>Inet Event Log</h2>

<table border=1>
<tr>
<td><b>Date</b></td>
<td colspan=i align=center><b>Internet Status</b></td>
</tr>

<?php
echo readfile("/var/www/html/netlog/networkineteventsfile");
?> 
</table>



<hr>
<font size=+1><b>
[
<a href="index.php">Main Index</a>
|
<a href="inetlog.php">Inet Events Log</a>
|
<a href="routerlog.php">Router Events Log</a>
|
<a href="eventlog.php">All Events Log</a>
|
<a href="fulllog.php">Full Log</a>



]
</b></font>
<hr>
<hr>
<center><font size=+1><b><a href="/">Go back to the homepage for this machine</a></b></font></center>
<hr>

