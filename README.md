# HP-Omen-Power-Profile-Selector

Selecting HP Omen power Profiles 
* cool
* balanced
* performance



| :exclamation:  Compatible with Kernel Version newer than 5.16   |
|-----------------------------------------|

## Installation 
```bash
sudo chown $USER /sys/firmware/acpi/platform_profile
```

## USAGE
	-t, --txtonly 		 Text only mode
	-g, --gui 		 GUI Mode
	-h, --help 		 This help
	-s, --profile <PROFILE>  Set to profile without user selection. <PROFILE>=['cool', 'balanced', 'performance']
	-c, --cool 		 Select cool profile
	-b, --balanced 		 Select balanced profile
	-p, --performance 	 Select performance profile
### Examples
#### GUI MODE
```bash
./powergui.sh -g                      #Select via gui & Notification
./powergui.sh -g -t                   #Select via gui & Notification & Text output
./powergui.sh -g -p                   #Select performance mode & Notification
./powergui.sh -g -b                   #Select balanced mode & Notification
./powergui.sh -g -c                   #Select cool mode & Notification
./powergui.sh -g -s performance       #Select performance mode & Notification
./powergui.sh -g -s balanced          #Select balanced mode & Notification
./powergui.sh -g -s cool              #Select cool mode & Notification
```

#### Terminal Mode
```bash
./powergui.sh                      #Select via Terminal & Terminal Notification 
./powergui.sh -t                   #Select via Terminal & Text output
./powergui.sh -p                   #Select performance mode & Terminal Notification 
./powergui.sh -b                   #Select balanced mode & Terminal Notification 
./powergui.sh -c                   #Select cool mode & Terminal Notification 
./powergui.sh -s performance       #Select performance mode & Terminal Notification 
./powergui.sh -s balanced          #Select balanced mode & Terminal Notification 
./powergui.sh -s cool              #Select cool mode & Terminal Notification 
```

#### Text only Mode
```bash
./powergui.sh -t                     #Select via Terminal & Text output
./powergui.sh -t -g                   #Select via Gui & Text output
./powergui.sh -t -p                   #Select performance mode & Text output
./powergui.sh -t -b                   #Select balanced mode & Text output
./powergui.sh -t -c                   #Select cool mode & Text output
./powergui.sh -t -s performance       #Select performance mode & Text output
./powergui.sh -t -s balanced          #Select balanced mode & Text output
./powergui.sh -t -s cool              #Select cool mode & Text output
```

#### Help
```bash
./powergui.sh -h
```
