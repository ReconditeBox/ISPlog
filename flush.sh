

echo > networkeventsfile 
echo > networkineteventsfile 
echo > networkroutereventsfile 
echo > networklogfile
echo DOWN > router.status 
echo DOWN > network.status
chmod 664 networklogfile networkeventsfile networkineteventsfile networkroutereventsfile router.status network.status


