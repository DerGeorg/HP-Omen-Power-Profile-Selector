# HP-Omen-Power-Profile-Selector

Selecting HP Omen power Profiles 
* cool
* balanced
* performance



| :exclamation:  Compatible with Kernel Version >= 5.15   |
|-----------------------------------------|

## Testet on
* Ubuntu 20.04
* Kernel 5.17.1-051701-generic

## Installation 
### Kernel installation in Ubuntu 20.04
```bash
sudo apt install linux-generic-5.17
```
### CHOWN platform_profile
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

## Screenshots
### Terminal input
![Terminal input](https://user-images.githubusercontent.com/22521386/161427663-1ca4b8b1-6270-4a60-b442-67fdaeb4053d.png)

### Terminal Notification
![Terminal Notification](https://user-images.githubusercontent.com/22521386/161427688-5c27a17f-ea66-4126-9a0e-5c4eb556c094.png)

### Gui input
![Gui input](https://user-images.githubusercontent.com/22521386/161427706-dd7ec139-32d8-46d6-b6d7-d7736ddbd2ff.png)

### Gui Notification
![Gui Notification](https://user-images.githubusercontent.com/22521386/161427725-0c06447f-be99-4a15-bdc9-eb181809795b.png)

### Text only mode
![Text only mode](https://user-images.githubusercontent.com/22521386/161427747-5e838c0d-914b-411f-b2ed-a8ba8915aede.png)

