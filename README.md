# nvidia-optimus-switch
[EN]
DESCRIPTION:

What's suse-prime?
SUSE-PRIME: a tool that lets you choose intel or nvidia card for X session in a Optimus technology laptop, performances are better than bumblebee. (https://github.com/michalsrb/SUSEPrime)

My script provides: 

>> Extended battery life and cooler temperatures, because suse-prime DO NOT put nvidia card in sleep mode when intel one is active. This feature is provided by Nouveau driver, without bumblebee or any ACPI Switch

>> A choice to change default vga on boot, or remember the latest session

REQUIREMENTS:

Nvidia proprietary drivers: https://en.opensuse.org/SDB:NVIDIA_drivers

Remove "suse-prime" package after driver setup

USAGE:

vga switch [intel | nvidia ]           >> system waits for logout to switch video card

vga default [intel | nvidia | keep]    >> set default vga on boot

Tested on Optimus laptop with opensuse Tumbleweed and latest kernel (4.12 also works)
suse-prime package not required, already included.
 
- DON'T forget to give a process name during setup that you know for sure is stopped when you logout from your DE (for KDE leave blank)


[IT]
DESCRIZIONE:

Trattasi di una serie di script che consentono di estendere le funzionalità di suse-prime

Cosa è suse-prime?
SUSE-PRIME: consente di avviare una sessione di X con la vga integrata oppure con la nvidia dedicata nei laptop dotati di tecnologia nvidia optimus. (https://github.com/michalsrb/SUSEPrime)
                      
Funzionalità aggiunte:

>> Quando è attiva la gpu integrata, la vga discreta viene spenta totalmente, consentendo di estendere la durata della batteria ed abbassare le temperature

>> Questo è reso possibile grazie ai driver liberi Nouveau, che sono in grado di spegnere la vga dedicata quando in standby. Questo senza necessità di bumblebee o altri acpi switch

>> Possibilità di selezionare la VGA preferita al boot oppure di ricordare quella precedentemente utilizzata
           
REQUISITI:

Driver nvidia proprietari: https://en.opensuse.org/SDB:NVIDIA_drivers

Dopo il setup dei driver rimuovi il pacchetto "suse-prime"

Testato su laptop con tecnologia NVIDIA Optimus e opensuse Tumbleweed con l'ultimo kernel (testato anche 4.12)       
il pacchetto suse-prime non è più necessario, è già incluso

NON dimenticare durante l'installazione di fornire il nome di un processo che siete sicuri venga arrestato nel momento in cui effettuate il logout dal vostro DE (se usate KDE lasciate vuoto il campo)
        
File Paths

RULES
>> "suse-prime.conf"      /etc/modprobe.d/    ||  modprobe rules for boot and modesetting
        
EXECUTABLES
>> "vga"                 /usr/bin/           ||   executable tool, provides you all options
 
CONFIG_FILES
>> "config"              /etc/prime/         ||   main configuration file with all settings, DO NOT EDIT

>> "xorg-intel.conf"     /etc/prime/         ||   suse-prime xorg config file of SUSEPrime project (michalsrb)

>> "xorg-nvidia.conf"    /etc/prime/         ||   suse-prime xorg config file of SUSEPrime project (michalsrb)
 
 
 
SERVICES
 
>> "prime_logout.waiting"   /etc/prime/services/    ||   service that waits you logout to switch graphics

>> "prime_switch"           /etc/prime/services/    ||   core of entire script
 
>> "prime-select.sh"        /etc/prime/services/    ||   prime-select executable of SUSEPrime project (michalsrb)
  


SERVICES_CONFIG 

>> "prime_logout.waiting.service"    /etc/systemd/system/     ||   service that waits you logout to switch graphics [CONFIG]

>> "prime_switch.service"            /etc/systemd/system/     ||   core of entire script [CONFIG]
