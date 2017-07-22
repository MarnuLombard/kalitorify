## Mactorify v1.8.0

### Transparent proxy through Tor for MacOS
#### Fork for MacOS of [brainfucksec/kalitorify](https://github.com/brainfucksec/kalitorify)

### Install

#### Update system and run install.sh:
```bash
sudo apt-get update && sudo apt-get dist-upgrade -y

git clone https://github.com/MarnuLombard/mactorify

cd mactorify/
chmod +x install.sh
./install.sh
```


### Start program

#### Use help argument or run the program without arguments for help menu':
```bash
mactorify --help
...

└───╼ mactorify --argument

Arguments available:

--help      show this help message and exit
--start     start transparent proxy for tor
--stop      reset iptables and return to clear navigation
--status    check status of program and services
--checkip   check only public IP
--restart   restart tor service and change IP
--version   display program and tor version then exit

```


#### Start Transparent Proxy with --start argument
```bash
mactorify --start
...

:: Starting Transparent Proxy

```
 

#### [ NOTES ]

##### Mactorify is KISS version of Parrot AnonSurf Module, developed by "Pirates' Crew" of FrozenBox - https://github.com/parrotsec/anonsurf

##### Please note that this program isn't a final solution for a setup of anonimity at 100%, for more information about Tor configurations please read these docs:

**Tor Project wiki about Transparent Proxy:** 

https://trac.torproject.org/projects/tor/wiki/doc/TransparentProxy


**Whonix Do Not recommendations:**

https://www.whonix.org/wiki/DoNot


**Whonix wiki about Tor Entry Guards:**

https://www.whonix.org/wiki/<Tor id="Non-Persistent_Entry_Guards"></Tor>

https://forums.whonix.org/t/persistent-tor-entry-guard-relays-can-make-you-trackable-across-different-physical-locations/2090
