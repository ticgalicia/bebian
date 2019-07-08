#!/bin/bash
# -*- ENCODING: utf-8 -*-
version=2.0
menu=1;
echo $1;

#PARAMETROS SCRIPT:
RUTASCRIPT=$(readlink -f $0);
DIRECTORIO=$(cd "$(dirname "$0")"; pwd -P);
UPDATE="https://github.com/ticgalicia";
REPOSITORIO="http://www.pesadillo.com/ticgalicia";

#borrar leeme escritorio por defecto
if [ -f /home/usuario/Escritorio/leeme.txt ]; then
rm /home/usuario/Escritorio/leeme.txt
fi

#borrar ficheros antiguos
if [ -f /home/usuario/centros.sh ]; then
rm /home/usuario/centros.sh
fi
if [ -f /home/centros.sh ]; then
rm /home/centros.sh
fi
if [ -f /root/centros.sh ]; then
rm /root/centros.sh
fi
if [ -f /root/config.sh ]; then
rm /root/config.sh
fi
if [ -f $DIRECTORIO/vconfig.t ]; then
rm $DIRECTORIO/vconfig.t
fi
if [ -f $DIRECTORIO/setup.ver ]; then
rm $DIRECTORIO/setup.ver
fi

cp $RUTASCRIPT /root/
source /root/setup.sh

clear
if [ ! -f /media/usuario/TICGALICIA/setup.sh ]; then
    echo "ATENCION: No se encuentra el USB TICGALICIA! (almacen repositorio)"
else
echo "";
echo "";
fi

if [ -z "$1" ]
then

echo "                           CONFIGURADOR BEBIAN $version";
echo
echo
echo
echo
echo
echo
echo
echo "                    Preconfiguracion y adaptacion del equipo.";
echo "      Los procesos no se pueden detener y pueden desconfigurar el sistema.";
echo "               Cierra ahora esta ventana si no sabes como funciona.";
echo "             En cualquier momento puedes pulsar Ctrl+c para terminar.";
echo
echo
echo
echo
echo
echo
echo
echo
echo "Pulsa ENTER para continuar...\c";


	read pausa;
#liberar cache
apt-get autoclean
apt-get clean
fi
clear;
##.


# Ciclo programa
while true; do
clear;

##sin argumentos
if [ -z "$1" ]
then

echo "MENU $menu \c";

##menu1
if [ "$menu" = "1" ]
then
echo "(preconfiguracion)";
echo
if [ "$opcion1" = "1" ]
then
    echo "[x] 1: Cambiar pass ROOT.";
else
    echo "[ ] 1: Cambiar pass ROOT.";
fi
if [ "$opcion2" = "1" ]
then
    echo "[x] 2: Cambiar NOMBRE.";
else
    echo "[ ] 2: Cambiar NOMBRE.";
fi
if [ "$opcion3" = "1" ]
then
    echo "[x] 3: Asociar DNSs Xunta (solo red Xunta).";
else
    echo "[ ] 3: Asociar DNSs Xunta (solo red Xunta).";
fi
if [ "$opcion4" = "1" ]
then
    echo "[x] 4: Poner IP fija (en tarjeta LAN).";
else
    echo "[ ] 4: Poner IP fija (en tarjeta LAN).";
fi
if [ "$opcion5" = "1" ]
then
    echo "[x] 5: Asociar Hora a Internet.";
else
    echo "[ ] 5: Asociar Hora a Internet.";
fi
if [ "$opcion6" = "1" ]
then
    echo "[x] 6: Permitir root SSH y SSPASS.";
else
    echo "[ ] 6: Permitir root SSH y SSPASS.";
fi
if [ "$opcion7" = "1" ]
then
    echo "[x] 7: Programar autoapagado.";
else
    echo "[ ] 7: Programar autoapagado.";
fi
echo
echo
echo
echo
echo "INTRO: Menu 2 | \c";
##fin menu1
fi

##menu2
if [ "$menu" = "2" ]
then

echo "(especificos)";
echo

if [ "$opcion20" = "1" ]
then
    echo "[x] 20: Indicar servidor INTRANET (ip o servidor).";
else
    echo "[ ] 20: Indicar servidor INTRANET (ip o servidor).";
fi
if [ "$opcion21" = "1" ]
then
    echo "[x] 21: Instalar Congelador del sistema.";
else
    echo "[ ] 21: Instalar Congelador del sistema.";
fi
if [ "$opcion22" = "1" ]
then
    echo "[x] 22: Instalar EPOPTES Alumno.";
else
    echo "[ ] 22: Instalar EPOPTES Alumno.";
fi
if [ "$opcion23" = "1" ]
then
    echo "[x] 23: Instalar EPOPTES Profesor (SERVIDOR).";
else
    echo "[ ] 23: Instalar EPOPTES Profesor (SERVIDOR).";
fi
if [ "$opcion24" = "1" ]
then
    echo "[x] 24: Instalar Gestor de Impresoras.";
else
    echo "[ ] 24: Instalar Gestor de Impresoras.";
fi
if [ "$opcion25" = "1" ]
then
    echo "[x] 25: Crear acceso directo a carpeta de red.";
else
    echo "[ ] 25: Crear acceso directo a carpeta de red.";
fi
echo
echo
echo
echo
echo
echo "INTRO: Menu 3 | \c";
fi

##menu3
if [ "$menu" = "3" ]
then
echo "(aplicaciones)";
echo 
if [ "$opcion31" = "1" ]
then
    echo "[x] 31: Instalar Java.";
else
    echo "[ ] 31: Instalar Java.";
fi
if [ "$opcion32" = "1" ]
then
    echo "[x] 32: Instalar Acrobat Reader 9.5.";
else
    echo "[ ] 32: Instalar Acrobat reader 9.5.";
fi
if [ "$opcion33" = "1" ]
then
    echo "[x] 33: Instalar Libreoffice 6.1";
else
    echo "[ ] 33: Instalar Libreoffice 6.1";
fi
if [ "$opcion34" = "1" ]
then
    echo "[x] 34: Instalar Brasero (equivalente NERO)";
else
    echo "[ ] 34: Instalar Brasero (equivalente NERO)";
fi
echo
echo
echo
echo
echo
echo
echo
echo "INTRO: Menu 4 | \c";
fi

##menu4
if [ "$menu" = "4" ]
then
echo "(herramientas)";
echo
if [ "$opcion41" = "1" ]
then
    echo "[x] 41: Instalar Gparted.";
else
    echo "[ ] 41: Instalar Gparted.";
fi
if [ "$opcion42" = "1" ]
then
    echo "[x] 42: Instalar virtualbox-5.2.";
else
    echo "[ ] 42: Instalar virtualbox-5.2.";
fi
if [ "$opcion46" = "1" ]
then
    echo "[x] 46: Instalar Wireshark.";
else
    echo "[ ] 46: Instalar Wireshark.";
fi
if [ "$opcion47" = "1" ]
then
    echo "[x] 47: Instalar shutter.";
else
    echo "[ ] 47: Instalar shutter.";
fi
if [ "$opcion48" = "1" ]
then
    echo "[x] 48: Instalar Codelite.";
else
    echo "[ ] 48: Instalar Codelite.";
fi
if [ "$opcion49" = "1" ]
then
    echo "[x] 49: Instalar glade.";
else
    echo "[ ] 49: Instalar glade.";
fi
echo
echo
echo
echo
echo
echo "INTRO: Menu 5 | \c";
fi

##menu5
if [ "$menu" = "5" ]
then
echo "(navegadores)";
echo
if [ "$opcion51" = "1" ]
then
    echo "[x] 51: Instalar Opera.";
else
    echo "[ ] 51: Instalar Opera.";
fi
if [ "$opcion52" = "1" ]
then
    echo "[x] 52: Instalar Navegador Terminal W3m.";
else
    echo "[ ] 52: Instalar Navegador Terminal W3m.";
fi
if [ "$opcion53" = "1" ]
then
    echo "[x] 53: Instalar Navegador Terminal Lynx.";
else
    echo "[ ] 53: Instalar Navegador Terminal Lynx.";
fi
if [ "$opcion54" = "1" ]
then
    echo "[x] 54: Instalar Navegador Terminal Elinks.";
else
    echo "[ ] 54: Instalar Navegador Terminal Elinks.";
fi
if [ "$opcion55" = "1" ]
then
    echo "[x] 55: Instalar Navegador Tor.";
else
    echo "[ ] 55: Instalar Navegador Tor.";
fi
if [ "$opcion56" = "1" ]
then
    echo "[x] 56: Instalar Mozilla-esr.";
else
    echo "[ ] 56: Instalar Mozilla-esr.";
fi
echo
echo
echo
echo
echo
echo "INTRO: Menu 1 | \c";
fi

##menu6
if [ "$menu" = "6" ]
then
echo "(multimedia)";
echo
if [ "$opcion61" = "1" ]
then
    echo "[x] 61: Instalar codecks.";
else
    echo "[ ] 61: Instalar codecks.";
fi
if [ "$opcion62" = "1" ]
then
    echo "[x] 62: Instalar VLC.";
else
    echo "[ ] 62: Instalar VLC.";
fi
if [ "$opcion63" = "1" ]
then
    echo "[x] 63: Instalar Smplayer.";
else
    echo "[ ] 63: Instalar Smplayer.";
fi
if [ "$opcion64" = "1" ]
then
    echo "[x] 64: Instalar Parole.";
else
    echo "[ ] 64: Instalar Parole.";
fi
echo
echo
echo
echo
echo
echo "INTRO: Menu 1 | \c";
fi

##menu70
if [ "$menu" = "70" ]
then
echo "(servidores)";
echo
if [ "$opcion701" = "1" ]
then
    echo "[x] 701: Test Samba / Reiniciar Samba.";
else
    echo "[ ] 701: Test Samba / Reiniciar Samba.";
fi
if [ "$opcion702" = "1" ]
then
    echo "[x] 702: Instalar Samba.";
else
    echo "[ ] 702: Instalar Samba.";
fi
if [ "$opcion703" = "1" ]
then
    echo "[x] 703: Compartir carpeta Samba.";
else
    echo "[ ] 703: Compartir carpeta Samba.";
fi
if [ "$opcion704" = "1" ]
then
    echo "[x] 704: Cambiar nombre GRUPO trabajo Samba.";
else
    echo "[ ] 704: Cambiar nombre GRUPO trabajo Samba.";
fi
echo
echo
echo
echo
echo
echo
echo "INTRO: Menu 2 (servidores) | 0: Menu 0 | \c";
fi

##menu71
if [ "$menu" = "71" ]
then
echo "(servidores usuarios)";
echo
if [ "$opcion711" = "1" ]
then
    echo "[x] 711: Crear usuario.";
else
    echo "[ ] 711: Crear usuario.";
fi

if [ "$opcion712" = "1" ]
then
    echo "[x] 712: Crear grupo usuarios.";
else
    echo "[ ] 712: Crear grupo usuarios.";
fi

if [ "$opcion713" = "1" ]
then
    echo "[x] 713: Asignar grupo a usuario.";
else
    echo "[ ] 713: Asignar grupo a usuario.";
fi

if [ "$opcion714" = "1" ]
then
    echo "[x] 714: Mover usuario a un grupo.";
else
    echo "[ ] 714: Mover usuario a un grupo.";
fi

if [ "$opcion715" = "1" ]
then
    echo "[x] 715: Crear password a usuario Samba.";
else
    echo "[ ] 715: Crear password a usuario Samba.";
fi

if [ "$opcion719" = "1" ]
then
    echo "[x] 719: Instalar Gestor VISUAL de usuarios.";
else
    echo "[ ] 719: Instalar Gestor VISUAL de usuarios.";
fi
echo
echo
echo
echo
echo "INTRO: Menu 3 (servidores) | 0: Menu 0 | \c";
fi

##menu72
if [ "$menu" = "72" ]
then
echo "(servidores carpetas)";
echo
if [ "$opcion721" = "1" ]
then
    echo "[x] 721: Crear carpeta.";
else
    echo "[ ] 721: Crear carpeta.";
fi
if [ "$opcion722" = "1" ]
then
    echo "[x] 722: Modificar permisos carpeta.";
else
    echo "[ ] 722: Modificar permisos carpeta.";
fi
if [ "$opcion723" = "1" ]
then
    echo "[x] 723: Modificar propietario carpeta.";
else
    echo "[ ] 723: Modificar propietario carpeta.";
fi
if [ "$opcion724" = "1" ]
then
    echo "[x] 724: Modificar GRUPO carpeta.";
else
    echo "[ ] 724: Modificar GRUPO carpeta.";
fi
echo
echo
echo
echo
echo
echo
echo "INTRO: Menu 4 (servidores) | 0: Menu 0 | \c";
fi

##menu73
if [ "$menu" = "73" ]
then
echo "(carpetas servidores)";
echo
if [ "$opcion731" = "1" ]
then
    echo "[x] 731: Instalar servidor WEB (APACHE+MYSQL).";
else
    echo "[ ] 731: Instalar servidor WEB (APACHE+MYSQL).";
fi
if [ "$opcion732" = "1" ]
then
    echo "[x] 732: Instalar WORDPRESS (WEB).";
else
    echo "[ ] 732: Instalar WORDPRESS (WEB).";
fi
menu=69;
echo
echo
echo
echo
echo
echo
echo
echo
echo "INTRO: Menu 1 (servidores) | 0: Menu 0 | \c";
fi

##fin menus

echo "a: Ayuda. | i: Informacion | q: Salir.";
echo


	echo "Opcion: \c";
	read opcion;
	clear;
##fin sin argumentos
else
    opcion=$1;
    escape=1;
fi


##vemos opcion escogida
case $opcion in

##Opcion 1
1)
echo "Cambiando pass ROOT...";
passwd
clear;
echo "PASS CAMBIADA";
opciones=$opciones"1";
sleep 1
opcion1="1";
;;


##Opcion 2
2)
echo "Editando nombre del equipo...";
hostn=$(cat /etc/hostname);
sleep 1
echo "NOMBRE ACTUAL DEL EQUIPO $hostn";
echo "Indique NUEVO nombre del equipo: \c";
read nombre;
echo $nombre > /etc/hostname;
sed -i "s/$hostn/$nombre/g" /etc/hosts;
hostn=$(cat /etc/hostname);
clear;
echo "NOMBRE ACTUAL DEL EQUIPO $hostn";
sleep 1
opcion2="1";
;;


##Opcion 3
3)
echo "nameserver 10.180.188.75">> /etc/resolv.conf;
echo "nameserver 10.180.188.43">> /etc/resolv.conf;
opcion3="1";
;;

##Opcion 4
4)
clear;
echo
echo "ATENCION...";
echo
echo "La configuracion de red se realizara sobre tarjeta de red cableada eth0"
echo "en el fichero /etc/network/interfaces y no aparecerá en"
echo "el boton -editar conexiones-"
echo
echo "Si quieres configurar la ip de forma manual para poder manipularla luego,"
echo "realiza la configuracion a traves del boton -editar conexiones- al lado del reloj."
echo
echo "Si es la primera configuracion del fichero /etc/network/interfaces..."
echo "En el fichero /etc/NetworkManager/NetworkManager.conf"
echo "el parametro [ifupdown] managed=false debe estar en false"
echo
echo "EL EQUIPO SE REINICIARA TRAS CONFIGURAR LA TARJETA."
echo
echo "Pulse ENTER \c"
read pausa;
clear;
echo "Configurando fichero /etc/network/interfaces ..."
echo
echo "Indica los tres primeros parametros de la RED (ej 192.168.1): \c";
read iptipo;
echo "Indica ultimo digito de la IP del equipo (ej 5): \c";
read ipequipo;
echo "Indica el digito de la PUERTA (ej 1): \c";
read ippta;
clear
echo "ATENCION!. Deseas guardar estos parametros?:";
echo
echo "allow-hotplug eth0";
echo "iface eth0 inet static";
echo "address $iptipo.$ipequipo";
echo "netmask 255.255.255.0";
echo "network $iptipo.0";
echo "gateway $iptipo.$ippta";
echo
echo
echo "Deseas guardar estos parametros (S/N)?: \c";
read confIP;
if [ "$confIP" = "S" ]
then
##auto eth0>> /etc/network/interfaces;
echo "##INSERTADO DESDE AQUI">> /etc/network/interfaces;
echo "allow-hotplug eth0">> /etc/network/interfaces;
echo "iface eth0 inet static">> /etc/network/interfaces;
echo "address $iptipo.$ipequipo">> /etc/network/interfaces;
echo "netmask 255.255.255.0">> /etc/network/interfaces;
echo "network $iptipo.0">> /etc/network/interfaces;
echo "gateway $iptipo.$ippta">> /etc/network/interfaces;
echo "##INSERTADO HASTA AQUI">> /etc/network/interfaces;
echo "Parametros guardados.";
echo "Pulsa ENTER para reiniciar el equipo...\c";
read pausa
opcion4="1";
reboot
else
echo "No se ha modificado el fichero.";
read pausa
fi
echo
;;

##Opcion -4
-4)
clear;
nano /etc/network/interfaces
opcion4="";
;;

##Opcion 5
5)
apt-get -y install ntp
echo "server hora.roa.es" >> /etc/ntp.conf;
echo "server hora.rediris.es" >> /etc/ntp.conf;
echo "server es.pool.ntp.org" >> /etc/ntp.conf;
chkconfig ntp on
/etc/init.d/ntp restart
echo "Modificado.";
sleep 1
opcion5="1";
;;

##Opcion 6
6)
esto="PermitRootLogin without-password";
poresto="PermitRootLogin yes";
sed -i "s/$esto/$poresto/g" /etc/ssh/sshd_config;
apt-get -y install sshpass
echo "Modificado e instalado.";
sleep 1
opcion6="1";
;;
##Opcion -6
-6)
nano /etc/ssh/sshd_config;
sleep 1
;;


##Opcion 7
7)
echo "Introduzca la hora en la que se apagará el equipo todos los dias";
echo "de forma automatica. El equipo no pedira confirmacion.";
echo "Ej : 15 para apagarse a las 3 de la tarde";
echo
echo
echo "Introduzca la hora: \c";
read hora
clear;
echo "Ej : 00 para apagarse en punto";
echo "Introduzca los minutos: \c";
read minuto
echo "##programado un autoapagado" >> /var/spool/cron/crontabs/usuario;
crontab -l > mycron
echo "$minuto $hora * * * /sbin/shutdown -h now" >> mycron
crontab mycron
rm mycron
opcion7="1";
;;
##Opcion -7
-7)
echo "Modificando crontab -e...";
sleep 1
crontab -e
clear
echo "Modificado!";
sleep 1
opcion7="0";
;;





##Opcion wifi
wifi)

echo "##WIFI##">> /etc/apt/sources.list;
echo "deb http://deb.debian.org/debian stretch main contrib non-free">> /etc/apt/sources.list;
echo "deb-src  http://deb.debian.org/debian stretch main contrib non-free">> /etc/apt/sources.list;
echo "deb http://deb.debian.org/debian stretch-updates main contrib non-free">> /etc/apt/sources.list;
echo "deb-src  http://deb.debian.org/debian stretch-updates main contrib non-free">> /etc/apt/sources.list;
echo "deb http://security.debian.org/ stretch/updates main contrib non-free">> /etc/apt/sources.list;
echo "deb-src http://security.debian.org/ stretch/updates main contrib non-free">> /etc/apt/sources.list;

apt-get update;
apt-get install upgrade;
apt-get install firmware-iwlwifi;
modprobe -r iwlwifi;
modprobe iwlwifi;
;;
##Opcion-wifi
-wifi)
nano /etc/apt/sources.list;
;;


##Opcion sshpass
sshpass)
apt-get -y install sshpass
echo "Instalado!";
sleep 1
opcion88="1";
;;

##Opcion -sshpass
-sshpass)
apt-get -y remove sshpass
echo "Modificado!";
sleep 1
opcion88="1";
;;


##Opcion 88
transferir)
echo "Pass ROOT: \c";
read passroot
echo "Ruta completa fichero: \c";
read fichero
echo "Ruta completa destino: \c";
read destino
echo "Primera parte de IP X.X.X.:";
read ipformato
echo "IP INICIO: \c";
read ipinicio
echo "IP FINAL: \c";
read ipfinal
sshpass -p "$passroot" scp $fichero root@$ipformato$ipinicio:$destino
opcion88="1";
;;


##Opcion 88
ssh)
echo "Pass ROOT: \c";
read passroot
echo "IP MODELO xx.xx.xx \c";
read ipm
echo "IP INICIAL \c";
read ipini
echo "IP FINAL \c";
read ipfin
echo "COMANDO: \c";
read comandossh
while [ $ipini -le $ipfin ]; do
    echo  "$ipini"
    sshpass -p $passroot ssh root@$ipm.$ipini $comandossh
    ##notify-send Hola $ipini
    sleep 1
    ipini=$(( ipini + 1 ))
    clear;
    sleep 1
done

;;


##Opcion 20
20)
clear;
echo "Indique ip equipo intranet: \c";
read intranetip;
echo $intranetip"        "intranet >> /etc/hosts;
opcion20="1";
;;
##Opcion -20
-20)
nano /etc/hosts
;;

##Opcion 21
21)
echo "ATENCION, esta aplicacion ya se encuentra instalada en BEBIAN";
echo "Pulse una tecla para continuar...";
read pausa
wget -q http://goo.gl/V94QS -O ofris.deb
dpkg -iG ofris.deb
echo "Instalado";
sleep 2
clear
ofris-en
opcion21="1";
;;
##Opcion -21
-21)
echo "Borrando...";
sleep 1
apt-get remove ofris
clear
echo "Borrado";
sleep 1
opcion21="0";
;;

##Opcion 22
22)
apt-get -y update
apt-get -y install epoptes-client
gpasswd -a usuario epoptes
echo "Indique IP del SERVIDOR EPOPTES: \c";
read ipepoptes;
esto="SERVER=";
poresto="#SERVER=";
sed -i "s/$esto/$poresto/g" /etc/default/epoptes-client;
echo "SERVER="$ipepoptes >> /etc/default/epoptes-client;
echo "Modificado.";
sleep 1
clear;
echo "Verifica que ha registrado la maquina -succes-.";
echo "De lo contrario realiza el proceso de forma manual.";
echo "apt-get update y luego apt-get install epoptes-client";
echo "luego ejecuta de nuevo el script.";
echo "Recuerda reiniciar la maquina.";
echo "Ctrl+c para cerrar el Script";
epoptes-client -c
epoptes-client
read pausa
opcion22="1";
;;


##Opcion 23
23)
apt-get -y install epoptes
gpasswd -a usuario epoptes
echo "Instalado.";
sleep 1
clear;
echo "Recuerda reiniciar la maquina.";
sleep 2
opcion23="1";
;;

##Opcion 24
24)
echo "Instalando...";
sleep 1
apt-get update
apt-get -y install cups
/etc/init.d/cups restart
echo "Instalado";
opcion16="1";
;;


##Opcion 25
25)
echo "Creando acceso..";
sleep 1
clear;
echo "NOMBRE a mostrar (EJ compartido): \c";
read NOMBREREC;
clear;
echo "RUTA (ej smb://192.168.xx.xx/compartido): \c";
read RUTASMB;
echo "[Desktop Entry]">> /home/usuario/Escritorio/$NOMBREREC.desktop;
echo "Name=$NOMBREREC">> /home/usuario/Escritorio/$NOMBREREC.desktop;
echo "Icon=folder-remote-symbolic">> /home/usuario/Escritorio/$NOMBREREC.desktop;
echo "Type=Application">> /home/usuario/Escritorio/$NOMBREREC.desktop;
echo "Exec=nautilus --browser $RUTASMB">> /home/usuario/Escritorio/$NOMBREREC.desktop;
echo "StartupNotify=false">> /home/usuario/Escritorio/$NOMBREREC.desktop;
echo "Terminal=false">> /home/usuario/Escritorio/$NOMBREREC.desktop;
echo "Comment=">> /home/usuario/Escritorio/$NOMBREREC.desktop;
echo "Path=">> /home/usuario/Escritorio/$NOMBREREC.desktop;
clear;
chmod 777 /home/usuario/Escritorio/$NOMBREREC.desktop;
echo "Creado!";
sleep 1
opcion25="1";
;;

##Opcion 31
31)
echo "Instalando Java...";
sleep 1
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
apt-get -y update
apt-get -y install oracle-java8-installer
clear;
echo "Instalado";
sleep 1
opcion31="1";
;;
##Opcion -31
-31)
echo "Borrando...";
sleep 1
apt-get remove oracle-java8-installer
clear
echo "Borrado";
sleep 1
opcion31="0";
;;
##Opcion 32
32)
echo "Instalando Acrobat Reader...";
sleep 1
wget http://ardownload.adobe.com/pub/adobe/reader/unix/9.x/9.5.5/enu/AdbeRdr9.5.5-1_i386linux_enu.deb
apt-get update
dpkg -iG AdbeRdr9.5.5-1_i386linux_enu.deb
rm AdbeRdr9.5.5-1_i386linux_enu.deb
clear
echo "Instalado!.";
sleep 1
opcion32="1";
;;
##Opcion -32
-32)
echo "Borrando...";
sleep 1
apt-get remove adobereader-enu
clear
echo "Borrado";
sleep 1
opcion32="0";
;;

##Opcion 33
33)
wget http://ftp.uvigo.es/tdf/libreoffice/stable/
mv index.html tmp1.txt
sed '1,8 d' tmp1.txt | cut -d '"' -f 6 | cut -d '"' -f 1 | sed '$d' | sed '$d'> tmp2.txt;
sed -n '$p' tmp2.txt | cut -d '/' -f 1 > tmp3.txt;
libversion=$( cat tmp3.txt )
echo "version: "$libversion;
rm tmp*.txt

##libversion="6.2.2";
clear
echo "Instalando Libreoffice version "$libversion" del FTP UVIGO ";
sleep 2
wget "http://ftp.uvigo.es/tdf/libreoffice/stable/"$libversion"/deb/x86/LibreOffice_""$libversion""_Linux_x86_deb.tar.gz"
tar -xzvf LibreOffice_"$libversion"_Linux_x86_deb.tar.gz
dpkg -i LibreOffice_"$libversion".2_Linux_x86_deb/DEBS/*.deb
wget "http://ftp.uvigo.es/tdf/libreoffice/stable/"$libversion"/deb/x86/LibreOffice_"$libversion"_Linux_x86_deb_helppack_es.tar.gz" 
tar -xzvf LibreOffice_"$libversion"_Linux_x86_deb_helppack_es.tar.gz
dpkg -i LibreOffice_"$libversion".2_Linux_x86_deb_helppack_es/DEBS/*.deb
wget "http://ftp.uvigo.es/tdf/libreoffice/stable/"$libversion"/deb/x86/LibreOffice_"$libversion"_Linux_x86_deb_langpack_es.tar.gz"
tar -xzvf LibreOffice_"$libversion"_Linux_x86_deb_langpack_es.tar.gz
dpkg -i LibreOffice_"$libversion".2_Linux_x86_deb_langpack_es/DEBS/*.deb
rm -R LibreOffice_6.*
echo "Instalado!.";
sleep 1
opcion33="1";
;;

-33)
echo "Borrando...";
sleep 1
apt-get -y remove --purge libreoffice*
apt-get -y clean
apt-get -y autoremove
clear
echo "Borrado";
sleep 1
opcion33="0";
;;


##Opcion 34
34)
echo "Instalando Brasero...";
sleep 1
apt-get install brasero
echo "Instalado!.";
sleep 1
opcion34="1";
;;

-34)
echo "Borrando...";
sleep 1
sudo apt-get -y remove --purge brasero
apt-get clean
apt-get autoremove
clear
echo "Borrado";
sleep 1
opcion34="0";
;;

##Opcion 41
41)
echo "Instalando...";
sleep 1
apt-get -y install gparted
clear
echo "Instalado";
sleep 1
opcion41="1";
;;
##Opcion -41
-41)
echo "Quitando...";
sleep 1
sudo apt-get remove gparted
clear
echo "Instalado";
sleep 1
opcion41="0";
;;
##Opcion 42
42)
wget https://download.virtualbox.org/virtualbox/5.2.22/virtualbox-5.2_5.2.22-126460~Debian~jessie_i386.deb
dpkg -iG virtualbox-5.2_5.2.22-126460~Debian~jessie_i386.deb
rm virtualbox-5.2_5.2.22-126460~Debian~jessie_i386.deb
sleep 2
echo "Hecho!";
echo "Instalado!";
sleep 1
opcion42="1";
;;

##Opcion 46
46)
echo "Instalando...";
sleep 1
apt-get update
apt-get install Wireshark
echo "Instado!";
sleep 1
opcion46="1";
;;
-46)
echo "Quitando...";
sleep 1
sudo apt-get remove Wireshark
clear
echo "Borrado";
sleep 1
opcion46="0";
;;

##Opcion 47
47)
echo "Instalando...";
sleep 1
apt-get update
apt-get install shutter
echo "Instado!";
sleep 1
opcion47="1";
;;
-47)
echo "Quitando...";
sleep 1
sudo apt-get remove shutter
clear
echo "Borrado";
sleep 1
opcion47="0";
;;

##Opcion 48
48)
echo "Instalando...";
sleep 1
apt-get update
apt-get install Codelite
echo "Instado!";
sleep 1
opcion48="1";
;;
-48)
echo "Quitando...";
sleep 1
sudo apt-get remove Codelite
clear
echo "Borrado";
sleep 1
opcion48="0";
;;

##Opcion 49
49)
echo "Instalando...";
sleep 1
apt-get update
apt-get install glade
echo "Instado!";
sleep 1
opcion49="1";
;;
-49)
echo "Quitando...";
sleep 1
sudo apt-get remove glade
clear
echo "Borrado";
sleep 1
opcion48="0";
;;

##Opcion 51
51)
echo "Instalando Opera..."
if [ ! -f /media/usuario/TICGALICIA/repositorio/opera/opera_stable_41_0_2353_46_i386.deb ]; then
echo "Necesita conexion internet";
echo "Deseas continuar (S/N)?: \c";
read continuar;
if [ "$continuar" = "S" ]
then
wget $REPOSITORIO/repository/opera_stable_41_0_2353_46_i386.deb
apt-get install apt-transport-https
dpkg -iG opera_stable_41_0_2353_46_i386.deb
rm opera_stable_41_0_2353_46_i386.deb
echo "Instalado";
else
echo "No se ha modificado.";
continuar="";
echo "Pulsa ENTER...";
read pausa
fi
else
sh /media/usuario/TICGALICIA/repositorio/opera/opera_stable_41_0_2353_46_i386.deb
echo "Instalado";
opcion51="1";
fi
sleep 1
;;
##Opcion 51
-51)
echo "Quitando...";
sleep 1
dpkg -r opera-stable
dpkg --purge opera-stable
clear
echo "Borrado";
sleep 1
opcion51="0";
;;

##Opcion 52
52)
echo "Instalando...";
sleep 1
sudo apt-get -y install w3m
clear
echo "Instalado";
sleep 1
opcion52="1";
;;
##Opcion 52
-52)
echo "Quitando...";
sleep 1
sudo apt-get remove w3m
clear
echo "Borrado";
sleep 1
opcion52="0";
;;

##Opcion 53
53)
echo "Instalando...";
sleep 1
sudo apt-get -y install lynx
clear
echo "Instalado";
sleep 1
opcion53="1";
;;
##Opcion 53
-53)
echo "Quitando...";
sleep 1
sudo apt-get remove lynx
clear
echo "Borrado";
sleep 1
opcion53="0";
;;

##Opcion 54
54)
echo "Instalando...";
sleep 1
sudo apt-get -y install elinks
clear
echo "Instalado";
sleep 1
opcion54="1";
;;
##Opcion 54
-54)
echo "Quitando...";
sleep 1
sudo apt-get remove elinks
clear
echo "Borrado";
sleep 1
opcion54="0";
;;

##Opcion 55
55)
echo "Descargar...";
sleep 1
printf "deb http://deb.debian.org/debian jessie-backports main contrib\n" > /etc/apt/sources.list.d/jessie-backports.list
printf "deb http://deb.debian.org/debian jessie-backports-sloppy main contrib" >> /etc/apt/sources.list.d/jessie-backports.list
apt-get update
apt-get install torbrowser-launcher -t jessie-backports-sloppy
torbrowser-launcher
echo "Instado!";
sleep 1
opcion55="1";
;;
##Opcion -55
-55)
echo "Quitando...";
sleep 1
sudo apt-get remove torbrowser-launcher
clear
echo "Borrado";
sleep 1
opcion55="0";
;;

##Opcion 56
56)
echo "Instalando...";
sleep 1
sudo apt-get -y install firefox-esr
clear
echo "Instalado";
sleep 1
opcion56="1";
;;
##Opcion -56
-56)
echo "Quitando...";
sleep 1
apt-get remove firefox-esr
apt-get purge firefox-esr
rm -R /home/usuario/.mozilla
clear
echo "Borrado";
sleep 1
opcion56="0";
;;


##Opcion 59
59)
echo "Descargando...";
sleep 1
wget http://ftp.es.debian.org/debian/pool/contrib/f/flashplugin-nonfree/flashplugin-nonfree_3.6.1+deb8u1_i386.deb
dpkg -iG flashplugin-nonfree_3.6.1+deb8u1_i386.deb
wget http://archive.canonical.com/ubuntu/pool/partner/a/adobe-flashplugin/adobe-flashplugin_20160712.1-0ubuntu0.15.10.1_i386.deb
dpkg -iG adobe-flashplugin_20160712.1-0ubuntu0.15.10.1_i386.deb
clear
echo "Descargado";
rm adobe-flashplugin_20160712.1-0ubuntu0.15.10.1_i386.deb
sleep 1
opcion88="1";
;;




##Opcion 61
61)
echo "Instalando...";
sleep 1
apt-get update
apt-get -y install deb-multimedia-keyring
apt-get update
apt-get -y install libfaad2 libmp4v2-2 libfaac0 alsa-utils lame libmp3lame0 libdvdnav4 libdvdread4 libdvdcss2 w32codecs ffmpeg memcodec mplayer2 
apt-get -y install phonon-backend-vlc mpeg2dec gpac x264
clear
echo "Instalado";
sleep 1
opcion61="1";
;;


##Opcion 62
62)
echo "Instalando...";
sleep 1
apt-get -y install vlc
clear
echo "Instalado";
sleep 1
opcion62="1";
;;
##Opcion -62
-62)
echo "Quitando...";
sleep 1
apt-get remove vlc
apt-get purge vlc
clear
echo "Borrado";
sleep 1
opcion62="0";
;;

##Opcion 63
63)
echo "Instalando...";
sleep 1
sudo apt-get -y install smplayer
clear
echo "Instalado";
sleep 1
opcion63="1";
;;
##Opcion -63
-63)
echo "Quitando...";
sleep 1
apt-get remove smplayer
apt-get purge smplayer
clear
echo "Borrado";
sleep 1
opcion63="0";
;;

##Opcion 64
64)
echo "Instalando...";
sleep 1
sudo apt-get -y install parole
clear
echo "Instalado";
sleep 1
opcion64="1";
;;
##Opcion -64
-64)
echo "Quitando...";
sleep 1
apt-get remove parole
apt-get purge parole
clear
echo "Borrado";
sleep 1
opcion64="0";
;;



##Opcion 701
701)
echo "Test Samba...";
sleep 1
service samba status
echo "Verifica el estado del servicio Samba.";
sleep 3
echo "Reiniciando Samba si instalado..."
/etc/init.d/samba restart
sleep 3
opcion701="1";
;;

##Opcion 702
702)
echo "Instalacion de Samba...";
sleep 1
apt-get -y install samba
echo "Instalado!.";
sleep 1
opcion702="1";
;;

##Opcion 703
703)
echo "Editando Samba...";
sleep 1
clear;
echo "NOMBRE del recurso (EJ compartido) \c";
read NOMBREREC;
clear;
echo "La carpeta se va a crear en /home y sera accesible para el grupo usuarios";
echo "ATENCION se crea con todos los permisos (777). Luego pueden cambiarse";
echo "NOMBRE de la CARPETA a crear (ej: USUARIOS): \c";
read NOMBRECAR;

mkdir /home/$NOMBRECAR
chmod 777 /home/$NOMBRECAR

esto=";   read only = yes";
poresto=";   read only = yes \n \n##INSERTADO##";
sed -i "s/$esto/$poresto/g" /etc/samba/smb.conf;

esto="##INSERTADO##";
poresto="##INSERTADO## \nbrowseable = yes";
sed -i "s/$esto/$poresto/g" /etc/samba/smb.conf;

esto="##INSERTADO##";
poresto="##INSERTADO## \nwriteable = yes";
sed -i "s/$esto/$poresto/g" /etc/samba/smb.conf;

esto="##INSERTADO##";
poresto="##INSERTADO## \nguest ok = no";
sed -i "s/$esto/$poresto/g" /etc/samba/smb.conf;

esto="##INSERTADO##";
poresto="##INSERTADO## \nvalid users = +usuarios";
sed -i "s/$esto/$poresto/g" /etc/samba/smb.conf;

esto="##INSERTADO##";
poresto="##INSERTADO## \npath = \/home\/$NOMBRECAR";
sed -i "s/$esto/$poresto/g" /etc/samba/smb.conf;

esto="##INSERTADO##";
poresto="##INSERTADO## \ncomment = Servidor de carpetas";
sed -i "s/$esto/$poresto/g" /etc/samba/smb.conf;

esto="##INSERTADO##";
poresto="##INSERTADO## \n[$NOMBREREC]";
sed -i "s/$esto/$poresto/g" /etc/samba/smb.conf;

esto="##INSERTADO##";
poresto="\n";
sed -i "s/$esto/$poresto/g" /etc/samba/smb.conf;
clear;
echo "Editado!.";
sleep 3
opcion703="1";
;;

##Opcion -703
-703)
echo "Editando Samba...";
sleep 1
echo "Edita el apartado [netlogon] indicando la ruta de la carpeta compartida";
echo "Pulsa ENTER para EDITAR...";
read pauda;
nano /etc/samba/smb.conf
echo "Editado!.";
sleep 1
opcion703="0";
;;

##Opcion 704
704)
echo "Editando nombre del grupo de red...";
sleep 1
echo "NOMBRE del GRUPO: \c";
read NOMBREGRUPO;
esto="   workgroup = WORKGROUP";
poresto="   workgroup = $NOMBREGRUPO";
sed -i "s/$esto/$poresto/g" /etc/samba/smb.conf;
echo "Editado!.";
sleep 1
opcion704="0";
;;


##Opcion 711
711)
echo "Crear usuario...";
echo "NOMBRE del USUARIO: \c";
read NOMBREUSUARIO;
sleep 1
clear
adduser $NOMBREUSUARIO;
opcion711="1";
echo "Hecho!.";
sleep 1
;;

##Opcion -711
-711)
echo "Borrar usuario (y su home)...";
echo "NOMBRE del USUARIO: \c";
read NOMBREUSUARIO;
sleep 1
clear;
skill $NOMBREUSUARIO; 
sleep 2;
deluser --remove-home $NOMBREUSUARIO;
sleep 1
opcion711="0";
echo "En caso de error, reinicia el equipo antes de ejecutar el comando.";
sleep 1
;;

##Opcion 712
712)
echo "Crear grupo...";
echo "NOMBRE del GRUPO: \c";
read NOMBREGRUPO;
sleep 1
clear
groupadd $NOMBREGRUPO;
opcion712="1";
echo "Hecho!.";
sleep 1
;;


##Opcion 713
713)
echo "Asignar grupo...";
echo "NOMBRE del USUARIO: \c";
read USUARIO;
echo "NOMBRE del GRUPO: \c";
read NOMBREGRUPO;
sleep 1
clear
usermod -a -G $NOMBREGRUPO $USUARIO;
opcion713="1";
echo "Hecho!.";
sleep 1
;;

##Opcion 714
714)
echo "Mover de grupo...";
echo "NOMBRE del USUARIO: \c";
read USUARIO;
echo "MOVER a GRUPO: \c";
read NOMBREGRUPO;
sleep 1
clear
usermod -g $NOMBREGRUPO $USUARIO;
opcion714="1";
echo "Hecho!.";
sleep 1
;;

##Opcion 715
715)
echo "Creando password...";
echo "NOMBRE del USUARIO: \c";
read USUARIO;
smbpasswd -a $USUARIO
opcion715="1";
echo "Hecho!.";
sleep 1
echo "Reinicia el samba...";
echo "Pulsa una tecla para continuar.";
read pausa
;;


##Opcion 719
719)
echo "Instalando...";
sleep 1
apt-get -y install gnome-system-tools
echo "Instalado!.";
sleep 1
opcion719="1";
;;
##Opcion -719
-719)
echo "Borrando...";
sleep 1
apt-get -y remove gnome-system-tools
echo "Borrado!.";
sleep 1
opcion719="0";
;;

##Opcion 721
721)
echo "Crear carpetas...";
sleep 1
clear
echo "NOMBRE de la carpeta (ej /home/USUARIOS): \c";
read NOMBRECARPETA;
NOMBRECARPETA=$(echo "$NOMBRECARPETA" | sed "#/#/\#g"); 
mkdir "$NOMBRECARPETA";
sleep 1
opcion721="1";
echo "Hecho!.";
sleep 1
;;

##Opcion 722
722)
echo "Editando permisos a carpetas...";
sleep 1
echo "NOMBRE de la carpeta (ej /home/USUARIOS): \c";
read NOMBRECARPETA;
NOMBRECARPETA=$(echo "$NOMBRECARPETA" | sed "#/#/\#g");
clear
echo "ABC A=Propietario B=Grupos C=usuarios"
echo "0 = Sin acceso	4 = lectura"
echo "1 = ejecucion	5 = lectura y ejecucion"
echo "2 = escritura	6 = lectura y escritura"
echo "3 = escritura y ejecucion	7 = lectura, escritura y ejecucion"
echo 
echo "ejemplos:"
echo "777 - Escritura, lectura y ejecucion Todos."
echo "666 - Escritura, lectura Todos."
echo "700 - Solo el propietario."
echo "740 - Propietario control total, el grupo ve, pero no accede."
echo
echo "Asignar permisos: \c"
read PERMISO
chmod $PERMISO "$NOMBRECARPETA"
sleep 1
opcion722="1";
echo "Hecho!.";
sleep 1
;;

##Opcion 723
723)
echo "Asignar propietario...";
sleep 1
clear
echo "NOMBRE de la carpeta (ej /home/USUARIOS): \c";
read NOMBRECARPETA;
NOMBRECARPETA=$(echo "$NOMBRECARPETA" | sed "#/#/\#g");
echo "PROPIETARIO: \c";
read PROPIETARIO;
chown -R $PROPIETARIO "$NOMBRECARPETA" 
sleep 1
opcion723="1";
echo "Hecho!.";
sleep 1
;;

##Opcion 724
724)
echo "Asignar grupo...";
sleep 1
clear
echo "NOMBRE de la carpeta (ej /home/USUARIOS): \c";
read NOMBRECARPETA;
NOMBRECARPETA=$(echo "$NOMBRECARPETA" | sed "#/#/\#g");
echo "GRUPO: \c";
read GRUPO;
chgrp -R $GRUPO "$NOMBRECARPETA" 
sleep 1
opcion724="1";
echo "Hecho!.";
sleep 1
;;




##Opcion 731
731)
apt-get -y update
apt-get -y install apache2
apt-get -y install mysql-server mysql-common mysql-client
echo "Apunta el pass!";
echo "Ahora terminaremos de configurar el APACHE. Seguir...";
read pausa;
clear;
apt-get -y install php5 libapache2-mod-php5
apt-get install php5-mysqlnd-ms
echo ";;extensiones TICGALICIA;;" >> /etc/php5/apache2/php.ini;
echo "extension=msql.so" >> /etc/php5/apache2/php.ini;
echo "extension=mysql.so" >> /etc/php5/apache2/php.ini;
echo ";;extensiones TICGALICIA;;" >> /etc/php5/cli/php.ini;
echo "extension=msql.so" >> /etc/php5/cli/php.ini;
echo "extension=mysql.so" >> /etc/php5/cli/php.ini;


clear;
echo "Reiniciando los servicios ...";
sleep 1
service apache2 reload
service apache2 restart
service mysql restart
clear;
echo "Servidor WEB instalado en /var/www";
echo "Ya puedes generar tu página web en el directorio.";
echo "Escribe localhost en el navegador para verificar que funciona.";
echo "Listo!";
sleep 2
opcion731="1";
;;

##Opcion -731
-731)
apt-get -y update
apt-get -y remove apache2
apt-get -y remove mysql-server
apt-get -y remove mysql-common
apt-get -y remove mysql-client
echo "Desinstalado!";
sleep 2
opcion731="0";
;;

##Opcion 732
732)
echo "Instalando Wordpress...";
echo
echo "Instalando php5-Mysql";
echo
apt-get -y install php5-mysql
clear;
echo "Vamos a descargar Wordpress del repositorio...";
echo "Pulsa ENTER para continuar...";
read pausa;
wget https://es.wordpress.org/wordpress-4.5.3-es_ES.tar.gz
clear;
echo "Decomprimiendo a la carpeta /var/www/html/...";
echo
tar -xzvf wordpress-4.5.3-es_ES.tar.gz --directory /var/www/
clear;
echo
echo "Borrando descarga y preparando directorio...";
rm -r wordpress-4.5.3-es_ES.tar.gz
rm -rf /var/www/html
mv /var/www/wordpress /var/www/html
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
clear;
echo "Editando el fichero de configuracion ...";
sleep 1
esto="nombredetubasededatos";
poresto="wordpress";
sed -i "s/$esto/$poresto/g" /var/www/html/wp-config.php;

esto="nombredeusuario";
poresto="wpress";
sed -i "s/$esto/$poresto/g" /var/www/html/wp-config.php;

esto="tu frase aleatoria";
poresto="una frase aleatoria para generar una llave";
sed -i "s/$esto/$poresto/g" /var/www/html/wp-config.php;
clear;
echo "ATENCION, revisa la configuracion del fichero y cambia la palabra 'contrasena' por la de MYSQL.";
echo
echo "Pulsa una tecla para editar el fichero de configuracion /var/www/html/wp-config.php"
echo
read pausa
nano /var/www/html/wp-config.php
clear;
echo "ATENCION, Vamos a configurar la base de datos:";
echo
echo "Pulsa ENTER para continuar...";
read pausa
clear;
echo
echo "Cual es la pass del root de MYSQL? (de la instalacion mysql):";
read passroot;
clear;
echo
echo "Abre un nuevo terminal y copia los siguientes comandos linea por linea:"
echo
echo
echo "mysql -u root -p"
echo "CREATE USER 'wpress'@'localhost' IDENTIFIED BY '$passroot';"
echo "CREATE DATABASE wordpress;"
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'wpress'@'localhost';"
echo "FLUSH PRIVILEGES;"
echo "exit"
echo
echo "Una vez realizados estos comandos, abrimos la web localhost para terminar la instalacion."
echo
echo "Pulsa ENTER para continuar...";
read pausa
/usr/bin/firefox  http://localhost
sleep 2
echo "Modificado.";
sleep 1
clear;
echo
echo "Revisa la configuracion general de la pagina para que funcione correctamente la ruta.";
echo "Sustituye http://localhost si vas a ver la web desde otros equipos por la ruta a utilizar.";
echo
echo "Por ejemplo 'http://intranet' y modifica los ficheros host de los equipos clientes.";
echo "Por ejemplo 'http://10.xx.xx.xx' indicando la ip fija del servidor, notificala a los usuarios.";
echo
echo "Pulsa ENTER para continuar...";
read pausa
clear;
/usr/bin/firefox  http://localhost/wp-admin/options-general.php

echo "Reiniciando los servicios ...";
sleep 1
service apache2 reload
service apache2 restart
service mysql restart
clear;
echo "La pagina ya esta instalada. Escriba localhost o el nombre configurado en el navegador.";
echo
echo "Pulsa ENTER para continuar...";
read pausa
opcion732="1";
;;
##Opcion -732
-732)
apt-get -y update
apt-get -y remove php5-mysql
echo "Desinstalado!";
sleep 2
clear;
echo "ATENCION vamos a borrar la carpeta que contiene la web!";
echo
echo "No se borran las bases de datos de Mysql (proceso a mano)"
echo
echo "Pulsa ENTER para continuar...";
read pausa
clear;
echo "Seguro?! Se borraran todos los directorios y paginas";
echo
echo "Pulsa ENTER para continuar...";
read pausa
clear;
echo
echo "Seguro Seguro?! Se perderan todos los ficheros!";
echo
echo "Escribe 'Si' para continuar... \c";
read continuar
if [ "$continuar" = "Si" ]
then
rm -Rf /var/www/html
opcion732="0";
else
echo "No se ha Borrado.";
continuar="";
echo "Pulsa ENTER...";
read pausa
fi
;;

#Opcion speaker
speaker)
echo "Haciendo Test de altavoces";
speaker-test -t wav -c 6 -l1
echo "Haciendo Test de frecuencia 442 a dos canales";
speaker-test -c2 -t sine -f442 -l1 -P2
echo "Terminado";
echo "Pulsa una ENTER...\c";
read pause
;;

##Opcion 000
000)
clear
echo "Borrando historiales...";
sleep 1
su usuario -c "cat /dev/null > ~/.bash_history"
echo "" > ~/.bash_history
su usuario -C "echo  > /home/usuario/.bash_history"
rm /home/usuario/.bash_history
touch /home/usuario/.bash_history
su usuario -C 'history -c'
clear
echo "Borrado!. Reinicia el equipo.";
sleep 2
opcion000="1";
;;

##Opcion msg
msg)
##zenity --info --text "Por favor, encienda el resto de ordenadores.";
##notify-send "Por favor, encienda el resto de ordenadores.";
echo "IP: \c";
read ipmsg;
echo "MSG: \c";
read msgip;
msgip=$(echo "$msgip" | sed 's/ /_/g'); 
sshpass -p usuario ssh -X usuario@$ipmsg zenity --info --text $msgip --display=:0
opcion88="1";
;;

##Opcion repetier
repetier)
echo "Instalando...";
sleep 1
wget http://download.repetier.com/files/host/linux/repetierHostLinux_2_1_6.tgz
tar -xzf repetierHostLinux_2_1_6.tgz --directory /home/usuario
rm repetierHostLinux_2_1_6.tgz
chmod 777 /home/usuario/RepetierHost
cd /home/usuario/RepetierHost/
sh configureFirst.sh
cd /root
echo "Instalado";
sleep 1
opcion88="1";
;;

##Opcion cura
cura)
echo "Instalando...";
sleep 1
wget https://download.ultimaker.com/cura/Ultimaker_Cura-15.04.06-Linux_i386.deb
dpkg -iG Ultimaker_Cura-15.04.06-Linux_i386.deb
rm Ultimaker_Cura-15.04.06-Linux_i386.deb
echo "Instalado";
sleep 1
opcion88="1";
;;

##Opcion 88
88)
echo "Instalando...";
sleep 1
echo "Instalado";
sleep 1
opcion88="1";
;;

##Opcion 88
88)
echo "Instalando...";
sleep 1
echo "Instalado";
sleep 1
opcion88="1";
;;

##Opcion 88
88)
echo "Instalando...";
sleep 1
echo "Instalado";
sleep 1
opcion88="1";
;;



##Opcion minecraft
minecraft)
echo "Descargando...";
sleep 1
wget $REPOSITORIO/repository/Minecraftdebian.jar
mv Minecraftdebian.jar /home/usuario/Descargas/
clear
echo "Descargado";
sleep 1
opcion88="1";
;;

##Opcion 88
formatear)
echo "Descargando...";
sleep 1
wget $REPOSITORIO/background/fondoformateo.bmp
mv fondoformateo.bmp /home/usuario/
clear
su usuario -c 'xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s /home/usuario/fondoformateo.bmp'
clear
echo "Descargado";
sleep 1
opcion88="1";
;;

##Opcion 88
publico)
echo "Descargando...";
sleep 1
wget $REPOSITORIO/background/publico.png
mv publico.png /home/usuario/
clear
su usuario -c 'xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s /home/usuario/publico.png'
clear
echo "Descargado";
sleep 1
opcion88="1";
;;


##Opcion 88
fondo)
echo "Descargando...";
sleep 1
wget $REPOSITORIO/background/desktop-background1024.png
mv desktop-background1024.png /home/usuario/
clear
su usuario -c 'xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s /home/usuario/desktop-background1024.png'
clear
echo "Descargado";
sleep 1
opcion88="1";
;;
##Opcion 88
fondo800)
echo "Descargando...";
sleep 1
wget $REPOSITORIO/background/desktop-background800.png
mv desktop-background800.png /home/usuario/
clear
su usuario -c 'xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s /home/usuario/desktop-background800.png'
clear
echo "Descargado";
sleep 1
opcion88="1";
;;


##Opcion 88
cocodrile)
echo "Descargando...";
sleep 1
wget $REPOSITORIO/repository/coco.tar.gz
tar -xf coco.tar.gz -C /home/usuario
cp /home/usuario/wine/accesos/* /home/usuario/Escritorio/
clear
echo "Descargado";
rm coco.tar.*
sleep 1
opcion88="1";
;;
##Opcion 88
pneusim)
echo "Descargando...";
sleep 1
wget $REPOSITORIO/repository/pn.tar.gz
tar -xf pn.tar.gz -C /home/usuario
cp /home/usuario/wine/accesos/* /home/usuario/Escritorio/
clear
echo "Descargado";
rm pn.tar.*
sleep 1
opcion88="1";
;;


##Opcion 88
fritzing)
echo "Desinstalando version anterior...";
sleep 1
apt-get remove fritzing
apt-get purge fritzing
apt-get update
clear
echo "Descargando...";
sleep 1
wget http://fritzing.org/download/0.9.3b/linux-32bit/fritzing-0.9.3b.linux.i386.tar.bz2
tar -xvf fritzing-*.tar.bz2
mv fritzing-* /usr/share/fritzing
mousepad /usr/share/applications/fritzing.desktop
echo "[Desktop Entry]" > /usr/share/applications/fritzing.desktop
echo "Version=0.9.3b" >> /usr/share/applications/fritzing.desktop
echo "Name=Fritzing" >> /usr/share/applications/fritzing.desktop
echo "GenericName=Fritzing" >> /usr/share/applications/fritzing.desktop
echo "Comment=Electronic Design Automation software" >> /usr/share/applications/fritzing.desktop
echo "Exec=/usr/share/fritzing/fritzing-0.9.3b.linux.i386/Fritzing" >> /usr/share/applications/fritzing.desktop
echo "Icon=/usr/share/fritzing/fritzing-0.9.3b.linux.i386/icons/fritzing_icon.png" >> /usr/share/applications/fritzing.desktop
echo "Terminal=false" >> /usr/share/applications/fritzing.desktop
echo "Type=Application" >> /usr/share/applications/fritzing.desktop
echo "Categories=Development;Engineering;Electronics;" >> /usr/share/applications/fritzing.desktop
echo "X-SuSE-translate=false" >> /usr/share/applications/fritzing.desktop
echo "StartupNotify=true" >> /usr/share/applications/fritzing.desktop
echo "MimeType=application/x-fritzing-fz;application/x-fritzing-fzz;application/x-fritzing-fzp;application/x-fritzing-fzpz;application/x-fritzing-fzb;application/x-fritzing-fzbz;application/x-fritzing-fzm;" >> /usr/share/applications/fritzing.desktop
sleep 1
opcion88="1";
;;



##Opcion 88
anydesk)
echo "Descargando...";
sleep 1
wget $REPOSITORIO/repository/anydesk_2.9.5-1_i386.deb
dpkg -iG anydesk_2.9.5-1_i386.deb
clear
echo "Descargado";
rm anydesk_2.9.5-1_i386.deb
sleep 1
opcion88="1";
;;

##Opcion 88
-anydesk)
echo "Borrando...";
sleep 1
apt-get -y remove anydesk
clear
echo "Borrado!";
sleep 1
opcion88="1";
;;



##Opcion kill
kill)
clear
echo "Nombre o parte de nombre de la aplicacion?: \c"
read pkillapp
pkill $pkillapp
echo "Echo!";
sleep 1
;;

##Opcion git
git)
echo "Instalando...";
sleep 1
sudo apt-get -y install git
clear
echo "Instalado";
sleep 1
;;
##Opcion git
-git)
echo "Instalando...";
sleep 1
sudo apt-get remove git
clear
echo "Borrado";
sleep 1
;;

##Opcion 88
playonlinux)
echo "Descargando...";
wget -q "http://deb.playonlinux.com/public.gpg" -O- | apt-key add -
wget http://deb.playonlinux.com/playonlinux_wheezy.list -O /etc/apt/sources.list.d/playonlinux.list
apt-get update
apt-get -y install playonlinux
sleep 1
opcion88="1";
;;
##Opcion 88
-playonlinux)
apt-get remove playonlinux
echo "Borrado";
sleep 1
opcion88="1";
;;

##Opcion fullapt
##Instalar todos los programas abalar
fullapt)
##Anulamos el repositorio CD
esto="deb cdrom:";
poresto="# deb cdrom:";
sed -i "s/$esto/$poresto/g" /etc/apt/sources.list;

mkdir debtemp
cd debtemp

apt-get -y install gdebi
apt-get -y install xinput-calibrator

## MULTIMEDIA

apt-get -y install arduino
apt-get -y install openshot
apt-get -y install freemind
apt-get -y install evince
apt-get -y install musescore
apt-get -y install audacity
apt-get -y install winff
apt-get -y install guvcview
apt-get -y install recordmydesktop

## GRAFICOS

apt-get -y install mypaint
apt-get -y install librecad
apt-get -y install freecad
apt-get -y install inkscape
apt-get -y install dia
apt-get -y install blender
apt-get -y install scribus
apt-get -y install shotwell
apt-get -y install simple-scan
apt-get -y install synfigstudio

## ELECTRONICA

apt-get -y install geda
apt-get -y install fritzing

## OFICINA
apt-get update
apt-get -y install calibre

## DESARROLLO

apt-get -y install scratch
apt-get -y install glade
apt-get -y install geany

## INTERNET
apt-get -y install icedove
apt-get -f install
apt-get -f install chromium chromium-l10n

## EDUCACION
apt-get -y install avogadro
apt-get -y install geogebra
apt-get -y install gperiodic
apt-get -y install jclic
apt-get -y install lybniz
apt-get -y install stellarium
apt-get -y install gcompris
apt-get -y install tuxmath
apt-get -y install tuxpaint
##apt-get -y install tuxtypin
apt-get -y install kalgebra
apt-get -y install kalzium
apt-get -y install kbruch
apt-get -y install kgeography
apt-get -y install klettres
apt-get -y install ktouch
apt-get -y install kturtle
apt-get -y install kwordquiz
apt-get -y install marble
apt-get -y install step

## ACCESORIOS ##
apt-get -y install nautilus
apt-get -y install galculator
apt-get -y install pdfmod
apt-get -y install terminator
apt-get -y install vim
apt-get -y install xournal
apt-get -y install kate


## PAQUETES ##
wget http://visualino.net/downloads/ubuntu/visualino_0.7_i386.deb
wget http://descargas.pntic.mec.es/cedec/exe_learning/2.3.1/intef-exe_2.3.1_all.deb
wget http://ftp.es.debian.org/debian/pool/main/s/squeak-vm/squeak-vm_4.10.2.2614-1.1+b1_i386.deb
wget http://s4a.cat/downloads/S4A16.deb

## DESCOMPRIMIR PAQUETES ##
dpkg -i *.deb

echo "Terminado";
sleep 1
opcion88="1";
;;

#Opcion update
update)
echo "Descargando...";
sleep 1
cp $RUTASCRIPT $RUTASCRIPT"_"$(date +%F_%H%M%S)
wget -O $DIRECTORIO/setup.sh $UPDATE/sh/setup.sh
clear
echo "Descargado!";
echo "ATENCION. Ejecuta de nuevo el programa.";
exit
opcion88="1";
;;

#Opcion version
version)
echo "Descargando fichero de version...";
sleep 1
wget -O $DIRECTORIO/setup.ver $UPDATE/sh/setup.ver
clear
chmod 777 $DIRECTORIO/setup.ver
nano $DIRECTORIO/setup.ver
cp $DIRECTORIO/setup.ver /home/usuario/setup.ver
opcion88="1";
;;

#Opcion copia
copia)
echo "Copiando a /home/usuario...";
sleep 1
cp setup.sh /home/usuario
chmod 777 /home/usuario/setup.sh
clear
opcion88="1";
;;

#Opcion copiar
copiar)
echo "Copiar fichero a otro/s equipos...";
sleep 1
echo "Nombre del fichero: \c";
read FICHERO;
echo "Ruta donde esta (ej /home/usuario/Escritorio): \c";
read RUTA1;
echo "Donde copiamos el fichero (ej /home/usuario/Escritorio: \c";
read RUTA2;
echo "IP: \c";
read IPINI;
echo "Nombre de usuario: \c";
read USUARIO;
scp $RUTA1/$FICHERO $USUARIO@$IPINI:$RUTA2
chmod 777 $RUTA2/$FICHERO
clear
opcion88="1";
;;

##Opcion import
import)
echo "Importando configuracion...";
sleep 1
echo "Nombre del fichero de importation:\c";
read import;
echo "Importado!.";
sleep 1
echo "Iniciando...";
opcion88="1";
;;

##Opcion crearfichero
crearfichero)
echo "Creando un fichero de configuracion...";
sleep 1
echo "Nombre del fichero:\c";
read ficheroimport;
echo "Formato ip xxx.xxx.xxx:\c";
read ipformato;
echo "IP intranet xxx:\c";
read ipintranet;
echo "IP Servidor Epoptes xxx:\c";
read ipepoptes;
echo "#Fichero de configuracion.">$DIRECTORIO/$ficheroimport.cfg
echo "">>$DIRECTORIO/$ficheroimport.cfg
echo "cfg_ipformato=$ipformato">>$DIRECTORIO/$ficheroimport.cfg
echo "cfg_ipintranet=$ipintranet">>$DIRECTORIO/$ficheroimport.cfg
echo "cfg_ipepoptes=$ipepoptes">>$DIRECTORIO/$ficheroimport.cfg
echo "#Fin fichero.">>$DIRECTORIO/$ficheroimport.cfg
echo "#Fichero creado el $(date)">>$DIRECTORIO/$ficheroimport.cfg
echo "$DIRECTORIO/$ficheroimport.cfg Creado!.";
read pausa;
opcion88="1";
;;

##Opcion i
i)
clear;
wget $REPOSITORIO/sh/setup.ver
verserv=$( cat setup.ver )
rm setup.ver
clear
echo "RESUMEN:"
echo
echo "Version del sistema : \c"
cat /etc/debian_version
echo "Arquitectura (32 o 64bits) : \c"
getconf WORD_BIT
echo "Version del configurador : $version"
echo "Version disponible : $verserv"
echo "Ruta del Script: $DIRECTORIO"
echo "IP: \c"
ifconfig | perl -nle 's/dr:(\S+)/print $1/e'
echo
echo
if [ "$version" = "$verserv" ]
then
    echo
    echo
else
    echo "Existe una nueva version del configurador!."
    echo "Escribe update para actualizarla.";
fi
echo
echo "Pulsa una ENTER...\c";
read pausa;
;;

##Opcion a
a)
clear;
echo "AYUDA:";
echo
echo "La instalacion de programas se realiza desde los repositorios de Internet."; 
echo "Necesitas Internet para realizar actualizaciones online.";
echo
echo "Para la instalación a traves de USB, llama TICGALICIA al USB que contiene el repositorio.";
echo
echo
echo "Pulsa una ENTER...\c";
read pausa;
;;

##Opcion q
q)
clear;
echo "Saliendo...";
sleep 1
echo "Gracias por participar en el proyecto BEBIAN.";
sleep 1
break
exit
;;

##Opcion backup
backup)
clear;
echo "Comprimiendo...";
sleep 1
tar -zcvf /root/usuario.tar.gz /home/usuario
sleep 2
echo "Pulsa una ENTER...\c";
read pausa
clear;
;;

##Opcion restaura_usuario
restaurar_usuario)
clear;
echo "Desomprimiendo...";
sleep 1
if [ -f /media/usuario/TICGALICIA/usuario.tar.gz ]; then
tar -xvzf /root/usuario.tar.gz -C /
else
tar -xvzf /media/usuario/TICGALICIA/usuario.tar.gz -C /
fi
sleep 2
echo "Pulsa una ENTER...\c";
read pausa
clear;
;;

##Opcion restaura_escritorio
restaurar_escritorio)
echo "Descargando...";
sleep 1
mkdir /root/temp
wget $REPOSITORIO/repository/restaurarperfil.tar
tar -xf restaurarperfil.tar -C /root/temp
echo "NOMBRE de la carpeta (ej /home/usuario): \c";
read NOMBRECARPETA;
NOMBRECARPETA=$(echo "$NOMBRECARPETA" | sed "#/#/\#g");
cp -R /root/temp/perfil/* "$NOMBRECARPETA/.config/"
chmod 777 -R "$NOMBRECARPETA/.config"
PROPIETARIO=$(echo "$NOMBRECARPETA" | sed "#/home/##g");
cd $NOMBRECARPETA/.config
chown -R $PROPIETARIO *
chgrp -R $PROPIETARIO *
cd /root
clear
echo "Restaurado!";
rm -R /root/restaurarperfil.tar*
rm -R /root/temp
sleep 1
opcion88="1";
;;

##Opcion limpiar_usuario
limpiar_usuario)
clear;
wget $REPOSITORIO/background/desktop-background1024.png
mv desktop-background1024.png /home/usuario/
clear
su usuario -c 'xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s /home/usuario/desktop-background1024.png'
echo "Borrando...";
sleep 1
rm -Rf /home/usuario/Descargas/*
rm -Rf /home/usuario/Escritorio/*
rm -Rf /home/usuario/Documentos/*
rm -Rf /home/usuario/Imágenes/*
rm -Rf /home/usuario/Música/*
rm -Rf /home/usuario/Plantillas/*
rm -Rf /home/usuario/Público/*
rm -Rf /home/usuario/Vídeos/*
clear;
;;


##Opcion guardar
guardar)
clear;
echo "Copiando...";
sleep 1
mkdir /home/guardar
mv /home/usuario/*.* /home/guardar
cp -Rf /home/usuario/Descargas /home/guardar
cp -Rf /home/usuario/Escritorio /home/guardar
cp -Rf /home/usuario/Documentos /home/guardar
cp -Rf /home/usuario/Imágenes /home/guardar
cp -Rf /home/usuario/Música /home/guardar
cp -Rf /home/usuario/Plantillas /home/guardar
cp -Rf /home/usuario/Público /home/guardar
cp -Rf /home/usuario/Vídeos /home/guardar
echo "Copia realizada...";
wget $REPOSITORIO/background/desktop-background1024.png
mv desktop-background1024.png /home/usuario/
clear
su usuario -c 'xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s /home/usuario/desktop-background1024.png'
sleep 2
echo "Borrando...";
sleep 1
rm -Rf /home/usuario/Descargas/*
rm -Rf /home/usuario/Escritorio/*
rm -Rf /home/usuario/Documentos/*
rm -Rf /home/usuario/Imágenes/*
rm -Rf /home/usuario/Música/*
rm -Rf /home/usuario/Plantillas/*
rm -Rf /home/usuario/Público/*
rm -Rf /home/usuario/Vídeos/*
sleep 2
echo "Moviendo...";
##cp /home/usuario/Escritorio/viejo/Escritorio/*.desk* /home/usuario/Escritorio
mv /home/guardar /home/usuario/Escritorio/viejo
chmod 777 -R /home/usuario/Escritorio/viejo
echo "HECHO!";
sleep 2
clear;
;;

##Opcion tts
tts)
echo "Instalando Texto a Voz...";
sleep 1
wget -q http://ftp.es.debian.org/debian/pool/main/e/espeak/espeak_1.48.04+dfsg-1_i386.deb
dpkg -iG espeak_1.48.04+dfsg-1_i386.deb
sleep 2
echo "Hecho!";
espeak -a200 -ves "Texto a voz instalado";
espeak -a200 -ves "Son las "$(date '+%H_%m_%S');
;;


##Opcion hotpotatoes
hotpotatoes)
echo "Descargando...";
sleep 1
wget -q http://hotpot.uvic.ca/javahotpot61.zip
wget -q http://www.ite.educacion.es/formacion/materiales/62/cd/modulo_2_instalacion_e_idioma/JHP6Spanish.xml
unzip javahotpot61.zip
rm -R __MAC*
mv javahotpot /home/usuario/
rm javahotpot61.zip
mv JHP* /home/usuario/javahotpot/interface/
chmod 777 -R /home/usuario/javahotpot
;;

##Opcion 00
00)
clear;
echo "Borrando...";
sleep 1
rm config.sh*
rm centros.sh*
rm setup.sh*
sleep 2
clear;
break
exit
exit
;;



##Opcion games
games)
clear;
/usr/bin/firefox  https://packages.debian.org/jessie/games/
;;
##Opcion repositorio
repositorio)
clear;
/usr/bin/firefox  $REPOSITORIO
;;

##Opcion debstop
debstop)
clear;
echo "Reiniciando deb...";
sudo dpkg --configure -a
clear;
echo "Hecho!.";
sleep 1
;;

##Opcion reboot
reiniciar)
clear;
echo "Reiniciando...";
sleep 1
reboot
;;

##Opcion apagar
apagar)
clear;
echo "Apagando...";
sleep 1
shutdown -h now
;;


##########PDI##############
##Opcion smart
smart)
echo "Instalando Smart...";
sleep 1
echo "Ahora instalamos el driver.";
read continuar;
### http://es.archive.ubuntu.com/ubuntu/pool/main/u/udev/libudev0_175-0ubuntu9_i386.deb
dpkg -i /media/usuario/TICGALICIA/repositorio/pizarras/smart/libudev0_175-0ubuntu9_i386.deb
apt-get install dkms patch libcurl3 libnspr4-0d
dpkg -i /media/usuario/TICGALICIA/repositorio/pizarras/smart/smart-common_10.3.1236.1-1_i386.deb
dpkg -i /media/usuario/TICGALICIA/repositorio/pizarras/smart/smart-hwr_11.0.379.1-1_i386.deb
dpkg -i /media/usuario/TICGALICIA/repositorio/pizarras/smart/smart-languagesetup_2.2.1191.4-1_i386.deb
dpkg -i /media/usuario/TICGALICIA/repositorio/pizarras/smart/smart-product-drivers_11.0.379.1-1_i386.deb 
apt-get -f install
echo "Ahora instalamos el software. Puedes cancelar.";
read continuar;
dpkg -i /media/usuario/TICGALICIA/repositorio/pizarras/smart/smart-gallerysetup_1.3.1236.1-1_i386.deb
dpkg -i /media/usuario/TICGALICIA/repositorio/pizarras/smart/smart-activation_1.1.1181.1-1_i386.deb
dpkg -i /media/usuario/TICGALICIA/repositorio/pizarras/smart/smart-notebook_11.0.379.0-1_i386.deb
sudo apt-get install xinput-calibrator 
xinput-callibrator

echo Fuente
echo https://mainkivi.info/index.php/Maquinari_en_Linux
echo "Hecho!";
read continuar;
;;

##Opcion iqboard
iqboard)
echo "Descargando...";
sleep 1
wget $REPOSITORIO/repository/IQBoard_ET_PS_Drivers_V7_0_20140425_32.deb
dpkg -i IQBoard_ET_PS_Drivers_V7_0_20140425_32.deb
rm IQBoard_ET_PS_Drivers_V7_0_20140425_32.deb
clear
echo "Instalado";
sleep 1
opcion88="1";
;;


##########DRIVERS##########

##Opcion wn725n
wn725n)
echo "Instalando driver..."
if [ ! -f /media/usuario/TICGALICIA/repositorio/TL-WN725N-TP-Link-Debian/control_ap ]; then
echo "Necesita conexion internet y tener instalado git (github)";
echo "Deseas continuar (S/N)?: \c";
read continuar;
if [ "$continuar" = "S" ]
then
apt-get update
apt-get install linux-headers-$(uname -r)
apt-get update
apt-get install build-essential
git clone https://github.com/ilnanny/TL-WN725N-TP-Link-Debian.git
cd TL-WN725N-TP-Link-Debian
make all
make install
insmod 8188eu.ko
service network-manager restart
echo "Instalado";
echo "Pulsa ENTER para reiniciar el equipo...\c";
read pausa
continuar="";
reboot
else
echo "No se ha modificado.";
continuar="";
echo "Pulsa ENTER...";
read pausa
fi
else
cd /media/usuario/TICGALICIA/repositorio/TL-WN725N-TP-Link-Debian/
make all
make install
insmod 8188eu.ko
service network-manager restart
echo "Instalado";
echo "Pulsa ENTER para reiniciar el equipo...\c";
read pausa
continuar="";
reboot
fi
sleep 1
;;

##Opcion vigor
vigor530usb)
echo "Instalando driver..."
if [ ! -f /media/usuario/TICGALICIA/repositorio/vigor530usb/2.13.1.0.lm86.arm ]; then
echo "Necesita conexion internet";
echo "Deseas continuar (S/N)?: \c";
read continuar;
if [ "$continuar" = "S" ]
then
wget https://daemonizer.de/prism54/prism54-fw/fw-usb/2.13.1.0.lm86.arm --no-check-certificate
cp 2.13.1.0.lm86.arm /lib/firmware/isl3886usb
modprobe -r p54usb ; modprobe p54usb
echo "Instalado";
echo "Pulsa ENTER para reiniciar el equipo...\c";
read pausa
continuar="";
reboot
else
echo "No se ha modificado.";
continuar="";
echo "Pulsa ENTER...";
read pausa
fi
else
cd /media/usuario/TICGALICIA/repositorio/vigor530usb/
cp 2.13.1.0.lm86.arm /lib/firmware/isl3886usb
modprobe -r p54usb ; modprobe p54usb
echo "Instalado";
echo "Pulsa ENTER para reiniciar el equipo...\c";
read pausa
continuar="";
reboot
fi
sleep 1
;;

##Opcion hplip
hplip)
echo "Instalando driver..."
if [ ! -f /media/usuario/TICGALICIA/repositorio/drivers/hplip/hplip_3_17_7.run ]; then
echo "Necesita conexion internet";
echo "Deseas continuar (S/N)?: \c";
read continuar;
if [ "$continuar" = "S" ]
then
wget http://www.pesadillo.com/ticgalicia/repository/HPdrivers.run
sh HPdrivers.run
rm HPdrivers.run
echo "Instalado";
else
echo "No se ha modificado.";
continuar="";
echo "Pulsa ENTER...";
read pausa
fi
else
sh /media/usuario/TICGALICIA/repositorio/drivers/hplip/hplip_3_17_7.run
echo "Instalado";
fi
sleep 1
;;

##Opcion ms
ms)
clear;
echo "Menu servidores";
sleep 1
menu=70;
clear;
;;

##Opcion ms
0)
clear;
echo "Menu principal";
sleep 1
menu=1;
clear;
;;

##########FIN DRIVERS##########

*)
menu=$(( menu + 1 ));
if [ "$menu" = "7" ]
then
    menu=1;
fi
;;


esac
##Salimos opcion escogida

##opcion escape ON
if [ "$escape" = "1" ]
then
    exit
fi

##Fin programa
done

exit
