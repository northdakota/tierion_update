This script add a possibility to safe-update terrion node.
And will restart the node only if new version is released. 

# Installation

* Go to directory where node is installed, in my case to following path
```
cd /root/chainpoint-node
```

* Then download update script from github by following command
```
wget https://raw.githubusercontent.com/northdakota/tierion_update/master/update.sh
```

* Update permissions
```
chmod 776 /root/chainpoint-node/update.sh
```

* Add our script to crontab
```
crontab -e
```

Paste following content. Make sure you have insert an extra empty line in the end of file
```
* * * * * cd /root/chainpoint-node && /bin/sh /root/chainpoint-node/update.sh >> /root/chainpoint-node/update.log 2>&1
```

* If all done, you shoud see log file situated at
```
/root/chainpoint-node/update.log
```

Example of log file:
```
2017-10-11 11:55:02: Up-to-date
2017-10-11 11:56:02: Up-to-date
2017-10-11 11:57:02: Up-to-date
2017-10-11 11:58:03: Up-to-date
2017-10-11 11:59:02: Up-to-date
2017-10-11 12:00:02: Up-to-date
2017-10-11 12:01:02: Up-to-date
2017-10-11 12:02:02: Up-to-date
```
