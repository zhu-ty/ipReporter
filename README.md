# ipReporter
Report your ip address to a server when machine startup

# Usage

## Download the project
Clone the project wherever you want
```shell
git clone https://github.com/zhu-ty/ipReporter/
```
Assume you have clone it to /home/abc/Project/ipReporter

## Modify the files
Add excute permission to the upload.sh file
```shell
(sudo) chmod +x upload.sh
```

Change the iplist file as you want (if you have different username on the server, don't forget to fill that like samples given)
```shell
vim SampleIpList.txt
```

## Autostart
Setup auto start for your machine
```shell
crontab -e
```
Add a line like this:
```shell
@reboot sleep 10 && /home/abc/Project/ipReporter/upload.sh /home/abc/Project/ipReporter/SampleIpList.txt >> /home/abc/output.txt 2>&1
```
Sleep 10 seconds to make sure this script is excuted AFTER the network is up. (I need a better way for that)

The output file (`/home/abc/output.txt`) is where the script output goes to.

You may also put these scripts elsewhere.

## SSH setting

To avoid ssh blocking the start up, option ConnectTimeout & BatchMode is turned on, so make sure your server which used to store 
the ip can be connected by using ssh-keys.

To generate ssh keys, you can take a look at [here](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)

For more information, check [here](https://help.github.com/articles/connecting-to-github-with-ssh/)

Once you are done generating you ssh keys, copy them to your server by using this command:
```shell
ssh-copy-id user@ip
```
Sample:
```shell
ssh-copy-id abc@11.22.33.44
```
After this, your login to the server won't ask you to provide your password anymore.

# Done
From now, your machine will try to connect to the server and append their ip information to ~/list.txt

Which looks like this:
```shell
hostname=lalala
timestamp=2019_01_29_21_00_27
ip=1.2.3.4 127.0.0.1
```
