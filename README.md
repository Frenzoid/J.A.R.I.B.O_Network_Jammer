# Jaribo Project

![alt text](https://github.com/Frenzoid/jariboproject/blob/master/gitassets/3.jpg)
![alt text](https://github.com/Frenzoid/jariboproject/blob/master/gitassets/2.jpg)

The jaribo project was a 2015 - 2017 project that me and some friends made using what we barely knew of bash. 
The project was to make (using the [arp-sk](https://manned.org/arp-sk/99e329e1) package for arp  manipulations) a network jammer.

The logic is simplistic, we would either target a specific device or the whole network, and using the arp, the program poisons the router's arp table.

This project is out of support, and its here just as a relic of old times.
(Also, all the interfaces are in Spanish)

## How to use

- Install the [arp-sk](http://sid.rstack.org/arp-sk/) package on your sytem, or download it and "makefile it" from [here](http://brajddos.blogspot.com/2011/09/installing-arp-sk.html).
- Run jaribo.0.25T.sh `bash jaribo.0.25T.sh`, since that one is the latest stable version of the project.
- Enter your router's ip address and network mask separeted by the bar `/` character. Example: `192.168.0.1/24`, 192.168.0.1 is the router address, and 24 is the network mask.
- Select your interface, usually it will be `eth0`.
- Use the program as you wish.
