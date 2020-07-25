# Jaribo Project

![Jaribo title](https://github.com/Frenzoid/jariboproject/blob/master/gitassets/3.jpg)
![Jaribo menu](https://github.com/Frenzoid/jariboproject/blob/master/gitassets/2.jpg)
![Jaribo menu](https://github.com/Frenzoid/jariboproject/blob/master/gitassets/2ENG.png)


The jaribo project was a 2015 - 2017 project that me and some friends made using what we barely knew of bash. 
The project was to make (using the [arp-sk](https://github.com/wi-fi-analyzer/arp-sk) [package](https://manned.org/arp-sk/99e329e1) for arp packages manipulation) a network jammer [doing ARP spoofing](https://en.wikipedia.org/wiki/ARP_spoofing).
![arp spoofing](https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/ARP_Spoofing.svg/1280px-ARP_Spoofing.svg.png)

The logic is simplistic, we would either target a specific device or the whole network, and using the arp, the program poisons the router's arp table.

This project is out of support, and its here just as a relic of old times.
(Also, all the interfaces are in Spanish)

## How to use

- Install the [arp-sk](http://sid.rstack.org/arp-sk/) package on your system (you'll need libnet v1.1 or higher), or download it and "makefile it" from [here](https://github.com/wi-fi-analyzer/arp-sk).
- Run jaribo.0.25T.sh `sudo ./jaribo.0.25T.sh`, since that one is the latest stable version of the project.
- Enter your router's ip address and network mask separeted by the bar `/` character. Example: `192.168.0.1/24`, 192.168.0.1 is the router address, and 24 is the network mask, when asked for data.
- Select your interface, usually it will be `eth0`.
- Use the program as you wish.

(This project depends on [net tools](https://packages.debian.org/stretch/net-tools)).

