ip=`/sbin/ifconfig | awk '/inet /{print $2}'`
ip=`echo "$ip" | tr '\n' ' '`
ip=`echo "$ip" | tr '@@' ' '`
echo "UploadIpList = $ip"
#echo $a
#echo $ip
filename="$1"
tstamp=`date "+%Y_%m_%d_%H_%M_%S"`
hname=`uname -n`
while read -r line; do
    name="$line"
    #echo "Name read from file - $name"
    #ssh $name "echo hostname=$hname\ntimestamp=$tstamp\nip=$ip\n >> list.txt"
    echo "hostname=$hname\ntimestamp=$tstamp\nip=$ip\n" | ssh -o ConnectTimeout=1 -o BatchMode=yes $name "cat >> list.txt"
    if [ $? -eq 0 ]; then
        echo "Success Wrote to $name"
    fi
    #echo "sed -i '$ a hostname=$hname timestamp=$tstamp ip=\"$ip\" ' list.txt"
done  < "$filename"
