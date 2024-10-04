#!/bin/bash
# -*- ENCODING: utf-8 -*-
##########################################################################
#
#		SCRIPT INSTALADOR-CONFIGURADOR PARA DEBIAN (VERSION 64)
#
#	ATENCION:
#	Esta herramienta es peligrosa, puesto que modifica ficheros
#	del sistema para la instalación de componentes o periféricos.
#	Su utilización está destinada a personal TIC con conocimientos
#	del sistema.
#
#	www.TicGalicia.com o cualquiera de sus miembros, no se hacen
#	responsables de la pérdida de datos o daños causados a su
#	intalación por la utilización del script o su maqueta; así
#	como los daños ocasionados por un mal uso del Script por
#	parte de terceros (cambie la contraseña de root).
#
#	La copia de seguridad de los datos son responsabilidad
#	de los propios usuarios. Por lo que, antes de utilizar
#	esta herramienta, tenga copia de los datos de los usuarios.
#
#	Esta herramienta, en continuo desarrollo y modificación,
#	se considera una BETA EXPERIMENTAL EN DESARROLLO.
#
#
# Desarrolla: www.ticgalicia.com
#
# Destinatario: Centros Educativos, empresas y equipos domésticos
#
# Colaboran: Alfoso C. (Electromedicina), F. Santiago M. (Automocion)
#	     Carlos C. (Robotica), Ricardo C. (Mant. Industrial)
#	     Francisco L. (Ganadería), Xurxo T. (Programación)	 
#	     Ricardo C. (Contrucción), Diego A. (Audovisuales)	
#	     Santiago B. (Arquitectura), Victor C. (Docencia)
#
# Agradecimientos a: Jose Luis B. (Tec. Informático de campo.)
#
#
#
#########################################################################


menu=1;
echo $1;

##PARAMETROS DEL SCRIPT:
stty cols 132 rows 28
version=3.13.09.24
RUTASCRIPT=$(readlink -f $0);
DIRECTORIO=$(cd "$(dirname "$0")"; pwd -P);
REPOSITORIO="https://raw.githubusercontent.com/ticgalicia/bebian/master";
REPUSB="/media/usuario/TICGALICIA/repositorio"
REPLOCAL="/.repoTIC";
VSIST=$(cat /etc/debian_version);
VTIPO=$(uname -m);
hostn=$(cat /etc/hostname);
ippc=$(ip addr | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p');
macpc=$(ip -o link | grep ether | awk '{ print $17 }');
CENTROS="http://51.38.187.16/ticgalicia/centros.php?e=$hostn&i=$ippc&m=$macpc&v=$VSIST";
DIA=`date +"%d/%m/%Y"`;
UDIA=$( cat logsetup.log );
rm setup.log
##colores

###ACTIVAR TECLADO NUMERICO POR DEFECTO
	esto="false";
	poresto="true";
	sed -i "s/$esto/$poresto/g" /home/usuario/.config/xfce4/xfconf/xfce-perchannel-xml/keyboards.xml;

#Normal
cn='\033[0m';
cr='\033[1;31m';
cv='\033[1;32m';
ca='\033[1;33m';
#aZul
cz='\033[1;34m';
#color titulos
cT='\033[1;34m';

#color menu sup
cMS='\033[1;37m';
#color menu inf
cM='\033[1;37m';
#Color Fondo2
cF='\e]11;#1000d6\a';

##PARAMETROS DE DESCARGAS
#LIBREOFFICE
libver64="7.6.4";
liburl64="http://ftp.uvigo.es/tdf/libreoffice/stable/";
libver32="6.2.8.2";
liburl32="http://downloadarchive.documentfoundation.org/libreoffice/old/"
discver64="0.0.50";


##borrar leeme escritorio por defecto
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

#Si se ejecuta desde USB, se autocopia a /root/
cp $RUTASCRIPT /root/
#Ejecutar desde /root
source /root/setup.sh
clear

##Si no hay parametro, ejecutar menu.
if [ -z "$1" ]
then

##Verificar version en servidor
if [ "$VTIPO" = "x86_64" ]
then
	wget -q $REPOSITORIO/sh/64/setup.ver
else
	wget -q $REPOSITORIO/sh/32/setup.ver
fi
verserv=$( cat setup.ver )
clear
	if [ ! -f /media/usuario/TICGALICIA/setup.sh ]; then
		echo
	    	#echo "${cv}      ATENCION: No se encuentra el USB TICGALICIA! (almacen repositorio) ${cn}";
	else
		cp /media/usuario/TICGALICIA/setup.sh /root/setup.sh
		echo "${cr}      Se ha actualizado setup local con el del USB. ${cn}";
		sleep 3;
		echo "${cr}      Escriba update para actualizar tambien el USB. ${cn}";
		sleep 2;
	fi

echo "                                             Ultima update: $UDIA";
echo "                     CONFIGURADOR $version para $VTIPO ${cz}";
echo "";
echo "";
echo "      ██████╗ ███████╗██████╗ ██╗ █████╗ ███╗   ██╗     ██████╗ ██╗  ██╗     ";
echo "      ██╔══██╗██╔════╝██╔══██╗██║██╔══██╗████╗  ██║    ██╔════╝ ██║  ██║     ";
echo "      ██████╔╝█████╗  ██████╔╝██║███████║██╔██╗ ██║    ███████╗ ███████║     ";
echo "      ██╔══██╗██╔══╝  ██╔══██╗██║██╔══██║██║╚██╗██║    ██╔═══██╗╚════██║     ";
echo "      ██████╔╝███████╗██████╔╝██║██║  ██║██║ ╚████║    ╚██████╔╝     ██║     ";
echo "      ╚═════╝ ╚══════╝╚═════╝ ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝     ╚═════╝      ╚═╝     ";
echo "                                                                      •      ";
echo "                                                                  ┏┏┏┓┓┏┓╋   ";
echo "                                                                  ┛┗┛ ┗┣┛┗   ";
echo "                                                                       ┛     ";
echo "${cn}";  
echo "";
echo "                 Script de preconfiguracion y adaptacion del equipo.";
echo "     ${cr}Los procesos no se pueden detener y pueden desconfigurar el sistema.";
echo "               Cierra ahora esta ventana si no sabes como funciona.";
echo "             En cualquier momento puedes pulsar Ctrl+c para terminar.${cn}";
sleep 1;
	if [ "$VSIST" = "10.3" ]
	then
			echo "${ca}********* Ya existe la ultima version estable del sistema (10.10). ******${cn}";
			echo "${ca}*****Escribe upgrade para instalarla (LLEVARA TIEMPO). Proceso peligroso.${cn}";
			sleep 5;
	fi

	if [ -f setup.ver ]; then
		if [ "$version" = "$verserv" ]
		then
		   	CONECTADO="${cv}RED OK${cn}";
		else
			echo "${ca}            Existe una nueva version del configurador! ($verserv).${cn}";
			echo "${ca}                       Escribe update para actualizarla.${cn}";
		fi
		rm setup.ver
	else
		CONECTADO="${cr}SIN RED${cn}";
	fi
echo
echo "\c";
sleep 4;

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
printf %b ${cF};
echo "$CONECTADO ";
echo "$DIA                                 CONFIGURADOR $version para $VTIPO ${cz}";
echo "${cMS}    MENU $menu ${cn} \c";

##menu1
if [ "$menu" = "1" ]
then

echo "(preconfiguracion)";
echo
if [ "$opcion1" = "1" ]
then
    echo "${cv}    [x]${cn} 1: Cambiar password del ROOT.${cn}";
else
    echo "${cM}    [ ]${cn} 1: Cambiar password del ROOT.";
fi
if [ "$opcion2" = "1" ]
then
    echo "${cv}    [x]${cn} 2: Cambiar el NOMBRE actual (${cM}$hostn${cn}) al equipo.";
else
    echo "${cM}    [ ]${cn} 2: Cambiar el NOMBRE actual (${cM}$hostn${cn}) al equipo.";
fi
if [ "$opcion3" = "1" ]
then
    echo "${cv}    [x]${cn} 3: Asociar DNSs Xunta (solo red Xunta).${cn}";
else
    echo "${cM}    [ ]${cn} 3: Asociar DNSs Xunta (solo red Xunta).";
fi
if [ "$opcion4" = "1" ]
then
    echo "${cv}    [x]${cn} 4: Poner IP fija (en tarjeta LAN).";
else
    echo "${cM}    [ ]${cn} 4: Poner IP fija (en tarjeta LAN).";
fi
if [ "$opcion5" = "1" ]
then
    echo "${cv}    [x]${cn} 5: Sincronizar Hora del equipo a Internet.${cn}";
else
    echo "${cM}    [ ]${cn} 5: Sincronizar Hora del equipo a Internet.";
fi
if [ "$opcion6" = "1" ]
then
    echo "${cv}    [x]${cn} 6: Permitir acceso remoto de terminal SSH y SSPASS.${cn}";
else
    echo "${cM}    [ ]${cn} 6: Permitir acceso remoto de terminal SSH y SSPASS.";
fi
if [ "$opcion7" = "1" ]
then
    echo "${cv}    [x]${cn} 7: Programar hora de autoapagado.${cn}";
else
    echo "${cM}    [ ]${cn} 7: Programar hora de autoapagado.";
fi
if [ "$opcion8" = "1" ]
then
    echo "${cv}    [x]${cn} 8: Permitir acceso a carpetas de red.${cn}";
else
    echo "${cM}    [ ]${cn} 8: Permitir acceso a carpetas de red.";
fi
if [ "$opcion9" = "1" ]
then
    echo "${cv}    [x]${cn} 9: Habilitar MEMTEST en menu de inicio.${cn}";
else
    echo "${cM}    [ ]${cn} 9: Habilitar MEMTEST en menu de inicio.";
fi
if [ "$opcion10" = "1" ]
then
    echo "${cv}    [x]${cn} 10: Habilitar PXE en menu de inicio.${cn}";
else
    echo "${cM}    [ ]${cn} 10: Habilitar PXE en menu de inicio.";
fi
echo
echo
echo
echo "${cM}    INTRO: Menu 2 | \c";
##fin menu1
fi

##menu2
if [ "$menu" = "2" ]
then
printf %b ${cF}
echo "(especificos)";
echo

if [ "$opcion20" = "1" ]
then
    echo "${cv}    [x]${cn} 20: Indicar servidor INTRANET (ip o servidor).${cn}";
else
    echo "${cM}    [ ]${cn} 20: Indicar servidor INTRANET (ip o servidor).${cn}";
fi
if [ "$opcion21" = "1" ]
then
    echo "${cv}    [x]${cn} 21: Instalar Congelador del sistema.${cn}";
else
    echo "${cM}    [ ]${cn} 21: Instalar Congelador del sistema.";
fi
if [ "$opcion22" = "1" ]
then
    echo "${cv}    [x]${cn} 22: Instalar EPOPTES Alumno.${cn}";
else
    echo "${cM}    [ ]${cn} 22: Instalar EPOPTES Alumno.";
fi
if [ "$opcion23" = "1" ]
then
    echo "${cv}    [x]${cn} 23: Instalar EPOPTES Profesor (SERVIDOR).${cn}";
else
    echo "${cM}    [ ]${cn} 23: Instalar EPOPTES Profesor (SERVIDOR).";
fi
if [ "$opcion24" = "1" ]
then
    echo "${cv}    [x]${cn} 24: Instalar Gestor de Impresoras.${cn}";
else
    echo "${cM}    [ ]${cn} 24: Instalar Gestor de Impresoras.";
fi
if [ "$opcion25" = "1" ]
then
    echo "${cv}    [x]${cn} 25: Crear acceso directo a carpeta de red.${cn}";
else
    echo "${cM}    [ ]${cn} 25: Crear acceso directo a carpeta de red.";
fi
if [ "$opcion26" = "1" ]
then
    echo "${cv}    [x]${cn} 26: Instalar OpenBoard.${cn}";
else
    echo "${cM}    [ ]${cn} 26: Instalar OpenBoard.";
fi
if [ "$opcion27" = "1" ]
then
    echo "${cv}    [x]${cn} 27: Instalar Google Earth.${cn}";
else
    echo "${cM}    [ ]${cn} 27: Instalar Google Earth.";
fi
if [ "$opcion28" = "1" ]
then
    echo "${cv}    [x]${cn} 28: Geogebra Classic 6.${cn}";
else
    echo "${cM}    [ ]${cn} 28: Geogebra Classic 6.";
fi
if [ "$opcion29" = "1" ]
then
    echo "${cv}    [x]${cn} 29: Compatibilidad con Windows (Wine).${cn}";
else
    echo "${cM}    [ ]${cn} 29: Compatibilidad con Windows (Wine).";
fi
echo
echo
echo
echo "${cM}    INTRO: Menu 3 | \c";
fi

##menu3
if [ "$menu" = "3" ]
then
printf %b ${cF}
echo "(aplicaciones)";
echo 
if [ "$opcion31" = "1" ]
then
    echo "${cv}    [x]${cn} 31: Instalar Java.${cn}";
else
    echo "${cM}    [ ]${cn} 31: Instalar Java.";
fi
if [ "$opcion32" = "1" ]
then
    echo "${cv}    [x]${cn} 32: Instalar Acrobat Reader 9.5.${cn}";
else
    echo "${cM}    [ ]${cn} 32: Instalar Acrobat reader 9.5.";
fi
if [ "$opcion33" = "1" ]
then
    echo "${cv}    [x]${cn} 33: Instalar Libreoffice${cn}";
else
    echo "${cM}    [ ]${cn} 33: Instalar Libreoffice";
fi
if [ "$opcion34" = "1" ]
then
    echo "${cv}    [x]${cn} 34: Instalar Brasero (equivalente NERO)${cn}";
else
    echo "${cM}    [ ]${cn} 34: Instalar Brasero (equivalente NERO)";
fi
if [ "$opcion35" = "1" ]
then
    echo "${cv}    [x]${cn} 35: Instalar Editor de texto Bluefish (similar notepad++)${cn}";
else
    echo "${cM}    [ ]${cn} 35: Instalar Editor de texto Bluefish (similar notepad++)";
fi
if [ "$opcion36" = "1" ]
then
    echo "${cv}    [x]${cn} 36: Instalar Editor de imagenes GIMP${cn}";
else
    echo "${cM}    [ ]${cn} 36: Instalar Editor de imagenes GIMP";
fi
if [ "$opcion37" = "1" ]
then
    echo "${cv}    [x]${cn} 37: Instalar Editor de imagenes PINTA (similar paint)${cn}";
else
    echo "${cM}    [ ]${cn} 37: Instalar Editor de imagenes PINTA (similar paint)";
fi
if [ "$opcion38" = "1" ]
then
    echo "${cv}    [x]${cn} 38: Instalar Freeplane (nuevo freemind)${cn}";
else
    echo "${cM}    [ ]${cn} 38: Instalar Freeplane (nuevo freemind)";
fi
if [ "$opcion39" = "1" ]
then
    echo "${cv}    [x]${cn} 39: Instalar Autofirma${cn}";
else
    echo "${cM}    [ ]${cn} 39: Instalar Autofirma";
fi
echo
echo
echo
echo
echo "${cM}    INTRO: Menu 4 | \c";
fi

##menu4
if [ "$menu" = "4" ]
then
printf %b ${cF}
echo "(herramientas)";
echo
if [ "$opcion41" = "1" ]
then
    echo "${cv}    [x]${cn} 41: Instalar Gparted.${cn}";
else
    echo "${cM}    [ ]${cn} 41: Instalar Gparted.";
fi
if [ "$opcion42" = "1" ]
then
    echo "${cv}    [x]${cn} 42: Instalar virtualbox-5.2.${cn}";
else
    echo "${cM}    [ ]${cn} 42: Instalar virtualbox-5.2.";
fi
if [ "$opcion43" = "1" ]
then
    echo "${cv}    [x]${cn} 43: Instalar ARK descompresor RAR${cn}";
else
    echo "${cM}    [ ]${cn} 43: Instalar ARK descompresor RAR";
fi
if [ "$opcion44" = "1" ]
then
    echo "${cv}    [x]${cn} 44: Instalar Filezilla${cn}";
else
    echo "${cM}    [ ]${cn} 44: Instalar Filezilla";
fi
if [ "$opcion46" = "1" ]
then
    echo "${cv}    [x]${cn} 46: Instalar Wireshark.${cn}";
else
    echo "${cM}    [ ]${cn} 46: Instalar Wireshark.";
fi
if [ "$opcion47" = "1" ]
then
    echo "${cv}    [x]${cn} 47: Instalar app recortes shutter/flameshot.${cn}";
else
    echo "${cM}    [ ]${cn} 47: Instalar app recortes shutter/flameshot.";
fi
if [ "$opcion48" = "1" ]
then
    echo "${cv}    [x]${cn} 48: Instalar app Scanner de Red.${cn}";
else
    echo "${cM}    [ ]${cn} 48: Instalar app Scanner de Red.";
fi
if [ "$opcion49" = "1" ]
then
    echo "${cv}    [x]${cn} 49: Instalar MEGA download.${cn}";
else
    echo "${cM}    [ ]${cn} 49: Instalar MEGA download.";
fi
echo
echo
echo
echo
echo
echo "${cM}    INTRO: Menu 5 | \c";
fi

##menu5
if [ "$menu" = "5" ]
then
printf %b ${cF}
echo "(navegadores)";
echo
if [ "$opcion51" = "1" ]
then
    echo "${cv}    [x]${cn} 51: Instalar Opera.${cn}";
else
    echo "${cM}    [ ]${cn} 51: Instalar Opera.";
fi
if [ "$opcion52" = "1" ]
then
    echo "${cv}    [x]${cn} 52: Instalar Navegador Terminal W3m.${cn}";
else
    echo "${cM}    [ ]${cn} 52: Instalar Navegador Terminal W3m.";
fi
if [ "$opcion53" = "1" ]
then
    echo "${cv}    [x]${cn} 53: Instalar Navegador Terminal Lynx.${cn}";
else
    echo "${cM}    [ ]${cn} 53: Instalar Navegador Terminal Lynx.";
fi
if [ "$opcion54" = "1" ]
then
    echo "${cv}    [x]${cn} 54: Instalar Navegador Terminal Elinks.${cn}";
else
    echo "${cM}    [ ]${cn} 54: Instalar Navegador Terminal Elinks.";
fi
if [ "$opcion55" = "1" ]
then
    echo "${cv}    [x]${cn} 55: Instalar Navegador Tor.${cn}";
else
    echo "${cM}    [ ]${cn} 55: Instalar Navegador Tor.${cn}";
fi
if [ "$opcion56" = "1" ]
then
    echo "${cv}    [x]${cn} 56: Instalar Mozilla-esr.${cn}";
else
    echo "${cM}    [ ]${cn} 56: Instalar Mozilla-esr.";
fi
if [ "$opcion57" = "1" ]
then
    echo "${cv}    [x]${cn} 57: Configurar Mozilla-esr como reproductor swf.${cn}";
else
    echo "${cM}    [ ]${cn} 57: Configurar Mozilla-esr como reproductor swf.";
fi
if [ "$opcion58" = "1" ]
then
    echo "${cv}    [x]${cn} 58: Instalar chrome oficial(64bits)${cn}";
else
    echo "${cM}    [ ]${cn} 58: Instalar chrome oficial(64bits).";
fi
echo
echo
echo
echo
echo
echo "${cM}    INTRO: Menu 6 | \c";
fi

##menu6
if [ "$menu" = "6" ]
then
printf %b ${cF}
echo "(multimedia)";
echo
if [ "$opcion61" = "1" ]
then
    echo "${cv}    [x]${cn} 61: Instalar codecks.${cn}";
else
    echo "${cM}    [ ]${cn} 61: Instalar codecks.";
fi
if [ "$opcion62" = "1" ]
then
    echo "${cv}    [x]${cn} 62: Instalar VLC.${cn}";
else
    echo "${cM}    [ ]${cn} 62: Instalar VLC.";
fi
if [ "$opcion63" = "1" ]
then
    echo "${cv}    [x]${cn} 63: Instalar Smplayer.${cn}";
else
    echo "${cM}    [ ]${cn} 63: Instalar Smplayer.";
fi
if [ "$opcion64" = "1" ]
then
    echo "${cv}    [x]${cn} 64: Instalar Parole.${cn}";
else
    echo "${cM}    [ ]${cn} 64: Instalar Parole.";
fi
if [ "$opcion65" = "1" ]
then
    echo "${cv}    [x]${cn} 65: Instalar kdenlive.${cn}";
else
    echo "${cM}    [ ]${cn} 65: Instalar kdenlive.";
fi
if [ "$opcion66" = "1" ]
then
    echo "${cv}    [x]${cn} 66: Instalar OBS Studio.${cn}";
else
    echo "${cM}    [ ]${cn} 66: Instalar OBS Studio.";
fi
if [ "$opcion67" = "1" ]
then
    echo "${cv}    [x]${cn} 67: Instalar MIXX, LMMS e HYDROGEN.${cn}";
else
    echo "${cM}    [ ]${cn} 67: Instalar MIXX, LMMS e HYDROGEN.";
fi
if [ "$opcion68" = "1" ]
then
    echo "${cv}    [x]${cn} 68: Instalar Simple Screen Recorder.${cn}";
else
    echo "${cM}    [ ]${cn} 68: Instalar Simple Screen Recorder.";
fi
if [ "$opcion68b" = "1" ]
then
    echo "${cv}    [x]${cn} 68b: Instalar vokoscreen.${cn}";
else
    echo "${cM}    [ ]${cn} 68b: Instalar vokoscreen.";
fi
if [ "$opcion69" = "1" ]
then
    echo "${cv}    [x]${cn} 69: Instalar Kodi (centro multimedia-tv).${cn}";
else
    echo "${cM}    [ ]${cn} 69: Instalar Kodi (centro multimedia-tv).";
fi
echo
echo
echo
echo "${cM}    INTRO: Menu 7 | \c";
fi

##menu7
if [ "$menu" = "7" ]
then
printf %b ${cF}
echo "(Programacion)";
echo
if [ "$opcion71" = "1" ]
then
    echo "${cv}    [x]${cn} 71: Instalar Arduino.${cn}";
else
    echo "${cM}    [ ]${cn} 71: Instalar Arduino.";
fi
if [ "$opcion71b" = "1" ]
then
    echo "${cv}    [x]${cn} 71b: Instalar Arduinoblocks.${cn}";
else
    echo "${cM}    [ ]${cn} 71b: Instalar Arduinoblocks.";
fi
if [ "$opcion72" = "1" ]
then
    echo "${cv}    [x]${cn} 72: Instalar Visualino & Crumble.${cn}";
else
    echo "${cM}    [ ]${cn} 72: Instalar Visualino & Crumble.";
fi
if [ "$opcion73" = "1" ]
then
    echo "${cv}    [x]${cn} 73: Instalar Processing 4 & Python.${cn}";
else
    echo "${cM}    [ ]${cn} 73: Instalar Processing 4 & Python.";
fi
if [ "$opcion74" = "1" ]
then
    echo "${cv}    [x]${cn} 74: Instalar mBlock.${cn}";
else
    echo "${cM}    [ ]${cn} 74: Instalar mBlock.";
fi
if [ "$opcion74b" = "1" ]
then
    echo "${cv}    [x]${cn} 74b: Instalar mLink.${cn}";
else
    echo "${cM}    [ ]${cn} 74b: Instalar mLink.";
fi
if [ "$opcion75" = "1" ]
then
    echo "${cv}    [x]${cn} 75: Instalar PSeint.${cn}";
else
    echo "${cM}    [ ]${cn} 75: Instalar PSeint.";
fi
if [ "$opcion76" = "1" ]
then
    echo "${cv}    [x]${cn} 76: Instalar editor de codigo Codelite.${cn}";
else
    echo "${cM}    [ ]${cn} 76: Instalar editor de codigo Codelite.";
fi
if [ "$opcion77" = "1" ]
then
    echo "${cv}    [x]${cn} 77: Instalar editor WEB Bluegriffon${cn}";
else
    echo "${cM}    [ ]${cn} 77: Instalar editor WEB Bluegriffon";
fi
if [ "$opcion78" = "1" ]
then
    echo "${cv}    [x]${cn} 78: Instalar editor de aplicaciones Glade.${cn}";
else
    echo "${cM}    [ ]${cn} 78: Instalar editor de aplicaciones Glade.";
fi
if [ "$opcion79" = "1" ]
then
    echo "${cv}    [x]${cn} 79: Instalar Scratch 3 offline.${cn}";
else
    echo "${cM}    [ ]${cn} 79: Instalar Scratch 3 offline.";
fi
if [ "$opcion7a" = "1" ]
then
    echo "${cv}    [x]${cn} 7a: Instalar dodo & Thonny 4 .(Editor Pyton)${cn}";
else
    echo "${cM}    [ ]${cn} 7a: Instalar dodo & Thonny 4 .(Editor Pyton).";
fi
echo
echo "${cM}    INTRO: Menu 8 | \c";
fi

##menu8
if [ "$menu" = "8" ]
then
printf %b ${cF}
echo "(Impresion 3D)";
echo
if [ "$opcion81" = "1" ]
then
    echo "${cv}    [x]${cn} 81: Instalar Cura.${cn}";
else
    echo "${cM}    [ ]${cn} 81: Instalar Cura (Necesita grafica con OPEN GL).";
fi
if [ "$opcion82" = "1" ]
then
    echo "${cv}    [x]${cn} 82: Instalar Slic3r.${cn}";
else
    echo "${cM}    [ ]${cn} 82: Instalar Slic3r.";
fi
if [ "$opcion83" = "1" ]
then
    echo "${cv}    [x]${cn} 83: Instalar Repetier-Host.${cn}";
else
    echo "${cM}    [ ]${cn} 83: Instalar Repetier-Host (Necesita grafica con OPEN GL).";
fi
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo "${cM}    INTRO: Menu 9 | \c";
fi

##menu9
if [ "$menu" = "9" ]
then
printf %b ${cF}
echo "(Electronica / Electricidad)";
echo
if [ "$opcion91" = "1" ]
then
    echo "${cv}    [x]${cn} 91: Instalar Fritzing (circuitos).${cn}";
else
    echo "${cM}    [ ]${cn} 91: Instalar Fritzing (circuitos).";
fi
if [ "$opcion92" = "1" ]
then
    echo "${cv}    [x]${cn} 92: Instalar Logisim -Simulador puertas logicas.${cn}";
else
    echo "${cM}    [ ]${cn} 92: Instalar Logisim -Simulador puertas logicas.";
fi
if [ "$opcion93" = "1" ]
then
    echo "${cv}    [x]${cn} 93: SimulIDE Simulador de circuitos Electronicos.${cn}";
else
    echo "${cM}    [ ]${cn} 93: SimulIDE Simulador de circuitos Electronicos.";
fi
if [ "$opcion94" = "1" ]
then
    echo "${cv}    [x]${cn} 94: EasyEDA CREAR placas circuitos Electronicos.${cn}";
else
    echo "${cM}    [ ]${cn} 94: EasyEDA CREAR placas circuitos Electronicos..";
fi
if [ "$opcion95" = "1" ]
then
    echo "${cv}    [x]${cn} 95: KICAD CREAR placas circuitos Electronicos.${cn}";
else
    echo "${cM}    [ ]${cn} 95: KICAD CREAR placas circuitos Electronicos..";
fi
if [ "$opcion96" = "1" ]
then
    echo "${cv}    [x]${cn} 96: Qelectrotech diseño Industrial Electricidad,Neumatica,...${cn}";
else
    echo "${cM}    [ ]${cn} 96: Qelectrotech diseño Industrial Electricidad,Neumatica,...";
fi
if [ "$opcion97" = "1" ]
then
    echo "${cv}    [x]${cn} 97: CADe_SIMU diseño Industrial Electricidad (Bebian 12).${cn}";
else
    echo "${cM}    [ ]${cn} 97: CADe_SIMU diseño Industrial Electricidad (Bebian 12).";
fi
echo
echo
echo
echo
echo
echo
echo "${cM}    INTRO: Menu 10 | \c";
fi


##menu10
if [ "$menu" = "10" ]
then
printf %b ${cF}
echo "(Comunicaciones)";
echo
if [ "$opcion101" = "1" ]
then
    echo "${cv}    [x]${cn} 101: Skype.${cn}";
else
    echo "${cM}    [ ]${cn} 101: Skype.";
fi
if [ "$opcion102" = "1" ]
then
    echo "${cv}    [x]${cn} 102: Zoom.${cn}";
else
    echo "${cM}    [ ]${cn} 102: Zoom.";
fi
if [ "$opcion103" = "1" ]
then
    echo "${cv}    [x]${cn} 103: Discord.${cn}";
else
    echo "${cM}    [ ]${cn} 103: Discord.";
fi
if [ "$opcion104" = "1" ]
then
    echo "${cv}    [x]${cn} 104: Teamspeak (para x32).${cn}";
else
    echo "${cM}    [ ]${cn} 104: Teamspeak (para x32).";
fi
if [ "$opcion105" = "1" ]
then
    echo "${cv}    [x]${cn} 105: TTS (texto a voz) (para el terminal)${cn}";
else
    echo "${cM}    [ ]${cn} 105: TTS (texto a voz) (para el terminal)";
fi
if [ "$opcion106" = "1" ]
then
    echo "${cv}    [x]${cn} 106: Remmina Escritorio remoto windows (RDP)${cn}";
else
    echo "${cM}    [ ]${cn} 106: Remmina Escritorio remoto windows (RDP)";
fi
if [ "$opcion107" = "1" ]
then
    echo "${cv}    [x]${cn} 107: Anydesk${cn}";
else
    echo "${cM}    [ ]${cn} 107: Anydesk";
fi
if [ "$opcion108" = "1" ]
then
    echo "${cv}    [x]${cn} 108: Cliente chat Pidgin${cn}";
else
    echo "${cM}    [ ]${cn} 108: Cliente chat Pidgin";
fi
if [ "$opcion109" = "1" ]
then
    echo "${cv}    [x]${cn} 109: Cliente Emule${cn}";
else
    echo "${cM}    [ ]${cn} 109: Cliente Emule";
fi
if [ "$opcion110" = "1" ]
then
    echo "${cv}    [x]${cn} 110: Teamviewer${cn}";
else
    echo "${cM}    [ ]${cn} 110: Teamviewer";
fi
echo
echo
echo
echo "${cM}    INTRO: Menu 1 | \c";
fi

####################################################################
###Menu servidores
##menu700
if [ "$menu" = "700" ]
then
echo "(serv.)";
echo
if [ "$opcion701" = "1" ]
then
    echo "${cv}    [x]${cn} 701: Test Samba / Reiniciar Samba.${cn}";
else
    echo "${cM}    [ ]${cn} 701: Test Samba / Reiniciar Samba.";
fi
if [ "$opcion702" = "1" ]
then
    echo "${cv}    [x]${cn} 702: Instalar Samba.${cn}";
else
    echo "${cM}    [ ]${cn} 702: Instalar Samba.";
fi
if [ "$opcion703" = "1" ]
then
    echo "${cv}    [x]${cn} 703: Compartir carpeta Samba.${cn}";
else
    echo "${cM}    [ ]${cn} 703: Compartir carpeta Samba.";
fi
if [ "$opcion704" = "1" ]
then
    echo "${cv}    [x]${cn} 704: Cambiar nombre GRUPO trabajo Samba.${cn}";
else
    echo "${cM}    [ ]${cn} 704: Cambiar nombre GRUPO trabajo Samba.";
fi
echo
echo
echo
echo
echo
echo
echo
echo "${cM}    INTRO: Menu 2 (serv.) | 0: Menu 0 | \c";
fi

##menu701
if [ "$menu" = "701" ]
then
echo "(servidores usuarios)";
echo
if [ "$opcion711" = "1" ]
then
    echo "${cv}    [x]${cn} 711: Crear usuario.${cn}";
else
    echo "${cM}    [ ]${cn} 711: Crear usuario.";
fi

if [ "$opcion712" = "1" ]
then
    echo "${cv}    [x]${cn} 712: Crear grupo usuarios.${cn}";
else
    echo "${cM}    [ ]${cn} 712: Crear grupo usuarios.";
fi

if [ "$opcion713" = "1" ]
then
    echo "${cv}    [x]${cn} 713: Asignar grupo a usuario.${cn}";
else
    echo "${cM}    [ ]${cn} 713: Asignar grupo a usuario.";
fi

if [ "$opcion714" = "1" ]
then
    echo "${cv}    [x]${cn} 714: Mover usuario a un grupo.${cn}";
else
    echo "${cM}    [ ]${cn} 714: Mover usuario a un grupo.";
fi

if [ "$opcion715" = "1" ]
then
    echo "${cv}    [x]${cn} 715: Crear password a usuario Samba.${cn}";
else
    echo "${cM}    [ ]${cn} 715: Crear password a usuario Samba.";
fi

if [ "$opcion719" = "1" ]
then
    echo "${cv}    [x]${cn} 719: Instalar Gestor VISUAL de usuarios.${cn}";
else
    echo "${cM}    [ ]${cn} 719: Instalar Gestor VISUAL de usuarios.";
fi
echo
echo
echo
echo
echo
echo "${cM}    INTRO: Menu 3 (serv.) | 0: Menu 0 | \c";
fi

##menu72
if [ "$menu" = "702" ]
then
echo "(servidores carpetas)";
echo
if [ "$opcion721" = "1" ]
then
    echo "${cv}    [x]${cn} 721: Crear carpeta.${cn}";
else
    echo "${cM}    [ ]${cn} 721: Crear carpeta.";
fi
if [ "$opcion722" = "1" ]
then
    echo "${cv}    [x]${cn} 722: Modificar permisos carpeta.${cn}";
else
    echo "${cM}    [ ]${cn} 722: Modificar permisos carpeta.";
fi
if [ "$opcion723" = "1" ]
then
    echo "${cv}    [x]${cn} 723: Modificar propietario carpeta.${cn}";
else
    echo "${cM}    [ ]${cn} 723: Modificar propietario carpeta.";
fi
if [ "$opcion724" = "1" ]
then
    echo "${cv}    [x]${cn} 724: Modificar GRUPO carpeta.${cn}";
else
    echo "${cM}    [ ]${cn} 724: Modificar GRUPO carpeta.";
fi
echo
echo
echo
echo
echo
echo
echo
echo "${cM}    INTRO: Menu 4 (serv.) | 0: Menu 0 | \c";
fi

##menu73
if [ "$menu" = "703" ]
then
echo "(WEB servidores)";
echo
if [ "$opcion731" = "1" ]
then
    echo "${cv}    [x]${cn} 731: Instalar servidor WEB (APACHE+MYSQL).${cn}";
else
    echo "${cM}    [ ]${cn} 731: Instalar servidor WEB (APACHE+MYSQL).";
fi
if [ "$opcion732" = "1" ]
then
    echo "${cv}    [x]${cn} 732: Instalar WORDPRESS (WEB).${cn}";
else
    echo "${cM}    [ ]${cn} 732: Instalar WORDPRESS (WEB).";
fi

if [ "$opcion734" = "1" ]
then
    echo "${cv}    [x]${cn} 734: Instalar PXE.${cn}";
else
    echo "${cM}    [ ]${cn} 734: Instalar PXE.";
fi
if [ "$opcion735" = "1" ]
then
    echo "${cv}    [x]${cn} 735: Activar DHCP PXE.${cn}";
else
    echo "${cM}    [ ]${cn} 735: Activar DHCP PXE.";
fi
if [ "$opcion736" = "1" ]
then
    echo "${cv}    [x]${cn} 736: Activar FTP PXE.${cn}";
else
    echo "${cM}    [ ]${cn} 736: Activar FTP PXE.";
fi
menu=699;
echo
echo
echo
echo
echo
echo
echo "${cM}    INTRO: Menu 1 (serv.) | 0: Menu 0 | \c";
fi


####################################################################
###Menu extra
##menu900
if [ "$menu" = "900" ]
then
echo "(otros comandos)";
echo
echo "backuptic - Crea un backup del perfil usuario.";
echo "restaurartic - Restaura la copia de backuptic";
echo "congelar - Restaura el backuptic en cada reinicio";
echo "bebianapt - Convierte una instalacion limpia en la maqueta BEBIAN (programas EDIXGAL)";
echo "fullapt - Instala todas las aplicaciones de ABALAR";
echo "speaker - Realiza un test de altavoces";
echo "limpia - Borra los historiales del terminal";
echo "kill - Termina una aplicación o proceso";
echo "swap - Repara la signacion de la particion swap";
echo
echo "${cM}    INTRO: Menu2 (otros) | 0: Menu 0 | \c";
fi

##menu901
if [ "$menu" = "901" ]
then
echo "(otros aplicaciones)";
echo
echo
echo
echo "cocodrile - Instala el crocodile (y Wine)";
echo "pneusim - Instala el pneusim (y Wine)";
echo "flsim - Instala el fluidsim (y Wine)";
echo
echo
echo
echo
echo
echo "${cM}    INTRO: Menu 3 (otros) | 0: Menu 0 | \c";
fi

##menu902
if [ "$menu" = "902" ]
then
echo "(otros Drivers)";
echo
echo "wifi - Intala los drivers de las tarjetas wifi (necesita LAN)";
echo "broadcom - Instala drivers broadcom";
echo "nvidia - Instala drivers graficas nvidia";
echo "hplip - Instala drivers para impresoras HP";
echo
echo
echo
echo
echo
echo "${cM}    INTRO: Menu 4 (serv.) | 0: Menu 0 | \c";
fi

##menu903
if [ "$menu" = "903" ]
then
echo "(otros herramientas)";
echo

menu=899;
echo "clonezilla - Instala el clonezilla.";
echo "mc - Instala un visor de estructura de archivos que permite abrirlos";
echo "dc - Double Commander, gestion VISUAL de ficheros (similar total comander)"
echo
echo
echo
echo "${cM}    INTRO: Menu 1 (serv.) | 0: Menu 0 | \c";
fi

##fin menus

echo "a: Ayuda. | i: Informacion | q: Salir | fix: reparar${cn}";
echo


	echo "    Opcion: \c";
	read opcion;
	##reponemos color
        printf %b '\e]11;#000000\a'
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
echo "${ca}Editando nombre del equipo...${cn}";
sleep 1
echo "NOMBRE ACTUAL DEL EQUIPO ${cr}$hostn${cn}";
echo "Indique NUEVO nombre del equipo: ${cv}\c";
read nombre;
echo $nombre > /etc/hostname;
sed -i "s/$hostn/$nombre/g" /etc/hosts;
hostn=$(cat /etc/hostname);
clear;
echo "${cn}NOMBRE ACTUAL DEL EQUIPO ${cv}$hostn${cn}";
sleep 1
opcion2="1";
;;


##Opcion 3
3)
echo "nameserver 10.180.188.75">> /etc/resolv.conf;
echo "nameserver 10.180.188.43">> /etc/resolv.conf;
opcion3="1";
;;

##Opcion 3
-3)
nano /etc/resolv.conf;
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

if [ "$VTIPO" = "x86_64" ]
then
echo "allow-hotplug enp3s0";
echo "iface enp3s0 inet static";
else
echo "allow-hotplug eth0";
echo "iface eth0 inet static";
fi
echo "address $iptipo.$ipequipo";
if [ "$VTIPO" = "x86_64" ]
then
echo "broadcast $iptipo.255";
else
echo "network $iptipo.0";
fi
echo "netmask 255.255.255.0";
echo "gateway $iptipo.$ippta";
echo
echo
echo "Deseas guardar estos parametros (S/N)?: \c";
read confIP;
if [ "$confIP" = "S" ]
then

##auto eth0>> /etc/network/interfaces;
echo "##INSERTADO DESDE AQUI">> /etc/network/interfaces;
if [ "$VTIPO" = "x86_64" ]
then
echo "allow-hotplug enp3s0">> /etc/network/interfaces;
echo "iface enp3s0 inet static">> /etc/network/interfaces;

else
echo "allow-hotplug eth0">> /etc/network/interfaces;
echo "iface eth0 inet static">> /etc/network/interfaces;
fi
echo "address $iptipo.$ipequipo">> /etc/network/interfaces;
if [ "$VTIPO" = "x86_64" ]
then
echo "broadcast $iptipo.255">> /etc/network/interfaces;
else
echo "network $iptipo.0">> /etc/network/interfaces;
fi
echo "netmask 255.255.255.0">> /etc/network/interfaces;
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
echo "${ca}Hecho!${cn}";
sleep 1
opcion5="1";
;;

##Opcion 6
6)
if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Instalando...${cn}";
	sleep 1
	apt-get -y install openssh-server 
	esto="#PermitRootLogin prohibit-password";
	poresto="PermitRootLogin yes";
	sed -i "s/$esto/$poresto/g" /etc/ssh/sshd_config;
	apt-get -y install sshpass
	##Denegar el acceso al usuario usuario en ssh
	echo "DenyUsers usuario">> /etc/ssh/sshd_config
else
	clear
	echo "${ca}Instalando...${cn}";
	sleep 1
	esto="PermitRootLogin without-password";
	poresto="PermitRootLogin yes";
	sed -i "s/$esto/$poresto/g" /etc/ssh/sshd_config;
	apt-get -y install sshpass
	##Denegar el acceso al usuario usuario en ssh
	echo "DenyUsers usuario">> /etc/ssh/sshd_config
fi
clear
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
echo "${ca}Modificando crontab -e...${cn}";
sleep 1
crontab -e
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion7="0";
;;

##Opcion pxe
8)
echo "${ca}Acceso a carpetas de red...${cn}";
apt-get install -y gvfs-fuse gvfs-backends
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion8="1";
;;



##Opcion 9
9)
apt-get -y install memtest86+
echo "${ca}Instalado!${cn}";
sleep 1
opcion9="1";
;;

##Opcion -9
-9)
apt-get -y remove memtest86+
echo "${ca}Hecho!${cn}";
sleep 1
opcion9="0";
;;

##Opcion -9
upgrade)
echo "${ca}Atencion! El sistema se actualizara a la ultima version disponible${cn}";
sleep 2
echo "${ca}No interrumpa el proceso (PUEDE LLEVAR ALGUN TIEMPO)${cn}";
sleep 3
clear
echo "${ca}Pulse Ctrl+c Si NO quiere actualizar (LLEVA TIEMPO), en caso contrario${cn}";
echo "${ca}NO interrumpa el proceso.${cn}";
sleep 5
clear
echo "${ca}Empezemos...${cn}";
sleep 1
echo "${ca}En caso de pedir modificar el GRUB, indique la unidad de disco (ej. sda).${cn}";
echo "${ca}No la particion (sda1).${cn}";
sleep 3
echo "${ca}Vamos..${cn}";
sleep 1
apt-get upgrade -y
echo "${ca}Hecho!${cn}";
sleep 1
;;

##Opcion pxe
10)
echo "${ca}Instalando inicip PXE...${cn}";
apt-get install -y ipxe
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion10="1";
;;

##Opcion wifi
wifi)
apt-get --fix-broken install
	if [ "$VTIPO" = "x86_64" ]
	then
	clear
	echo "${ca}Instalando...${cn}";
	sleep 1
	echo "ATENCION";
  	sleep 1
	echo "SI NO FUNCIONA,";
 	sleep 1
	echo "y si no has hecho con anterioridad una modificacion de sources,";
 	sleep 1
  	echo "ejecuta el comando :   sources";
 	sleep 1
    	echo "para agregar los repositorios non-free";
 	sleep 1
      	echo "podras revisarlos con el comando -sources";
 	sleep 1
	else
	clear
	echo "${ca}Instalando...${cn}";
	sleep 1
	echo "##WIFI##">> /etc/apt/sources.list;
 	echo "##NONFREE##">> /etc/apt/sources.list;
	echo "deb http://deb.debian.org/debian stretch main contrib non-free">> /etc/apt/sources.list;
	echo "deb-src  http://deb.debian.org/debian stretch main contrib non-free">> /etc/apt/sources.list;
	echo "deb http://deb.debian.org/debian stretch-updates main contrib non-free">> /etc/apt/sources.list;
	echo "deb-src  http://deb.debian.org/debian stretch-updates main contrib non-free">> /etc/apt/sources.list;
	echo "deb http://security.debian.org/ stretch/updates main contrib non-free">> /etc/apt/sources.list;
	echo "deb-src http://security.debian.org/ stretch/updates main contrib non-free">> /etc/apt/sources.list;
	fi
apt-get -y install firmware-misc-nonfree
apt-get -y install firmware-atheros
apt-get -qq update;
apt-get -y install upgrade;
apt-get -y install firmware-iwlwifi;
modprobe -r iwlwifi;
modprobe iwlwifi;
apt-get -y install firmware-b43-installer
apt-get -y install firmware-realtek
;;
##Opcion-wifi
-wifi)
nano /etc/apt/sources.list;
;;


##Opcion sshpass
sshpass)
apt-get -y install sshpass
echo "${ca}Hecho!${cn}";
sleep 1
opcion88="1";
;;

##Opcion -sshpass
-sshpass)
apt-get -y remove sshpass
echo "${ca}Hecho!${cn}";
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
echo "IP MODELO xx.xx.xx : \c";
read ipm
echo "IP INICIAL : \c";
read ipini
echo "IP FINAL : \c";
read ipfin
echo "COMANDO: \c";
read comandossh
while [ $ipini -le $ipfin ]; do
	clear;	
	echo "${ca}$ipini${cn}";
	sleep 1;
	##echo  "$ipini"
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
if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Detectado debian x64)${cn}";
	echo "ofris-en no funciona en sistemas 64. Utilice el comando -congelar-";
	sleep 3
else
	clear
	echo "${ca}Instalando...${cn}";
	sleep 1
	echo "ATENCION, esta aplicacion ya se encuentra instalada en BEBIAN 32";
	read pausa
	wget -q http://goo.gl/V94Qs -O ofris.deb
	dpkg -iG ofris.deb
        echo "En caso de no iniciar el configurador, ejecuta: ofris-en";
	sleep 3
        ofris-en
        echo "${ca}Hecho!${cn}";
fi
sleep 2
clear
opcion21="1";
;;

##Opcion -21
-21)
echo "${ca}Borrando...${cn}";
sleep 1
apt-get remove ofris
clear
echo "${ca}Hecho!${cn}";
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
echo $ipepoptes"        "SERVER >> /etc/hosts;
echo "${ca}Hecho!${cn}";
sleep 1
clear;
echo "Verifica que ha registrado la maquina -succes-.";
echo "De lo contrario realiza el proceso de forma manual.";
echo "apt-get -qq update y luego apt-get install epoptes-client";
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
apt-get -qq update
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
echo "${ca}Instalando...${cn}";
sleep 1
apt-get -qq update
apt-get -y install cups
/etc/init.d/cups restart
echo "${ca}Hecho!${cn}";
opcion16="1";
;;


##Opcion 25
25)
apt-get -y install nautilus
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

##Opcion 26
26)
if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Procesando...  ${cn}";
	sleep 1
	echo "${ca}No hay soporte oficial para versiones x64 LINUX ${cn}";
	sleep 4
	echo "${ca}Instalando complemento flatpak para poder utilizar la aplicacion ${cn}";
	sleep 4

	apt-get update --fix-missing
	apt-get -y install flatpak
	echo "${ca}Instalando plugin gnome ${cn} ";
	sleep 4

	apt-get -y install gnome-software-plugin-flatpak

	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

	echo "${ca}Instalando OpenBoard para flatpak ${cn}";
	sleep 4

	flatpak install flathub ch.openboard.OpenBoard

	echo "[Desktop Entry]" > /usr/share/applications/openboard.desktop
	echo "Name=openboard install">> /usr/share/applications/openboard.desktop
	echo "Comment=">> /usr/share/applications/openboard.desktop
	echo "Exec=flatpak run ch.openboard.OpenBoard">> /usr/share/applications/openboard.desktop
	echo "Icon=">> /usr/share/applications/openboard.desktop
	echo "Terminal=false">> /usr/share/applications/openboard.desktop
	echo "Type=Application">> /usr/share/applications/openboard.desktop
	echo "Categories=Development;IDE;">> /usr/share/applications/openboard.desktop


	echo "${ca}Cierre sesion o reinicie el PC para generar icono del menu. ${cn}";
	sleep 5
else
	clear
	echo "${ca}Incluido ya en Bebian32...  ${cn}";
	sleep 1
fi
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion26="1";
;;

##Opcion 27
27)
if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Descargando...  ${cn}";
	sleep 1
	wget https://dl.google.com/dl/earth/client/current/google-earth-pro-stable_current_amd64.deb
	dpkg -iG google-earth-pro-stable_current_amd64.deb
 	rm google-earth-pro-stable_current_amd64.deb
	clear
	echo "${ca}Hecho!${cn}";
	sleep 1
else
	clear
	echo "${ca}Incluido ya en Bebian32...  ${cn}";
	sleep 1
fi
sleep 1
opcion27="1";
;;

##Opcion geogerba
28)
if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Descargando...  ${cn}";
	sleep 1
	wget http://www.geogebra.net/linux/pool/main/g/geogebra-classic/geogebra-classic_6.0.666.0-202109211234_amd64.deb
	dpkg -iG geogebra-classic_6.0.666.0-202109211234_amd64.deb
 	rm geogebra-classic_6.0.666.0-202109211234_amd64.deb
	clear
	echo "${ca}Hecho!${cn}";
	sleep 1
else
	clear
	echo "${ca}Incluido ya en Bebian32...  ${cn}";
	sleep 1
fi
sleep 1
opcion28="1";
;;

##Opcion wine
29)
clear
echo "${ca}Instalando...  ${cn}";
sleep 1
apt --fix-broken -y install
apt-get update --fix-missing
apt-get install -f
apt-get remove
apt -y autoremove
apt-get update
apt-get install wine32
mkdir /home/usuario/wine/
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion29="1";
;;

##Opcion 31
31)
echo "${ca}Instalando java...${cn}";
if [ "$VTIPO" = "x86_64" ]
then
apt-get -qq update
	echo "${ca}JRE...${cn}";
	apt install -y default-jre
	echo "${ca}JDK...${cn}";
	apt install -y default-jdk
else
	echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list
	echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
	apt-get -y update
	apt-get -y install oracle-java8-installer
fi
echo "${ca}Hecho!${cn}";
sleep 1
opcion31="1";
;;


##Opcion -31
-31)
echo "${ca}Borrando...${cn}";
sleep 1
apt-get remove default-jdk
apt-get remove oracle-java8-installer
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion31="0";
;;
##Opcion 32
32)
echo "${ca}Instalando...${cn}";
sleep 1
wget http://ardownload.adobe.com/pub/adobe/reader/unix/9.x/9.5.5/enu/AdbeRdr9.5.5-1_i386linux_enu.deb
apt-get -qq update
dpkg -iG AdbeRdr9.5.5-1_i386linux_enu.deb
rm AdbeRdr9.5.5-1_i386linux_enu.deb
clear
echo "Instalado!.";
sleep 1
opcion32="1";
;;
##Opcion -32
-32)
echo "${ca}Borrando...${cn}";
sleep 1
apt-get remove adobereader-enu
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion32="0";
;;

##Opcion 33
33)
if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Instalando...${cn}";
	sleep 1
        laurl=$liburl64
        libversion=$libver64
	
        ####verificar url
        testURL=$laurl$libversion"/deb/x86_64/"
	if curl --output /dev/null --silent --head --fail "$testURL"
	then
		echo "Descargando!...."
		wget $laurl$libversion"/deb/x86_64/LibreOffice_""$libversion""_Linux_x86-64_deb.tar.gz"
		tar -xzvf LibreOffice_"$libversion"_Linux_x86-64_deb.tar.gz
		wget $laurl$libversion"/deb/x86_64/LibreOffice_"$libversion"_Linux_x86-64_deb_langpack_es.tar.gz"
		tar -xzvf LibreOffice_"$libversion"_Linux_x86-64_deb_langpack_es.tar.gz
		wget $laurl$libversion"/deb/x86_64/LibreOffice_"$libversion"_Linux_x86-64_deb_helppack_es.tar.gz" 
		tar -xzvf LibreOffice_"$libversion"_Linux_x86-64_deb_helppack_es.tar.gz
		dpkg -i LibreOffice_"$libversion".2_Linux_x86-64_deb/DEBS/*.deb
		dpkg -i LibreOffice_"$libversion".2_Linux_x86-64_deb_helppack_es/DEBS/*.deb
		dpkg -i LibreOffice_"$libversion".2_Linux_x86-64_deb_langpack_es/DEBS/*.deb
		##segundo intento	
		dpkg -i LibreOffice_"$libversion".2_Linux_x86-64_deb/DEBS/*.deb
		dpkg -i LibreOffice_"$libversion".2_Linux_x86-64_deb_langpack_es/DEBS/*.deb
		dpkg -i LibreOffice_"$libversion".2_Linux_x86-64_deb_helppack_es/DEBS/*.deb
		##rm -R LibreOffice*
	else
		clear
		echo "${ca}URL de actualizacion no disponible, o falta curl... instalando curl${cn}"
		apt-get -qq -y install curl
		apt-get update
		clear
		echo "${ca}Ejecuta de nuevo el comando sources y la instalacion.${cn}"
		sleep 4
	fi
else
	libversion=$libver32
	laurl=$liburl32
	echo "${ca}Instalando (ULTIMA 32Bits) ${cn} ";
	sleep 1

	##SERVIDORES PROBADOS
	##laurl="http://ftp.uvigo.es/tdf/libreoffice/stable/"
	##laurl="http://ftp.wayne.edu/tdf/libreoffice/stable/"

	wget $laurl$libversion"/deb/x86/LibreOffice_""$libversion""_Linux_x86_deb.tar.gz"
	tar -xzvf LibreOffice_"$libversion"_Linux_x86_deb.tar.gz
	dpkg -i LibreOffice_"$libversion"_Linux_x86_deb/DEBS/*.deb
	wget $laurl$libversion"/deb/x86/LibreOffice_"$libversion"_Linux_x86_deb_helppack_es.tar.gz" 
	tar -xzvf LibreOffice_"$libversion"_Linux_x86_deb_helppack_es.tar.gz
	dpkg -i LibreOffice_"$libversion"_Linux_x86_deb_helppack_es/DEBS/*.deb
	wget $laurl$libversion"/deb/x86/LibreOffice_"$libversion"_Linux_x86_deb_langpack_es.tar.gz"
	tar -xzvf LibreOffice_"$libversion"_Linux_x86_deb_langpack_es.tar.gz
	dpkg -i LibreOffice_"$libversion"_Linux_x86_deb_langpack_es/DEBS/*.deb
	##rm -R LibreOffice*

fi
echo "${ca}Hecho!${cn}";
sleep 1
opcion33="1";
;;


-33)
echo "${ca}Borrando Libreoffice...${cn} ";
sleep 1

if [ "$VTIPO" = "x86_64" ]
then

        laurl=$liburl64
        libversion=$libver64
	
        ####verificar url
        testURL=$laurl$libversion"/deb/x86_64/"

		if curl --output /dev/null --silent --head --fail "$testURL"
		then
		echo "Borrando!...."
		apt-get -y remove --purge libreoffice*
		apt-get -y clean
		apt-get -y autoremove
		clear
		echo "${ca}Hecho!${cn}";
		else
		clear
		apt-get -qq -y install curl
		apt-get update
		clear
		echo "${ca}Ejecuta de nuevo el comando sources y la instalacion.${cn}"
		sleep 4
		fi

else
	apt-get -y remove --purge libreoffice*
	apt-get -y clean
	apt-get -y autoremove
	clear
	echo "${ca}Hecho!${cn}";
fi
echo "${ca}Hecho!${cn}";
sleep 1
opcion33="0";
;;


-33b)
echo "${ca}Borrando Libreoffice...${cn} ";
sleep 1

if [ "$VTIPO" = "x86_64" ]
then
        laurl=$liburl64
        libversion=$libver64
        ####verificar url
        
        ####verificar url
        testURL=$laurl$libversion"/deb/x86_64/"

	if curl --output /dev/null --silent --head --fail "$testURL"
	then
	apt-get -y remove --purge libreoffice*
	apt-get -y clean
	apt-get -y autoremove
	clear
	echo "${ca}Hecho!${cn}";
	else
		clear
		echo "CANCELADO!.URL de actualizacion no disponible"
		sleep 3
	fi

else
	apt-get -y remove --purge libreoffice*
	apt-get -y clean
	apt-get -y autoremove
	clear
	echo "${ca}Hecho!${cn}";
fi
echo "${ca}Hecho!${cn}";
sleep 1
opcion33="0";
;;


##Opcion 34
34)
echo "${ca}Instalando...${cn}";
sleep 1
apt-get -y install brasero
echo "Instalado!.";
sleep 1
opcion34="1";
;;

-34)
echo "${ca}Borrando...${cn}";
sleep 1
sudo apt-get -y remove --purge brasero
apt-get clean
apt-get autoremove
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion34="0";
;;

##Opcion 35
35)
echo "${ca}Instalando...${cn}";
sleep 1
apt-get -y install bluefish
echo "Instalado!.";
sleep 1
opcion35="1";
;;

-35)
echo "${ca}Borrando...${cn}";
sleep 1
sudo apt-get -y remove --purge bluefish
apt-get clean
apt-get autoremove
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion35="0";
;;


##Opcion 36
36)
if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Instalando...${cn}";
	sleep 1
	apt-get -y install gimp


else

	echo "${ca}Instalando...${cn}";
	sleep 1
	apt-get -y install gimp

fi
echo "${ca}Hecho!${cn}";
sleep 1
opcion36="1";
;;
##Opcion -36
-36)
echo "${ca}Quitando...${cn}";
sleep 1
sudo apt-get remove gimp
clear
echo "Quitado!";
sleep 1
opcion36="0";
;;

##Opcion 37
37)
if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Instalando...${cn}";
	sleep 1
        wget http://ftp.es.debian.org/debian/pool/main/p/pinta/pinta_1.6-2_all.deb
        dpkg -i pinta_1.6-2_all.deb
	rm pinta_1.6-2_all.deb
	apt --fix-broken -y install
else
	echo "${ca}Instalando...${cn}";
	sleep 1
        wget http://ftp.es.debian.org/debian/pool/main/p/pinta/pinta_1.6-2_all.deb
        dpkg -i pinta_1.6-2_all.deb
	rm pinta_1.6-2_all.deb
	apt --fix-broken -y install

fi
echo "${ca}Hecho!${cn}";
sleep 1
opcion37="1";
;;

##Opcion -37
-37)
echo "${ca}Quitando...${cn}";
sleep 1
sudo apt-get remove pinta
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion37="0";
;;

##Opcion 38
38)
if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Instalando...${cn}";
	sleep 1
	apt-get -y install freeplane
	apt --fix-broken -y install
else
	echo "${ca}No hay soporte para x32${cn}";
fi
echo "${ca}Hecho!${cn}";
sleep 1
opcion38="1";
;;

##Opcion -38
-38)
echo "${ca}Quitando...${cn}";
sleep 1
sudo apt-get remove freeplane
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion38="0";
;;

##Opcion 39
39)
if [ "$VTIPO" = "x86_64" ]
then
	clear
 	echo "${ca}Instalando...${cn}";
  	sleep 1
   	wget --user-agent="Mozilla" https://estaticos.redsara.es/comunes/autofirma/currentversion/AutoFirma_Linux_Debian.zip
  	apt install openjdk-11-jre -y
  	unzip AutoFirma_Linux_Debian.zip -d /root/
   	dpkg -i AutoFirma_1_8_2.deb
	rm AutoFirma_*
	apt --fix-broken -y install
else
	echo "${ca}No hay soporte para x32${cn}";
fi
echo "${ca}Hecho!${cn}";
sleep 1
opcion39="1";
;;

##Opcion 41
41)
echo "${ca}Instalando...${cn}";
sleep 1
apt -y --fix-broken install
apt-get -y install gparted
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion41="1";
;;
##Opcion -41
-41)
echo "${ca}Quitando...${cn}";
sleep 1
sudo apt-get remove gparted
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion41="0";
;;

##Opcion 42
42)

if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Instalando...${cn}";
	sleep 1
	wget https://download.virtualbox.org/virtualbox/6.1.22/virtualbox-6.1_6.1.22-144080~Debian~buster_amd64.deb
	dpkg -iG virtualbox-6.1_6.1.22-144080~Debian~buster_amd64.deb
	rm virtualbox-6.1_6.1.22-144080~Debian~buster_amd64.deb
else
	wget https://download.virtualbox.org/virtualbox/5.2.22/virtualbox-5.2_5.2.22-126460~Debian~jessie_i386.deb
	dpkg -iG virtualbox-5.2_5.2.22-126460~Debian~jessie_i386.deb
	rm virtualbox-5.2_5.2.22-126460~Debian~jessie_i386.deb
fi
sleep 2
echo "${ca}Hecho!${cn}";
sleep 1
opcion42="1";
;;

##Opcion 43
43)
apt-get -y install ark
sleep 2
echo "${ca}Hecho!${cn}";
sleep 1
opcion43="1";
;;


##Opcion 44
44)
echo "${ca}Instalando...${cn}";
apt-get -y install filezilla
echo "${ca}Hecho!${cn}";
sleep 1
opcion44="1";
;;

##Opcion -44
-44)
echo "Borrando filezilla ..."
apt-get -y remove filezilla
echo "${ca}Hecho!${cn}";
sleep 1
opcion44="0";
;;


##Opcion 46
46)
echo "${ca}Instalando...${cn}";
sleep 1
apt-get -qq update
apt-get install Wireshark
echo "${ca}Hecho!${cn}";
sleep 1
opcion46="1";
;;
-46)
echo "${ca}Quitando...${cn}";
sleep 1
sudo apt-get remove Wireshark
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion46="0";
;;


##Opcion 47
47)
if [ "$VTIPO" = "x86_64" ]
then
	echo "${ca}Instalando flameshot ${cn}";
	sleep 1
	apt-get -qq update
	apt-get -y install flameshot
	apt-get -y install shutter
else
	echo "${ca}Instalando shutter ${cn} ";
	sleep 1
	apt-get -qq update
	apt-get -y install shutter
fi
echo "${ca}Hecho!${cn}";
sleep 1
opcion47="1";
;;

##Opcion -47
-47)
if [ "$VTIPO" = "x86_64" ]
then
	echo "${ca}Desinstalando flameshot ${cn}";
	sleep 1
	apt-get -y remove flameshot
else
	echo "${ca}Desinstalando shutter ${cn} ";
	sleep 1
	apt-get -y remove shutter
fi
echo "${ca}Hecho!${cn}";
sleep 1
opcion47="0";
;;


##Opcion 48
48)
if [ "$VTIPO" = "x86_64" ]
then
	echo "${ca}Instalando...${cn}";
	sleep 1
	wget $REPOSITORIO/repository/scannerx64.deb
	dpkg -i scannerx64.deb
	wget https://github.com/angryip/ipscan/releases/download/3.7.6/ipscan_3.7.6_amd64.deb
	dpkg -i ipscan_3.7.6_amd64.deb
	rm scannerx64.deb
	rm ipscan_3.7.6_amd64.deb
else
	echo "${ca}Instalando...${cn}";
	sleep 1
	wget $REPOSITORIO/repository/scannerx86.deb
	wget https://github.com/angryip/ipscan/releases/download/3.7.6/ipscan_3.7.6_all.deb
	dpkg -i scannerx86.deb
	dpkg -i ipscan_3.7.6_all.deb
	rm scannerx86.deb
	rm ipscan_3.7.6_all.deb
fi
echo "${ca}Hecho!${cn}";
sleep 1
opcion48="1";
;;

##Opcion -48
-48)
dpkg -r sharescanner
dpkg --purge sharescanner
echo "${ca}Hecho!${cn}";
sleep 1
opcion48="0";
;;

##Opcion 49
49)
wget https://mega.nz/linux/repo/Debian_12/amd64/megacmd_1.7.0-4.1_amd64.deb
dpkg -i megacmd_1.7.0-4.1_amd64.deb
rm megacmd_1.7.0-4.1_amd64.deb
apt --fix-broken -y install
apt-get update --fix-missing
apt-get install -f
apt-get remove
apt -y autoremove
echo "${ca}Hecho!${cn}";
sleep 1
opcion49="1";
;;

##Opcion 51
51)
echo "${ca}Instalando...${cn}";
wget https://deb.opera.com/opera/pool/non-free/o/opera-stable/opera-stable_101.0.4843.33_amd64.deb
apt-get install apt-transport-https
dpkg -iG opera-stable_101.0.4843.33_amd64.deb
rm opera-stable_101.0.4843.33_amd64.deb
echo "${ca}Hecho!${cn}";
sleep 1
;;
##Opcion 51
-51)
echo "${ca}Quitando...${cn}";
sleep 1
dpkg -r opera-stable
dpkg --purge opera-stable
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion51="0";
;;

##Opcion 52
52)
echo "${ca}Instalando...${cn}";
sleep 1
sudo apt-get -y install w3m
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion52="1";
;;
##Opcion 52
-52)
echo "${ca}Quitando...${cn}";
sleep 1
sudo apt-get remove w3m
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion52="0";
;;

##Opcion 53
53)
echo "${ca}Instalando...${cn}";
sleep 1
sudo apt-get -y install lynx
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion53="1";
;;
##Opcion 53
-53)
echo "${ca}Quitando...${cn}";
sleep 1
sudo apt-get remove lynx
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion53="0";
;;

##Opcion 54
54)
echo "${ca}Instalando...${cn}";
sleep 1
sudo apt-get -y install elinks
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion54="1";
;;
##Opcion 54
-54)
echo "${ca}Quitando...${cn}";
sleep 1
sudo apt-get remove elinks
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion54="0";
;;

##Opcion 55
55)
echo "${ca}Instalando...${cn}";
sleep 1
if [ "$VTIPO" = "x86_64" ]
then
	wget http://ftp.es.debian.org/debian/pool/contrib/t/torbrowser-launcher/torbrowser-launcher_0.3.6-2~bpo11+1_amd64.deb
	dpkg -i torbrowser-launcher_0.3.6-2~bpo11+1_amd64.deb
	rm torbrowser-launcher_0.3.6-2~bpo11+1_amd64.deb
	##flatpak install flathub com.github.micahflee.torbrowser-launcher
	apt-get -y install python3
	apt --fix-broken install
else
	printf "deb http://deb.debian.org/debian jessie-backports main contrib\n" > /etc/apt/sources.list.d/jessie-backports.list
	printf "deb http://deb.debian.org/debian jessie-backports-sloppy main contrib" >> /etc/apt/sources.list.d/jessie-backports.list
	apt-get -qq update
	apt-get install torbrowser-launcher -t jessie-backports-sloppy
	torbrowser-launcher
fi
echo "${ca}Hecho!${cn}";
sleep 1
opcion55="1";
;;
##Opcion -55
-55)
echo "${ca}Quitando...${cn}";
sleep 1
sudo apt-get remove torbrowser-launcher
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion55="0";
;;

##Opcion 56
56)
if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Instalando firefox-esr...${cn}";
	sleep 1
	clear
	apt-get install -f
	apt-get -y update
	apt-get -y install firefox-esr
else
	clear
	echo "${ca}Instalando...${cn}";
	sleep 1
	wget https://ftp.mozilla.org/pub/firefox/candidates/68.9.0esr-candidates/build1/linux-i686/es-ES/firefox-68.9.0esr.tar.bz2
	tar -xvf firefox-68.9.0esr.tar.bz2 
        mv /usr/lib/firefox\-esr/ /usr/lib/firefox\-esr\_old/ 
	mv -f firefox/ /usr/lib/firefox\-esr/
	rm firefox-68.9.0esr.tar.bz2
	sleep 1
fi
echo "${ca}Hecho!${cn}";
sleep 1
opcion56="1";
;;

##Opcion -56
-56)
echo "${ca}Quitando...${cn}";
sleep 1
apt-get remove firefox-esr
apt-get purge firefox-esr
rm -R /home/usuario/.mozilla
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion56="0";
;;


##Opcion 57
57)
esto="vnd.adobe.flash.movie";
poresto="x-shockwave-flash";
sed -i "s/$esto/$poresto/g" /usr/share/mime/packages/freedesktop.org.xml;
update-mime-database /usr/share/mime
echo "${ca}Hecho!${cn}";
sleep 1
echo "Predetermina el Mozilla como predeterminado abriendo un fichero!.";
sleep 4
opcion57="1";
;;


##Opcion 58
58)
if [ "$VTIPO" = "x86_64" ]
then
	clear
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	dpkg -i google-chrome-stable_current_amd64.deb
	rm google-chrome-stable_current_amd64.deb
	clear
	echo "${ca}Hecho!${cn}";
	clear
else
	clear
	echo "${ca}No soportado${cn}";
	sleep 1
	sleep 1
fi
sleep 2
opcion58="1";
;;

-58)
clear
echo "${ca}Desinstalando chrome!${cn}";
sleep 2
dpkg -r google-chrome-stable
apt-get -y remove google-chrome-stable
rm /home/usuario/.config/google-chrome/ -R
apt-get -y purge google-chrome-stable
echo "${ca}Hecho!${cn}";
sleep 2
opcion58="0";
;;


##Opcion 59
59)
echo "${ca}Descargando...${cn}";
sleep 1
wget http://ftp.es.debian.org/debian/pool/contrib/f/flashplugin-nonfree/flashplugin-nonfree_3.6.1+deb8u1_i386.deb
dpkg -iG flashplugin-nonfree_3.6.1+deb8u1_i386.deb
wget http://archive.canonical.com/ubuntu/pool/partner/a/adobe-flashplugin/adobe-flashplugin_20160712.1-0ubuntu0.15.10.1_i386.deb
dpkg -iG adobe-flashplugin_20160712.1-0ubuntu0.15.10.1_i386.deb
clear
echo "${ca}Hecho!${cn}";
rm adobe-flashplugin_20160712.1-0ubuntu0.15.10.1_i386.deb
sleep 1
opcion88="1";
;;




##Opcion 61
61)
echo "${ca}Instalando...${cn}";
sleep 1
apt-get -qq update
apt-get -y install deb-multimedia-keyring
apt-get -qq update
apt-get -y install libfaad2 libmp4v2-2 libfaac0 alsa-utils lame libmp3lame0 libdvdnav4 libdvdread4 libdvdcss2 w32codecs ffmpeg memcodec mplayer2 
wget http://ftp.es.debian.org/debian/pool/main/f/ffmpeg/libavcodec-extra_4.1.6-1~deb10u1_all.deb
dpkg -i libavcodec-extra_4.1.6-1~deb10u1_all.deb
rm libavcodec-extra_4.1.6-1~deb10u1_all.deb
apt-get -y install phonon-backend-vlc mpeg2dec gpac x264
apt-get -y install libdvd-pkg
dpkg-reconfigure libdvd-pkg
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion61="1";
;;


##Opcion 62
62)
echo "${ca}Instalando...${cn}";
sleep 1
apt-get -qq update
apt-get -y install vlc
clear
echo "${ca}Habilitando codecs${cn}";
apt-get -y install libdvd-pkg
dpkg-reconfigure libdvd-pkg
sleep 1
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion62="1";
;;


##Opcion -62
-62)
echo "${ca}Quitando...${cn}";
sleep 1
apt-get remove vlc
apt-get purge vlc
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion62="0";
;;

##Opcion 63
63)
echo "${ca}Instalando...${cn}";
sleep 1
sudo apt-get -y install smplayer
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion63="1";
;;
##Opcion -63
-63)
echo "${ca}Quitando...${cn}";
sleep 1
apt-get remove smplayer
apt-get purge smplayer
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion63="0";
;;

##Opcion 64
64)
echo "${ca}Instalando...${cn}";
sleep 1
sudo apt-get -y install parole
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion64="1";
;;
##Opcion -64
-64)
echo "${ca}Quitando...${cn}";
sleep 1
apt-get remove parole
apt-get purge parole
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion64="0";
;;

##Opcion 65
65)
echo "${ca}Instalando...${cn}";
sleep 1
sudo apt-get -y install kdenlive
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion65="1";
;;
##Opcion -65
-65)
echo "${ca}Quitando...${cn}";
sleep 1
apt-get remove kdenlive
apt-get purge kdenlive
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion65="0";
;;



##Opcion arduino
71)

if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Instalando...${cn}";
	sleep 1
	##Eliminamos version antigua.
	apt-get -y remove arduino
	wget https://downloads.arduino.cc/arduino-1.8.13-linux64.tar.xz
	mv /home/usuario/arduino /home/usuario/aduino_old
	rm -r /usr/local/bin/arduino
	rm -r /usr/share/applications/arduino.desktop
	tar -xf arduino-1.8.13-linux64.tar.xz -C /home/usuario/
	mv /home/usuario/arduino-1.8.13 /home/usuario/arduino
	rm -r arduino-1.8.13-linux64.tar.xz
	chmod 777 -R /home/usuario/arduino/
	sh /home/usuario/arduino/install.sh
	chmod 777 /usr/local/bin/arduino
else

	echo "${ca}Instalando...${cn}";
	sleep 1
	##Eliminamos version antigua.
	apt-get -y remove arduino
	wget https://downloads.arduino.cc/arduino-1.8.9-linux32.tar.xz
	mv /home/usuario/arduino /home/usuario/aduino_old
	rm -r /usr/local/bin/arduino
	rm -r /usr/share/applications/arduino.desktop
	tar -xf arduino-1.8.9-linux32.tar.xz -C /home/usuario/
	mv /home/usuario/arduino-1.8.9 /home/usuario/arduino
	rm -r arduino-1.8.9-linux32.tar.xz
	chmod 777 -R /home/usuario/arduino/
	sh /home/usuario/arduino/install.sh
	chmod 777 /usr/local/bin/arduino
fi
echo "${ca}Abriendo permisos al puerto serie${cn}";
sleep 2
chmod 777 /dev/ttyUSB0
usermod -a -G dialout usuario
echo "${ca}Hecho!${cn}";
sleep 1
opcion71="1";
;;

##Opcion arduino
71b)
if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Recuerda tener el dispositivo conectado para que reconozca el puerto${cn}";
	sleep 2
	echo "${ca}Instalando librerias...${cn}";
 	apt-get install -y python3-tk python3-serial python-is-python3
	sleep 1
 	echo "${ca}Instalando arduinoblocks...${cn}";
	wget http://www.arduinoblocks.com/web/site/abconnectordownload/25
 	dpkg -iG 25
	rm 25
fi
echo "${ca}Abriendo permisos al los puertos serie reconocidos${cn}";
sleep 2
echo "${ca}MARCA EL PUERTO CONECTADO (ES EL QUE QUEDARÁ ACTIVO)${cn}";
sleep 2
echo "${ca}PUEDES HACER EL PROCESO VARIAS VECES Y MARCAR VARIOS PUERTOS${cn}";
sleep 3
chmod 777 /dev/tty*
usermod -a -G dialout usuario
echo "${ca}Hecho!${cn}";
sleep 1
opcion71b="1";
;;

##Opcion visualino
72)

if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Instalando. ATENCION Visualino (oficial) ha desaparecido...${cn}";
	sleep 1
	##wget http://www.visualino.net/downloads/ubuntu/visualino_0.7_amd64.deb
	echo "${ca}Descargando de ...${cn}";
	echo "${ca}https://migasfree.educa.aragon.es/public/VX-18.04/REPOSITORIES/dists/repo-base-robotica/PKGS/${cn}";
	sleep 1
 	wget https://migasfree.educa.aragon.es/public/VX-18.04/REPOSITORIES/dists/repo-base-robotica/PKGS/visualino_0.7_amd64.deb
        dpkg -iG visualino_0.7_amd64.deb
	rm visualino_0.7_amd64.deb
	echo "${ca}Instalando crumble...${cn}";
	sleep 1
	wget http://complubot.com/docu/Crumble/Software/crumble_1.5.8_all.deb
        dpkg -iG crumble_1.5.8_all.deb
	rm crumble_1.5.8_all.deb
 	apt --fix-broken -y install
else
	echo "${ca}Instalando...${cn}";
	sleep 1
	wget https://migasfree.educa.aragon.es/public/VX-18.04/REPOSITORIES/dists/repo-base-robotica/PKGS/visualino_0.7_i386.deb
	dpkg -iG visualino_0.7_i386.deb
	rm visualino_0.7_i386.deb
fi
echo "${ca}Hecho!${cn}";
sleep 1
opcion72="1";
;;

##Opcion processing
73)

if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Instalando...${cn}";
	sleep 1
       	wget https://github.com/processing/processing4/releases/download/processing-1293-4.3/processing-4.3-linux-x64.tgz
	tar -xf processing-4.3-linux-x64.tgz -C /home/usuario/
 	chmod 777 -R /home/usuario/processing-4.3
	sh /home/usuario/processing-4.3/install.sh
	rm processing-4.3-linux-x64.tgz
	echo "${ca}Instalando Python 3.7...${cn} ";
	apt-get -y install python3.7
else
	echo "${ca}Instalando...${cn}";
	sleep 1
 	echo "NO DISPONIBLE processing...";
	sleep 2
	echo "${ca}Instalando Python 3.5...${cn} ";
	apt-get -y install python3.5
	sleep 3
fi
echo "${ca}Hecho!${cn}";
sleep 1
opcion73="1";
;;

##Opcion mBlock
74)
if [ "$VTIPO" = "x86_64" ]
then

	clear
	echo "${ca}Instalando mBlock_4.0.4 (64Bits) ${cn}";
	sleep 1
	apt-get -y install libgconf-2-4
	if [ ! -f $REPUSB/mblock/mBlock_4.0.4_amd64.deb ]; then
		clear	    	
		echo "${cv}      ATENCION: No se encuentra el USB TICGALICIA! (almacen repositorio) ${cn}";
		sleep 1
		echo "${cv}      Descargando! ${cn}";
		wget http://dl.makeblock.com/mBlock4.0/mBlock_4.0.4_amd64.deb
		mv mBlock_4.0.4_amd64.deb /home/usuario/Descargas
	else
		clear
	    	echo "${cv}      ATENCION: detectado USB TICGALICIA! (almacen repositorio) ${cn}";
		sleep 1
		echo "${cv}      Instalando! ${cn}";
		cp $REPUSB/mblock/mBlock_4.0.4_amd64.deb /home/usuario/Descargas
	fi
	chmod 777 /home/usuario/Descargas/mBlock_4.0.4_amd64.deb
	apt install /home/usuario/Descargas/mBlock_4.0.4_amd64.deb
else
	clear
	echo "${ca}Instalando mBlock wine ${cn} ";
	sleep 1
	##wget http://dl.makeblock.com/mBlock_win_V3.4.12.exe
	wget http://dl.makeblock.com/mblock3/mBlock_win_V3.4.12.exe
	mv mBlock_win_V3.4.12.exe /home/usuario/Descargas
	chmod 777 /home/usuario/Descargas/mBlock_win_V3.4.12.exe
	sudo -u usuario wine /home/usuario/Descargas/mBlock_win_V3.4.12.exe
	# wine /home/usuario/Descargas/mBlock_win_V3.4.12.exe
	# Version linux
	# wget https://github.com/Makeblock-official/mBlock/releases/download/V4.0.0-Linux/mBlock-4.0.0-linux-4.0.0.tar.gz
	# tar -xf mBlock-4.0.0-linux-4.0.0.tar.gz
	# mv mBlock/ /home/usuario/mBlock/
	# chmod 777 -R /home/usuario/mBlock
	# rm -R mBlock-4.0.0-linux-4.0.0.tar.gz
	# echo "[Desktop Entry]" > /home/usuario/Escritorio/mblock.desktop;
	# echo "Version=4" >> /home/usuario/Escritorio/mblock.desktop;
	# echo "Type=Application" >> /home/usuario/Escritorio/mblock.desktop;
	# echo "Name=mblock 4.0" >> /home/usuario/Escritorio/mblock.desktop;
	# echo "Comment=mblock 4.0" >> /home/usuario/Escritorio/mblock.desktop;
	# echo "Exec=/opt/makeblock/mBlock/mblock" >> /home/usuario/Escritorio/mblock.desktop;
	# echo "Icon=/usr/share/icons/mBlock/128x128.png" >> /home/usuario/Escritorio/mblock.desktop;
	# echo "Path=/home/usuario/mBlock" >> /home/usuario/Escritorio/mblock.desktop;
	# echo "Terminal=false" >> /home/usuario/Escritorio/mblock.desktop;
	# echo "StartupNotify=false" >> /home/usuario/Escritorio/mblock.desktop;
	# echo "${ca}Hecho!${cn}";
	# chmod 777 /home/usuario/Escritorio/mblock.desktop
fi
echo "${ca}Hecho!${cn}";
sleep 1
opcion74="1";
;;

##Opcion 74b
74b)
if [ "$VTIPO" = "x86_64" ]
then
	wget https://dl.makeblock.com/mblock5/linux/mLink-1.2.0-amd64.deb
	dpkg -i mLink-1.2.0-amd64.deb
	rm mLink-1.2.0-amd64.deb
	echo "[Desktop Entry]" > /home/usuario/Escritorio/MLINK.desktop;
	echo "Version=1" >> /home/usuario/Escritorio/MLINK.desktop;
	echo "Type=Application" >> /home/usuario/Escritorio/MLINK.desktop;
	echo "Name=MLINK" >> /home/usuario/Escritorio/MLINK.desktop;
	echo "Comment=Mlink" >> /home/usuario/Escritorio/MLINK.desktop;
	echo "Exec=mblock-mlink start" >> /home/usuario/Escritorio/MLINK.desktop;
	echo "Icon=preferences-system-sharing" >> /home/usuario/Escritorio/MLINK.desktop;
	echo "Path=" >> /home/usuario/Escritorio/MLINK.desktop;
	echo "Terminal=true" >> /home/usuario/Escritorio/MLINK.desktop;
	echo "StartupNotify=false" >> /home/usuario/Escritorio/MLINK.desktop;
 	chmod 777 /home/usuario/Escritorio/MLINK.desktop
	echo "${ca}Hecho!${cn}";
fi
sleep 1
opcion74b="1";
;;

##Opcion pseint
75)
if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Descargando ${cn}";
	sleep 1
	wget https://sourceforge.net/projects/pseint/files/20210609/pseint-l64-20210609.tgz
	tar -xzvf pseint-l64-20210609.tgz
	mkdir /home/usuario/wine/
        mv pseint /home/usuario/wine/
	chmod 777 /home/usuario/wine/ -R
	echo "[Desktop Entry]" > /usr/share/applications/pseint.desktop
	echo "Name=Pseint">> /usr/share/applications/pseint.desktop
	echo "Comment=">> /usr/share/applications/pseint.desktop
	echo "Exec=/home/usuario/wine/pseint/bin/../wxPSeInt">> /usr/share/applications/pseint.desktop
	echo "Icon=/home/usuario/wine/pseint/imgs/icon48.png">> /usr/share/applications/pseint.desktop
	echo "Terminal=false">> /usr/share/applications/pseint.desktop
	echo "Type=Application">> /usr/share/applications/pseint.desktop
	echo "Categories=Development;IDE;">> /usr/share/applications/pseint.desktop



	echo "[Desktop Entry]" > /usr/share/desktop-directories/xfce-programacion.directory
	echo "Name=Programacion" >> /usr/share/desktop-directories/xfce-programacion.directory
	echo "Name[es]=Programacion" >> /usr/share/desktop-directories/xfce-programacion.directory
	echo "Version=1.0" >> /usr/share/desktop-directories/xfce-programacion.directory
	echo "Type=Directory" >> /usr/share/desktop-directories/xfce-programacion.directory
	echo "Icon=filled-xterm" >> /usr/share/desktop-directories/xfce-programacion.directory
	echo "Encoding=UTF-8">> /usr/share/applications/pseint.desktop 


	echo "<!DOCTYPE Menu PUBLIC \"-//freedesktop//DTD Menu 1.0//EN\""> /etc/xdg/menus/applications-merged/programacion.menu
	echo "\"http://www.freedesktop.org/standards/menu-spec/1.0/menu.dtd\">">> /etc/xdg/menus/applications-merged/programacion.menu
	echo "<Menu>" >> /etc/xdg/menus/applications-merged/programacion.menu
	echo "  <Name>Applications</Name>" >> /etc/xdg/menus/applications-merged/programacion.menu
	echo "  <Menu>" >> /etc/xdg/menus/applications-merged/programacion.menu
	echo "    <Name>Programacion</Name>" >> /etc/xdg/menus/applications-merged/programacion.menu
 	echo "   <Directory>Programacion.directory</Directory>" >> /etc/xdg/menus/applications-merged/programacion.menu
 	echo "   <Include>" >> /etc/xdg/menus/applications-merged/programacion.menu
	echo "        <Category>Programacion</Category>" >> /etc/xdg/menus/applications-merged/programacion.menu
	echo "    </Include>" >> /etc/xdg/menus/applications-merged/programacion.menu
	echo "  </Menu>" >> /etc/xdg/menus/applications-merged/programacion.menu
	echo "</Menu>" >> /etc/xdg/menus/applications-merged/programacion.menu

	rm pseint-l64-20210609.tgz

else
	clear
	echo "${ca}Instalando...${cn}";
	sleep 1
	wget https://sourceforge.net/projects/pseint/files/20210609/pseint-l32-20210609.tgz
	tar -xzvf pseint-l32-20210609.tgz
        mv pseint /home/usuario/wine/pseint
	chmod 777 /home/usuario/wine/pseint
	echo "[Desktop Entry]" > /usr/share/applications/pseint.desktop
	echo "Name=Pseint">> /usr/share/applications/pseint.desktop
	echo "Comment=">> /usr/share/applications/pseint.desktop
	echo "Exec=/home/usuario/wine/pseint/bin/../wxPSeInt">> /usr/share/applications/pseint.desktop
	echo "Icon=/home/usuario/wine/pseint/imgs/icon48.png">> /usr/share/applications/pseint.desktop
	echo "Terminal=false">> /usr/share/applications/pseint.desktop
	echo "Type=Application">> /usr/share/applications/pseint.desktop
	echo "Categories=Development;IDE;">> /usr/share/applications/pseint.desktop


fi
echo "${ca}Hecho!${cn}";
sleep 1
opcion75="1";
;;


##Opcion 76
76)
if [ "$VTIPO" = "x86_64" ]
then
	wget http://downloads.codelite.org/codelite/14.0.1/CodeLite-14.0.1-gtk3-ubuntu-bionic-x86_64.deb
	dpkg -i CodeLite-14.0.1-gtk3-ubuntu-bionic-x86_64.deb
	rm CodeLite-14.0.1-gtk3-ubuntu-bionic-x86_64.deb
else
	apt-get -qq update
	apt-get install Codelite
fi
echo "${ca}Hecho!${cn}";
sleep 1
opcion76="1";
;;

-76)
echo "${ca}Quitando...${cn}";
sleep 1
sudo apt-get remove Codelite
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion76="0";
;;

##Opcion 77
77)
if [ "$VTIPO" = "x86_64" ]
then
	echo "${ca}Instalando...${cn}";
	sleep 1
	wget http://bluegriffon.org/freshmeat/3.1/bluegriffon-3.1.Ubuntu18.04-x86_64.deb
	dpkg -i bluegriffon-3.1.Ubuntu18.04-x86_64.deb
	rm bluegriffon-3.1.Ubuntu18.04-x86_64.deb
else
	echo "${ca}Instalando...${cn}";
	sleep 1
	wget http://bluegriffon.org/freshmeat/1.6.2/bluegriffon-1.6.2-Ubuntu12.04-i686.tar.bz2
	tar -xzvf bluegriffon-1.6.2-Ubuntu12.04-i686.tar.bz2 --directory /home/usuario/bluegriffon/
	rm -r bluegriffon-1.6.2-Ubuntu12.04-i686.tar.bz2
fi
sleep 2
echo "${ca}Hecho!${cn}";
sleep 1
opcion77="1";
;;

##Opcion 78
78)
echo "${ca}Instalando...${cn}";
sleep 1
apt-get -qq update
apt-get install glade
echo "${ca}Hecho!${cn}";
sleep 1
opcion78="1";
;;
-78)
echo "${ca}Quitando...${cn}";
sleep 1
sudo apt-get remove glade
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion78="0";
;;

##Opcion 79
79)
if [ "$VTIPO" = "x86_64" ]
then
	clear
	apt-get -y remove scratch
 	wget https://github.com/redshaderobotics/scratch3.0-linux/releases/download/3.3.0/scratch-desktop_3.3.0_amd64.deb
  	dpkg -i scratch-desktop_3.3.0_amd64.deb
   	rm scratch-desktop_3.3.0_amd64.deb
	sleep 5
else

	echo "${ca}Instalando${cn} ";
	sleep 1
	##Eliminamos version antigua.
	apt-get -y remove scratch
	rm -R /home/usuario/Scratch
	mkdir /home/usuario/Scratch
	wget http://airdownload.adobe.com/air/lin/download/2.6/AdobeAIRInstaller.bin
	mv AdobeAIRInstaller.bin /home/usuario/Scratch/
	wget https://scratch.mit.edu/scratchr2/static/sa/Scratch-451.air
	mv Scratch-451.air /home/usuario/Scratch/
	chmod 777 /home/usuario/Scratch/
	chmod +x /home/usuario/Scratch/AdobeAIRInstaller.bin
	LD_LIBRARY_PATH=/usr/lib/i386-linux-gnu /home/usuario/Scratch/AdobeAIRInstaller.bin
	sh /home/usuario/Scratch/AdobeAIRInstaller.bin
	echo "Instalado. Termina la instalacion desde Accesorios - Adobe AIR Apliccation Installer";
	echo "Ruta: /home/usuario/Scratch/Scratch-451.air";
fi
echo "${ca}Hecho!${cn}";
sleep 1
opcion79="1";
;;

7a)
echo "${ca}Instalando...${cn}";
sleep 1

if [ "$VTIPO" = "x86_64" ]
then
echo "${ca}Instalando dodo...${cn}";
sleep 1
pip install libreria-dodo
echo "${ca}Instalando thony...${cn}";
sleep 1
wget https://github.com/thonny/thonny/releases/download/v4.1.2/thonny-4.1.2-x86_64.tar.gz
tar -zxf thonny-4.1.2-x86_64.tar.gz
rm thonny-4.1.2-x86_64.tar.gz
mv thonny /home/usuario/Descargas/
chmod 777 /home/usuario/Descargas/* -R
su usuario -c 'python3 /home/usuario/Descargas/thonny/install.py'
rm /home/usuario/Descargas/thonn* -R
##apt-get install -y thonny
else
apt-get -qq update
wget http://ftp.es.debian.org/debian/pool/main/n/ninja-ide/ninja-ide_2.3-2_all.deb
dpkg -i ninja-ide_2.3-2_all.deb
apt --fix-broken install
rm ninja-ide_2.3-2_all.deb
fi
echo "${ca}Hecho!${cn}";
sleep 1
opcion7a="1";
;;

-7a)
echo "${ca}Quitando...${cn}";
sleep 1
apt-get -y remove ninja-ide
apt-get -y remove thonny
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion7a="0";
;;


##Opcion opensankore
opensankore)
if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Procesando... ${cn}";
	sleep 1
	deb http://security.debian.org/debian-security jessie/updates main
	apt install multiarch-support
	apt install libssl1.0.0
	dpkg -i libssl1.0.0_1.0.1t-1+deb8u12_amd64.deb
	apt install libphonon4
	dpkg -i Open-Sankore_2.5.1_amd64.deb
else
	clear
	echo "${ca}Ya esta incluido en la distribucion bebian... ${cn}";
	sleep 1
	echo "${ca}Creando Backup...${cn}";
fi
clear
echo "${ca}Hecho!${cn}";
sleep 1
;;

##Opcion cura
81)
if [ "$VTIPO" = "x86_64" ]
then

	clear
	echo "${ca}Descargando Ultimaker_Cura-4.5.0.AppImage ${cn}";
	sleep 1
	wget https://software.ultimaker.com/cura/Ultimaker_Cura-4.5.0.AppImage
	chmod 777 Ultimaker_Cura-4.5.0.AppImage
	mkdir /home/usuario/programas
	chmod 777 /home/usuario/programas -R
	mv Ultimaker_Cura-4.5.0.AppImage /home/usuario/programas/Cura.AppImage

	echo "[Desktop Entry]" > /home/usuario/Escritorio/cura.desktop;
	echo "Version=3" >> /home/usuario/Escritorio/cura.desktop;
	echo "Type=Application" >> /home/usuario/Escritorio/cura.desktop;
	echo "Name=cura" >> /home/usuario/Escritorio/cura.desktop;
	echo "Comment=cura" >> /home/usuario/Escritorio/cura.desktop;
	echo "Exec=/home/usuario/programas/Cura.AppImage" >> /home/usuario/Escritorio/cura.desktop;
	echo "Icon=/usr/share/icons/Adwaita/48x48/mimetypes/application-x-appliance-symbolic.symbolic.png" >> /home/usuario/Escritorio/cura.desktop;
	echo "Path=/home/usuario" >> /home/usuario/Escritorio/cura.desktop;
	echo "Terminal=false" >> /home/usuario/Escritorio/cura.desktop;
	echo "StartupNotify=false" >> /home/usuario/Escritorio/cura.desktop;
	chmod 777 /home/usuario/Escritorio/cura.desktop

	echo "[Desktop Entry]" > /usr/share/applications/cura.desktop
	echo "Name=cura">> /usr/share/applications/cura.desktop
	echo "Comment=">> /usr/share/applications/cura.desktop
	echo "Exec=/home/usuario/programas/Cura.AppImage">> /usr/share/applications/cura.desktop
	echo "Icon=/usr/share/icons/Adwaita/48x48/mimetypes/application-x-appliance-symbolic.symbolic.png">> /usr/share/applications/cura.desktop
	echo "Terminal=false">> /usr/share/applications/cura.desktop
	echo "Type=Application">> /usr/share/applications/cura.desktop
	echo "Categories=Development;IDE;Impresion3D;">> /usr/share/applications/cura.desktop

	echo "[Desktop Entry]" > /usr/share/desktop-directories/xfce-impresion3d.directory
	echo "Name=Impresion3d" >> /usr/share/desktop-directories/xfce-impresion3d.directory
	echo "Name[es]=Impresion3d" >> /usr/share/desktop-directories/xfce-impresion3d.directory
	echo "Version=1.0" >> /usr/share/desktop-directories/xfce-impresion3d.directory
	echo "Type=Directory" >> /usr/share/desktop-directories/xfce-impresion3d.directory
	echo "Icon=filled-xterm" >> /usr/share/desktop-directories/xfce-impresion3d.directory
	echo "Encoding=UTF-8">> /usr/share/applications/pseint.desktop 

	echo "<!DOCTYPE Menu PUBLIC \"-//freedesktop//DTD Menu 1.0//EN\""> /etc/xdg/menus/applications-merged/impresion3d.menu
	echo "\"http://www.freedesktop.org/standards/menu-spec/1.0/menu.dtd\">">> /etc/xdg/menus/applications-merged/impresion3d.menu
	echo "<Menu>" >> /etc/xdg/menus/applications-merged/impresion3d.menu
	echo "  <Name>Applications</Name>" >> /etc/xdg/menus/applications-merged/impresion3d.menu
	echo "  <Menu>" >> /etc/xdg/menus/applications-merged/impresion3d.menu
	echo "    <Name>Impresion3d</Name>" >> /etc/xdg/menus/applications-merged/impresion3d.menu
 	echo "   <Directory>Impresion3d.directory</Directory>" >> /etc/xdg/menus/applications-merged/impresion3d.menu
 	echo "   <Include>" >> /etc/xdg/menus/applications-merged/impresion3d.menu
	echo "        <Category>Impresion3d</Category>" >> /etc/xdg/menus/applications-merged/impresion3d.menu
	echo "    </Include>" >> /etc/xdg/menus/applications-merged/impresion3d.menu
	echo "  </Menu>" >> /etc/xdg/menus/applications-merged/impresion3d.menu
	echo "</Menu>" >> /etc/xdg/menus/applications-merged/impresion3d.menu

else
	clear
	echo "${ca}Instalando Ultimaker_Cura-15.04 ${cn} ";
	sleep 1
	wget https://download.ultimaker.com/cura/Ultimaker_Cura-15.04.06-Linux_i386.deb
	dpkg -iG Ultimaker_Cura-15.04.06-Linux_i386.deb
	rm Ultimaker_Cura-15.04.06-Linux_i386.deb
fi
echo "${ca}Hecho!${cn}";
sleep 1
opcion81="1";
;;

##Opcion slicer
82)
if [ "$VTIPO" = "x86_64" ]
then

	clear
	echo "${ca}Descargando Slic3r-1.3.0 ${cn}";
	sleep 1
	wget --no-check-certificate http://dl.slic3r.org/linux/Slic3r-1.3.0-x86_64.AppImage
	chmod 777 Slic3r-1.3.0-x86_64.AppImage
        mkdir /home/usuario/programas
	mv Slic3r-1.3.0-x86_64.AppImage /home/usuario/programas/Slic3r.AppImage
	chmod 777 /home/usuario/programas -R
	echo "[Desktop Entry]" > /home/usuario/Escritorio/slic3r.desktop;
	echo "Version=3" >> /home/usuario/Escritorio/slic3r.desktop;
	echo "Type=Application" >> /home/usuario/Escritorio/slic3r.desktop;
	echo "Name=slic3r" >> /home/usuario/Escritorio/slic3r.desktop;
	echo "Comment=slic3r" >> /home/usuario/Escritorio/slic3r.desktop;
	echo "Exec=/home/usuario/programas/Slic3r.AppImage" >> /home/usuario/Escritorio/slic3r.desktop;
	echo "Icon=/usr/share/icons/Adwaita/48x48/mimetypes/application-x-appliance-symbolic.symbolic.png" >> /home/usuario/Escritorio/slic3r.desktop;
	echo "Path=/home/usuario" >> /home/usuario/Escritorio/slic3r.desktop;
	echo "Terminal=false" >> /home/usuario/Escritorio/slic3r.desktop;
	echo "StartupNotify=false" >> /home/usuario/Escritorio/slic3r.desktop;
	chmod 777 /home/usuario/Escritorio/slic3r.desktop

	echo "[Desktop Entry]" > /usr/share/applications/slic3r.desktop
	echo "Name=slic3r">> /usr/share/applications/slic3r.desktop
	echo "Comment=">> /usr/share/applications/slic3r.desktop
	echo "Exec=/home/usuario/programas/slic3r.AppImage">> /usr/share/applications/slic3r.desktop
	echo "Icon=/usr/share/icons/Adwaita/48x48/mimetypes/application-x-appliance-symbolic.symbolic.png">> /usr/share/applications/slic3r.desktop
	echo "Terminal=false">> /usr/share/applications/slic3r.desktop
	echo "Type=Application">> /usr/share/applications/slic3r.desktop
	echo "Categories=Development;IDE;Impresion3D;">> /usr/share/applications/slic3r.desktop

	echo "[Desktop Entry]" > /usr/share/desktop-directories/xfce-impresion3d.directory
	echo "Name=Impresion3d" >> /usr/share/desktop-directories/xfce-impresion3d.directory
	echo "Name[es]=Impresion3d" >> /usr/share/desktop-directories/xfce-impresion3d.directory
	echo "Version=1.0" >> /usr/share/desktop-directories/xfce-impresion3d.directory
	echo "Type=Directory" >> /usr/share/desktop-directories/xfce-impresion3d.directory
	echo "Icon=filled-xterm" >> /usr/share/desktop-directories/xfce-impresion3d.directory
	echo "Encoding=UTF-8">> /usr/share/applications/pseint.desktop 

	echo "<!DOCTYPE Menu PUBLIC \"-//freedesktop//DTD Menu 1.0//EN\""> /etc/xdg/menus/applications-merged/impresion3d.menu
	echo "\"http://www.freedesktop.org/standards/menu-spec/1.0/menu.dtd\">">> /etc/xdg/menus/applications-merged/impresion3d.menu
	echo "<Menu>" >> /etc/xdg/menus/applications-merged/impresion3d.menu
	echo "  <Name>Applications</Name>" >> /etc/xdg/menus/applications-merged/impresion3d.menu
	echo "  <Menu>" >> /etc/xdg/menus/applications-merged/impresion3d.menu
	echo "    <Name>Impresion3d</Name>" >> /etc/xdg/menus/applications-merged/impresion3d.menu
 	echo "   <Directory>Impresion3d.directory</Directory>" >> /etc/xdg/menus/applications-merged/impresion3d.menu
 	echo "   <Include>" >> /etc/xdg/menus/applications-merged/impresion3d.menu
	echo "        <Category>Impresion3d</Category>" >> /etc/xdg/menus/applications-merged/impresion3d.menu
	echo "    </Include>" >> /etc/xdg/menus/applications-merged/impresion3d.menu
	echo "  </Menu>" >> /etc/xdg/menus/applications-merged/impresion3d.menu
	echo "</Menu>" >> /etc/xdg/menus/applications-merged/impresion3d.menu

else
	clear
	echo "${ca}Descargando Slic3r-1.3.0 ${cn}";
	sleep 1
	wget --no-check-certificate http://dl.slic3r.org/linux/Slic3r-1.3.0-x86_64.AppImage
	chmod 777 Slic3r-1.3.0-x86_64.AppImage
	mv Slic3r-1.3.0-x86_64.AppImage /home/usuario/programas/Slic3r.AppImage
	chmod 777 /home/usuario/programas -R
	echo "[Desktop Entry]" > /home/usuario/Escritorio/slic3r.desktop;
	echo "Version=3" >> /home/usuario/Escritorio/slic3r.desktop;
	echo "Type=Application" >> /home/usuario/Escritorio/slic3r.desktop;
	echo "Name=slic3r" >> /home/usuario/Escritorio/slic3r.desktop;
	echo "Comment=slic3r" >> /home/usuario/Escritorio/slic3r.desktop;
	echo "Exec=/home/usuario/programas/Slic3r.AppImage" >> /home/usuario/Escritorio/slic3r.desktop;
	echo "Icon=/usr/share/icons/Adwaita/48x48/mimetypes/application-x-appliance-symbolic.symbolic.png" >> /home/usuario/Escritorio/slic3r.desktop;
	echo "Path=/home/usuario" >> /home/usuario/Escritorio/slic3r.desktop;
	echo "Terminal=false" >> /home/usuario/Escritorio/slic3r.desktop;
	echo "StartupNotify=false" >> /home/usuario/Escritorio/slic3r.desktop;
	chmod 777 /home/usuario/Escritorio/slic3r.desktop

	sleep 1
fi
echo "${ca}Hecho!${cn}";
sleep 1
opcion82="1";
;;


##Opcion repetier
repetierold)
echo "${ca}Instalando...${cn}";
sleep 1
wget http://download.repetier.com/files/host/linux/repetierHostLinux_2_1_6.tgz
tar -xzf repetierHostLinux_2_1_6.tgz --directory /home/usuario
rm repetierHostLinux_2_1_6.tgz
chmod 777 /home/usuario/RepetierHost
cd /home/usuario/RepetierHost/
sh configureFirst.sh
cd /root
echo "${ca}Hecho!${cn}";
sleep 1
opcion88="1";
;;


##Opcion repetier
83)
if [ "$VTIPO" = "x86_64" ]
then

	clear
	echo "${ca}Descargando Repetier-Host-x86_64 ${cn}";
	sleep 1
	wget http://download.repetier.com/files/host/linux/Repetier-Host-x86_64-2.1.6.AppImage
	chmod 777 Repetier-Host-x86_64-2.1.6.AppImage
	mv Repetier-Host-x86_64-2.1.6.AppImage /home/usuario/programas/Repetier.AppImage
	echo "[Desktop Entry]" > /home/usuario/Escritorio/Repetier.desktop;
	echo "Version=3" >> /home/usuario/Escritorio/Repetier.desktop;
	echo "Type=Application" >> /home/usuario/Escritorio/Repetier.desktop;
	echo "Name=Repetier" >> /home/usuario/Escritorio/Repetier.desktop;
	echo "Comment=Repetier" >> /home/usuario/Escritorio/Repetier.desktop;
	echo "Exec=/home/usuario/programas/Repetier.AppImage" >> /home/usuario/Escritorio/Repetier.desktop;
	echo "Icon=/usr/share/icons/Adwaita/48x48/mimetypes/application-x-appliance-symbolic.symbolic.png" >> /home/usuario/Escritorio/Repetier.desktop;
	echo "Path=/home/usuario" >> /home/usuario/Escritorio/Repetier.desktop;
	echo "Terminal=false" >> /home/usuario/Escritorio/Repetier.desktop;
	echo "StartupNotify=false" >> /home/usuario/Escritorio/Repetier.desktop;
	chmod 777 /home/usuario/Escritorio/Repetier.desktop
else
	clear
	echo "${ca}Descargando Repetier-Host-x86_64 ${cn}";
	sleep 1
	wget http://download.repetier.com/files/host/linux/Repetier-Host-x86_64-2.1.6.AppImage
	chmod 777 Repetier-Host-x86_64-2.1.6.AppImage
	mv Repetier-Host-x86_64-2.1.6.AppImage /home/usuario/programas/Repetier.AppImage
	echo "[Desktop Entry]" > /home/usuario/Escritorio/Repetier.desktop;
	echo "Version=3" >> /home/usuario/Escritorio/Repetier.desktop;
	echo "Type=Application" >> /home/usuario/Escritorio/Repetier.desktop;
	echo "Name=Repetier" >> /home/usuario/Escritorio/Repetier.desktop;
	echo "Comment=Repetier" >> /home/usuario/Escritorio/Repetier.desktop;
	echo "Exec=/home/usuario/programas/Repetier.AppImage" >> /home/usuario/Escritorio/Repetier.desktop;
	echo "Icon=/usr/share/icons/Adwaita/48x48/mimetypes/application-x-appliance-symbolic.symbolic.png" >> /home/usuario/Escritorio/Repetier.desktop;
	echo "Path=/home/usuario" >> /home/usuario/Escritorio/Repetier.desktop;
	echo "Terminal=false" >> /home/usuario/Escritorio/Repetier.desktop;
	echo "StartupNotify=false" >> /home/usuario/Escritorio/Repetier.desktop;
	chmod 777 /home/usuario/Escritorio/Repetier.desktop
	sleep 1
fi
echo "${ca}Hecho!${cn}";
sleep 1
opcion83="1";
;;

##Opcion 91
91)
echo "Desinstalando version anterior...";
sleep 1
apt-get -y remove fritzing
apt-get -y purge fritzing
apt-get -qq update
clear
echo "${ca}Descargando...${cn}";
sleep 1
wget http://fritzing.org/download/0.9.3b/linux-32bit/fritzing-0.9.3b.linux.i386.tar.bz2
tar -xvf fritzing-*.tar.bz2
rm fritzing-*.tar.bz2
chmod 777 -R /usr/share/fritzing
rm -R /usr/share/fritzing
mv fritzing*/ /usr/share/fritzing
chmod 777 -R /usr/share/fritzing
rm /usr/share/applications/fritzing.desktop
echo "[Desktop Entry]" > /usr/share/applications/fritzing.desktop
echo "Version=0.9.3b" >> /usr/share/applications/fritzing.desktop
echo "Name=Fritzing" >> /usr/share/applications/fritzing.desktop
echo "GenericName=Fritzing" >> /usr/share/applications/fritzing.desktop
echo "Comment=Electronic Design Automation software" >> /usr/share/applications/fritzing.desktop
echo "Exec=/usr/share/fritzing/Fritzing" >> /usr/share/applications/fritzing.desktop
echo "Icon=/usr/share/fritzing/icons/fritzing_icon.png" >> /usr/share/applications/fritzing.desktop
echo "Terminal=false" >> /usr/share/applications/fritzing.desktop
echo "Type=Application" >> /usr/share/applications/fritzing.desktop
echo "Categories=Development;Engineering;Electronics;" >> /usr/share/applications/fritzing.desktop
echo "X-SuSE-translate=false" >> /usr/share/applications/fritzing.desktop
echo "StartupNotify=true" >> /usr/share/applications/fritzing.desktop
echo "MimeType=application/x-fritzing-fz;application/x-fritzing-fzz;application/x-fritzing-fzp;application/x-fritzing-fzpz;application/x-fritzing-fzb;application/x-fritzing-fzbz;application/x-fritzing-fzm;" >> /usr/share/applications/fritzing.desktop
chmod 777 /usr/share/applications/fritzing.desktop
sleep 1
opcion91="1";
;;


##Opcion 92
92)
echo "${ca}Instalando...${cn}";
sleep 1
wget https://sourceforge.net/projects/circuit/files/latest/download
	mkdir /home/usuario/wine/
	chmod 777 /home/usuario/wine/ -R
	mkdir /home/usuario/wine/logisim/
	mv download /home/usuario/wine/logisim/logisim.jar
	echo "[Desktop Entry]" > /usr/share/applications/logisim.desktop
	echo "Name=logisim">> /usr/share/applications/logisim.desktop
	echo "Comment=">> /usr/share/applications/logisim.desktop
	echo "Exec=java -jar /home/usuario/wine/logisim/logisim.jar">> /usr/share/applications/logisim.desktop
	echo "Icon=/usr/share/icons/Adwaita/256x256/mimetypes/application-x-firmware.png">> /usr/share/applications/logisim.desktop
	echo "Terminal=false">> /usr/share/applications/logisim.desktop
	echo "Type=Application">> /usr/share/applications/logisim.desktop
	echo "Categories=Development;IDE;Other;">> /usr/share/applications/logisim.desktop

echo "${ca}Hecho!${cn}";
sleep 1
opcion92="1";
;;

##Opcion 93
93)
echo "${ca}Instalando...${cn}";
sleep 1
	wget https://mailfence.com/pub/docs/santigoro/web/SimulIDE_0.4.13/SimulIDE_0.4.13-SR5_Lin64.tar.gz
	mkdir /home/usuario/wine/
	chmod 777 /home/usuario/wine/ -R
	tar -xzvf SimulIDE_0.4.13-SR5_Lin64.tar.gz --directory /home/usuario/wine/
	rm SimulIDE_0.4.13-SR5_Lin64.tar.gz
	echo "[Desktop Entry]" > /usr/share/applications/SimulIDE.desktop
	echo "Name=SimulIDE">> /usr/share/applications/SimulIDE.desktop
	echo "Comment=">> /usr/share/applications/SimulIDE.desktop
	echo "Exec=/home/usuario/wine/SimulIDE_0.4.13-SR5_Lin64/bin/simulide">> /usr/share/applications/SimulIDE.desktop
	echo "Icon=/home/usuario/wine/SimulIDE_0.4.13-SR5_Lin64/share/icons/hicolor/256x256/simulide.png">> /usr/share/applications/SimulIDE.desktop
	echo "Terminal=false">> /usr/share/applications/SimulIDE.desktop
	echo "Type=Application">> /usr/share/applications/SimulIDE.desktop
	echo "Categories=Development;IDE;Electronics;">> /usr/share/applications/SimulIDE.desktop

echo "${ca}Hecho!${cn}";
sleep 1
opcion93="1";
;;

##Opcion 94
94)
echo "${ca}Instalando...${cn}";
sleep 1
wget --no-check-certificate https://image.easyeda.com/files/easyeda-linux-x64-6.4.17.zip
unzip easyeda-linux-x64-6.4.17.zip -d /home/usuario/Descargas/easyeda/
rm easyeda-linux-x64-6.4.17.zip
chmod 777 /home/usuario/Descargas/easyeda/
cd /home/usuario/Descargas/easyeda/
sh install.sh
cd /root
rm /home/usuario/Descargas/easyeda/ -R
echo "${ca}Hecho!${cn}";
sleep 1
opcion94="1";
;;

94.)
echo "${ca}Instalando...${cn}";
sleep 1
	wget wget https://sourceforge.net/projects/ktechlab/files/ktechlab/0.40.1/ktechlab-0.40.1.tar.xz
	mkdir /home/usuario/wine/
	chmod 777 /home/usuario/wine/ -R
	tar -xJvf ktechlab-0.40.1.tar.xz --directory /home/usuario/wine/

	rm ktechlab-0.40.1.tar.xz
	echo "[Desktop Entry]" > /usr/share/applications/ktechlab.desktop
	echo "Name=ktechlab">> /usr/share/applications/ktechlab.desktop
	echo "Comment=">> /usr/share/applications/ktechlab.desktop
	echo "Exec=/home/usuario/wine/ktechlab_0.4.13-SR5_Lin64/bin/ktechlab">> /usr/share/applications/ktechlab.desktop
	echo "Icon=/home/usuario/wine/ktechlab_0.4.13-SR5_Lin64/share/icons/hicolor/256x256/ktechlab.png">> /usr/share/applications/ktechlab.desktop
	echo "Terminal=false">> /usr/share/applications/ktechlab.desktop
	echo "Type=Application">> /usr/share/applications/ktechlab.desktop
	echo "Categories=Development;IDE;Electronics;">> /usr/share/applications/ktechlab.desktop

echo "${ca}Hecho!${cn}";
sleep 1
opcion94="1";
;;

##Opcion 95
95)
echo "${ca}Instalando...${cn}";
sleep 1
apt install kicad
echo "${ca}Hecho!${cn}";
sleep 1
opcion95="1";
;;

##Opcion 96
96)
apt-get install qelectrotech
echo "${ca}Hecho!${cn}";
sleep 1
opcion96="1";
;;

97)
clear
echo "Nuestro agradecimiento al credor Juan Luis Villanueva Montoto autorizar su incorportación a la maqueta."
echo "https://canalplc.blogspot.com"
sleep 3
clear
echo "Agradecimiento a José Ángel Araújo (CIFP FONTECARMOA) por la iniciativa de incluirlo."
sleep 2
echo "${ca}Instalando Wine...${cn}";
dpkg --add-architecture i386
apt-get -qq update
apt-get -y install wine32
echo "${ca}Descargando del repositorio...${cn}";
wget $REPOSITORIO/repository/CADe_SIMU.tar.gz
tar -xf CADe_SIMU.tar.gz -C /home/usuario/wine
apt --fix-broken -y install
echo "${ca}Creando accesos...${cn}";	
echo "[Desktop Entry]" > /home/usuario/Escritorio/CADe_SIMU.desktop
echo "Name=CADe_SIMU">> /home/usuario/Escritorio/CADe_SIMU.desktop
echo "Comment=">> /home/usuario/Escritorio/CADe_SIMU.desktop
echo "Exec=wine /home/usuario/wine/CADe_SIMU/CADe_SIMU.EXE">> /home/usuario/Escritorio/CADe_SIMU.desktop
echo "Icon=applications-electronics">> /home/usuario/Escritorio/CADe_SIMU.desktop
echo "Terminal=false">> /home/usuario/Escritorio/CADe_SIMU.desktop
echo "Type=Application">> /home/usuario/Escritorio/CADe_SIMU.desktop
chmod 777 /home/usuario/Escritorio/CADe_SIMU.desktop

echo "[Desktop Entry]" > /usr/share/applications/CADe_SIMU.desktop
echo "Name=CADe_SIMU">> /usr/share/applications/CADe_SIMU.desktop
echo "Comment=">> /usr/share/applications/CADe_SIMU.desktop
echo "Exec=wine /home/usuario/wine/CADe_SIMU/CADe_SIMU.EXE">> /usr/share/applications/CADe_SIMU.desktop
echo "Icon=applications-electronics">> /usr/share/applications/CADe_SIMU.desktop
echo "Terminal=false">> /usr/share/applications/CADe_SIMU.desktop
echo "Type=Application">> /usr/share/applications/CADe_SIMU.desktop

echo "${ca}Creando permisos...${cn}";
chmod 777 /home/usuario/wine/ -R
chmod 777 /home/usuario/Escritorio/CADe_SIMU.desktop;
rm CADe_SIMU.tar.gz
echo "${ca}Hecho!${cn}";
sleep 1
opcion97="1";
;;


##Opcion skype
101)
if [ "$VTIPO" = "x86_64" ]
then
wget https://go.skype.com/skypeforlinux-64.deb
dpkg -i skypeforlinux-64.deb
apt --fix-broken install
else
wget https://go.skype.com/skypeforlinux-32.deb
dpkg -i skypeforlinux-64.deb
apt --fix-broken install
fi
sleep 3
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion101="1";
;;


##Opcion skype
-101)
dpkg -r skypeforlinux
echo "${ca}Hecho!${cn}";
sleep 1
opcion101="0";
;;


##Opcion zoom
102)

## https://support.zoom.us/hc/es/articles/204206269-Instalaci%C3%B3n-o-actualizaci%C3%B3n-de-Zoom-en-Linux

if [ "$VTIPO" = "x86_64" ]
then
wget https://zoom.us/client/latest/zoom_amd64.deb
dpkg -i zoom_amd64.deb
apt --fix-broken install
else
wget https://zoom.us/client/latest/zoom_i386.deb
dpkg -i zoom_i386.deb
apt --fix-broken install
fi
sleep 3
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion102="1";
;;

##Opcion zoom
-102)
dpkg -r zoom
echo "${ca}Hecho!${cn}";
sleep 1
opcion102="0";
;;

##Opcion discord
103)
if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Instalando discord ${cn}";
	sleep 1
        wget https://dl.discordapp.net/apps/linux/"$discver64"/discord-"$discver64".deb
 	apt autoremove -y
  	apt --fix-broken -y install
	dpkg -i discord-"$discver64".deb	
	rm discord-"$discver64".deb	
else
	clear
	echo "${ca}No hay soporte ${cn}";
	sleep 4
fi
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion103="1";
;;

##Opcion skype
-103)
dpkg -r discord
echo "${ca}Hecho!${cn}";
sleep 1
opcion103="0";
;;

##Opcion teamspeak
104)
echo "${ca}Instalando...${cn}";
sleep 1
rm -R /opt/TeamSpeak3-Client-linux_x86
wget http://ftp.4players.de/pub/hosted/ts3/releases/3.2.3/TeamSpeak3-Client-linux_x86-3.2.3.run
chmod 777 TeamSpeak3-Client-linux_x86-3.2.3.run
sh TeamSpeak3-Client-linux_x86-3.2.3.run
mv TeamSpeak3-Client-linux_x86 /opt
rm TeamSpeak3-Client-linux_x86-3.2.3.run
chmod 777 /opt/TeamSpeak3-Client-linux_x86
echo "[Desktop Entry]" > /home/usuario/Escritorio/TeamSpeak3.desktop;
echo "Version=3" >> /home/usuario/Escritorio/TeamSpeak3.desktop;
echo "Type=Application" >> /home/usuario/Escritorio/TeamSpeak3.desktop;
echo "Name=TeamSpeak3" >> /home/usuario/Escritorio/TeamSpeak3.desktop;
echo "Comment=TeamSpeak3" >> /home/usuario/Escritorio/TeamSpeak3.desktop;
echo "Exec=/opt/TeamSpeak3-Client-linux_x86/ts3client_runscript.sh" >> /home/usuario/Escritorio/TeamSpeak3.desktop;
echo "Icon=/usr/share/icons/default.kde4/256x256/devices/audio-headphones.png" >> /home/usuario/Escritorio/TeamSpeak3.desktop;
echo "Path=" >> /home/usuario/Escritorio/TeamSpeak3.desktop;
echo "Terminal=false" >> /home/usuario/Escritorio/TeamSpeak3.desktop;
echo "StartupNotify=false" >> /home/usuario/Escritorio/TeamSpeak3.desktop;
echo "${ca}Hecho!${cn}";
chmod 777 /home/usuario/Escritorio/TeamSpeak3.desktop
chmod +x /home/usuario/Escritorio/TeamSpeak3.desktop
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion104="1";
;;


##Opcion tts
105)
echo "${ca}Instalando...${cn}";
sleep 1

if [ "$VTIPO" = "x86_64" ]
then
	echo "${ca}Detectado debian x64${cn}";
	apt --fix-broken install
	apt-get install espeak
else
	echo "${ca}Detectado debian x32${cn}";
	wget -q http://ftp.es.debian.org/debian/pool/main/e/espeak/espeak_1.48.04+dfsg-1_i386.deb
	dpkg -iG espeak_1.48.04+dfsg-1_i386.deb
	rm  espeak_1.48.04+dfsg-1_i386.deb
fi
echo "${ca}Hecho!${cn}";
sleep 2
espeak -a200 -ves "Texto a voz instalado";
espeak -a200 -ves "Son las "$(date '+%H_%m_%S');

#pulseaudio --kill
#jack_control start
#jack_control exit
#pulseaudio --start

clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion105="1";
;;


##Opcion  remmina
106)
echo "${ca}Instalando...${cn}";
sleep 1

if [ "$VTIPO" = "x86_64" ]
then
	echo "${ca}Detectado debian x64${cn}";
	apt --fix-broken install
	apt-get install -y remmina
else
	echo "${ca}Detectado debian x32${cn}";
	apt --fix-broken install
	apt-get install -y remmina
fi
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion106="1";
;;

##Opcion  remmina
-106)
echo "${ca}Borrando...${cn}";
	sleep 1
	echo "${ca}Detectado debian x64${cn}";
	apt-get remove -y remmina
	clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion106="0";
;;


##Opcion 107
107)
clear
echo "${ca}Instalando...${cn}";
sleep 1
wget https://download.anydesk.com/linux/anydesk_6.3.2-1_amd64.deb
apt --fix-broken -y install
dpkg -iG anydesk_6.3.2-1_amd64.deb
apt --fix-broken -y install
rm anydesk_6.3.2-1_amd64.deb
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion88="1";
;;

##Opcion 107
-107)
echo "${ca}Borrando...${cn}";
sleep 1
apt-get -y remove anydesk
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion107="0";
;;


##Opcion 108
108)
if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Instalando...${cn}";
	sleep 1
	apt-get -y install pidgin

else
	clear
	echo "${ca}Instalando...${cn}";
	sleep 1
	apt-get -y install pidgin
fi
clear
echo "Instalado";
sleep 1
opcion108="1";
;;

##Opcion 108
-108)
echo "${ca}Borrando...${cn}";
sleep 1
apt-get -y remove pidgin
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion108="0";
;;

##Opcion 109
109)
apt-get install -y amule
clear
echo "Instalado";
sleep 1
opcion109="1";
;;

##Opcion 109
-109)
apt-get remove amule
clear
echo "Borrado";
sleep 1
opcion109="1";
;;

##Opcion 110
110)
clear
echo "${ca}Instalando...${cn}";
sleep 1
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
apt --fix-broken -y install
dpkg -iG teamviewer_amd64.deb
apt --fix-broken -y install
rm teamviewer_amd64.deb
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion88="1";
;;

##Opcion 110
-110)
echo "${ca}Borrando...${cn}";
sleep 1
apt-get -y remove teamviewer
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion107="0";
;;

##Opcion team
teamviewer)
if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Instalando...${cn}";
	sleep 1
	wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
	apt --fix-broken -y install
	dpkg -iG teamviewer_amd64.deb
	apt --fix-broken -y install
	rm anydesk_teamviewer_amd64.deb
else
	clear
	echo "${ca}No disponible...${cn}";
	sleep 2
fi
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion88="1";
;;

######################################################

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
poresto="##INSERTADO## \nguest ok = yes";
sed -i "s/$esto/$poresto/g" /etc/samba/smb.conf;

##esto="##INSERTADO##";
##poresto="##INSERTADO## \nvalid users = +usuarios";
##sed -i "s/$esto/$poresto/g" /etc/samba/smb.conf;

esto="##INSERTADO##";
poresto="##INSERTADO## \npath = \/home\/$NOMBRECAR";
sed -i "s/$esto/$poresto/g" /etc/samba/smb.conf;

esto="##INSERTADO##";
poresto="##INSERTADO## \npublic = yes";
sed -i "s/$esto/$poresto/g" /etc/samba/smb.conf;

esto="##INSERTADO##";
poresto="##INSERTADO## \nprintable = no";
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
echo "${ca}Instalando...${cn}";
sleep 1
apt-get -y install gnome-system-tools
echo "Instalado!.";
sleep 1
opcion719="1";
;;
##Opcion -719
-719)
echo "${ca}Borrando...${cn}";
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
echo "${ca}Instalando...${cn}";
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
echo "${ca}Hecho!${cn}";
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



##Opcion 734
734)
echo "${ca}ACTUALIZANDO... un momento!${cn}";
apt-get -qq update
apt-get -y install isc-dhcp-server
clear
mv /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.backup
echo "${ca}LOCALICE EL INTERFACE (TARJETA) QUE VA A UTILIZAR PARA PXE... pulsa una tecla.${cn}";
read pausa
clear
ip a
echo "${ca}NOMBRE DE INTERFACE ej. enp0s3.:${cv} \c";
read interface

	esto='INTERFACESv4=""';
	poresto='INTERFACESv4="$interface"';
	sed -i "s/$esto/$poresto/g" /etc/default/isc-dhcp-server;
	esto='INTERFACES=""';
	poresto='INTERFACES="$interface"';
	sed -i "s/$esto/$poresto/g" /etc/default/isc-dhcp-server;
	
echo "Reemplaza $ interface por el nombre de la tarjeta de red.";
read pausa
nano /etc/default/isc-dhcp-server;


clear
echo "${ca}ESPECIFICAR, REVISAR LOS PARAMETROS DEL SERVICIO DHCP...${cn}";
sleep 3
wget $REPOSITORIO/repository/dhcpd.conf
mv dhcpd.conf /etc/dhcp/dhcpd.conf
nano /etc/dhcp/dhcpd.conf
clear
echo "${cr}ATENCION! DEBES INICIAR LUEGO EL SERVIDOR DHCP...${cn}";
sleep 4
##service isc-dhcp-server restart
echo "${ca}ESTE ES EL ESTADO ACTUAL DEL SERVICIO...${cn}";
sleep 1
service isc-dhcp-server status
sleep 3
echo "${ca}Preparando servicio de transferencia de ficheros TFTP${cn}"
sleep 3
clear
apt install tftpd-hpa
mkdir /srv/tftp

	esto='TFTP_OPTIONS="--secure --create"';
	poresto='TFTP_OPTIONS="--secure"';
	sed -i "s/$esto/$poresto/g" /etc/defaul/tftpd-hpa;

echo "${ca}Habilitando FTP PXE en arranque${cn}";
systemctl enable tftpd-hpa
echo "${ca}Iniciando el servidor FTP PXE${cn}";
systemctl start tftpd-hpa
echo "${ca}Estado del FTP:${cn}";
systemctl status tftpd-hpa
echo "${ca}Recuerda. Directorio Raiz del FTP /srv/tftp/ ";
sleep 4
clear
echo "${ca}Preparando ficheros...${cn}";
wget http://ftp.nl.debian.org/debian/dists/stretch/main/installer-amd64/current/images/netboot/netboot.tar.gz
tar xfz netboot.tar.gz -C /srv/tftp/

wget $REPOSITORIO/repository/tftp.tar.gz
tar -xzvf tftp.tar.gz -C /srv/tftp/

clear
echo "${ca}Instalando SYSLINUX...${cn}";
apt-get -y install syslinux

chmod 777 /srv/tftp/ -R
echo "${ca}ok. INSTALADO!${cn}";
sleep 4
opcion734="1";
;;

735)
clear
/etc/init.d/isc-dhcp-server restart
echo "${ca}INICIANDO DHCP del PXE ${cn}"
opcion735="1";
;;

-735)
clear
/etc/init.d/isc-dhcp-server stop
echo "${ca}DETENIDO DHCP del PXE ${cn}"
sleep 4
opcion736="0";
;;

736)
clear
/etc/init.d/tftpd-hpa start
echo "${ca}INICIANDO FTP del PXE ${cn}"
sleep 4
opcion736="0";
;;

-736)
clear
/etc/init.d/tftpd-hpa stop
echo "${ca}DETENIDO FTP del PXE ${cn}"
sleep 4
opcion736="0";
;;


#Opcion speaker
speaker)
echo "Haciendo Test de altavoces";
speaker-test -t wav -c 6 -l1
echo "Haciendo Test de frecuencia 442 a dos canales";
speaker-test -c2 -t sine -f442 -l1 -P2
echo "${ca}Hecho!${cn}";
echo "Pulsa ENTER...\c";
read pause
;;

##Opcion limpia
limpia)
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



##Opcion navegador
navegador)
echo "Cambiando...";
update-alternatives --config x-www-browser
echo "cambiado";
sleep 1
opcion88="1";
;;

##Opcion 88
88)
if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Instalando...${cn}";
	sleep 1
else
	clear
	echo "${ca}Instalando...${cn}";
	sleep 1
fi
echo "${ca}Hecho!${cn}";
sleep 1
opcion88="1";
;;

##Opcion 88
88)
echo "${ca}Instalando...${cn}";
sleep 1
echo "${ca}Hecho!${cn}";
sleep 1
opcion88="1";
;;

##Opcion 88
88)
echo "${ca}Instalando...${cn}";
sleep 1
echo "${ca}Hecho!${cn}";
sleep 1
opcion88="1";
;;


##Opcion clon
clon)
echo "${ca}Descargando...${cn}";
sleep 1
wget $REPOSITORIO/repository/clon.py
mv clon.py /opt/clon.py
chmod +x /opt/clon.py
chmod 777 /opt/clon.py
apt-get -y install python3.7
echo "${ca}Hecho!${cn}";
sleep 1
opcion88="1";
;;

##Opcion minecraft
minecraft)
echo "${ca}Descargando...${cn}";
sleep 1
wget $REPOSITORIO/repository/Minecraftdebian.jar
wget $REPOSITORIO/repository/TLauncher.jar
echo "${ca}Instalando java 17...${cn}";
apt-get install -y openjdk-17-jdk

mkdir /home/usuario/juegos
mv Minecraftdebian.jar /home/usuario/juegos/
chmod 777 /home/usuario/juegos/Minecraftdebian.jar
echo "[Desktop Entry]" > /home/usuario/Escritorio/minecraft.desktop;
echo "Version=3" >> /home/usuario/Escritorio/minecraft.desktop;
echo "Type=Application" >> /home/usuario/Escritorio/minecraft.desktop;
echo "Name=Minecraft" >> /home/usuario/Escritorio/minecraft.desktop;
echo "Comment=Minecraft" >> /home/usuario/Escritorio/minecraft.desktop;
echo "Exec=java -jar /home/usuario/juegos/Minecraftdebian.jar" >> /home/usuario/Escritorio/minecraft.desktop;
echo "Icon=/usr/share/icons/Adwaita/256x256/legacy/security-low.png" >> /home/usuario/Escritorio/minecraft.desktop;
echo "Path=/home/usuario/juegos" >> /home/usuario/Escritorio/minecraft.desktop;
echo "Terminal=false" >> /home/usuario/Escritorio/minecraft.desktop;
echo "StartupNotify=false" >> /home/usuario/Escritorio/minecraft.desktop;
echo "${ca}Hecho!${cn}";
chmod 777 /home/usuario/Escritorio/minecraft.desktop
##chmod +x /home/usuario/Escritorio/minecraft.desktop


mkdir /home/usuario/juegos
mv TLauncher.jar /home/usuario/juegos/
chmod 777 /home/usuario/juegos/TLauncher.jar
echo "[Desktop Entry]" > /home/usuario/Escritorio/TLauncher.desktop;
echo "Version=3" >> /home/usuario/Escritorio/TLauncher.desktop;
echo "Type=Application" >> /home/usuario/Escritorio/TLauncher.desktop;
echo "Name=TLauncher" >> /home/usuario/Escritorio/TLauncher.desktop;
echo "Comment=TLauncher" >> /home/usuario/Escritorio/TLauncher.desktop;
echo "Exec=java -jar /home/usuario/juegos/TLauncher.jar" >> /home/usuario/Escritorio/TLauncher.desktop;
echo "Icon=/usr/share/icons/Adwaita/256x256/legacy/security-low.png" >> /home/usuario/Escritorio/TLauncher.desktop;
echo "Path=/home/usuario/juegos" >> /home/usuario/Escritorio/TLauncher.desktop;
echo "Terminal=false" >> /home/usuario/Escritorio/TLauncher.desktop;
echo "StartupNotify=false" >> /home/usuario/Escritorio/TLauncher.desktop;
echo "${ca}Hecho!${cn}";
chmod 777 /home/usuario/Escritorio/TLauncher.desktop
##chmod +x /home/usuario/Escritorio/TLauncher.desktop


clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion88="1";
;;

##Opcion minecraftserver
minecraftserver)
echo "${ca}Descargando...${cn}";
sleep 1
apt install openjdk-11-jre-headless -y
apt install screen -y
mkdir /home/usuario/mineserver
cd /home/usuario/mineserver
wget https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar
chmod 777 /home/usuario/mineserver -R

##Instalacion para PC (usuario)
apt install -y default-jdk
echo "#!/bin/sh">start.sh
echo "java -Xms512M -Xmx1024M -jar server.jar nogui">>start.sh
chmod +x start.sh
chmod 777 start.sh
echo "eula=true" > eula.txt

##Instalacion en server de nube
clear
echo "PARA EJECUCION EN SERVIDOR DE NUVE, EJECUTA LA SESION DEL SERVIDOR CON EL COMANDO screen";
echo "";
echo "screen -S ''My Minecraft Server''";
echo "";
echo "Y EJECUTA EL SCRIPT start.sh";
echo "";
echo "una vez creada estructura de carpetas, modifica el fichero server.properties y y modifica";
echo "el parametro online-mode=false";
echo "";
echo "Para salir de la sesion escribe Ctrl+A para finalizad D";
echo "Para recuperar la ventana del servidor escribe: screen -r";
read pause;
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion88="1";
;;

##Opcion backuptic
backuptic)
if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Procesando... ${cn}";
	sleep 1
        apt-get install -y rsync
	echo "${ca}Se borrara el backup anterior en 6 segundos...${cn}";
	sleep 6
	rm -rf /.backuptic
	echo "${ca}Creando Backup...${cn}";
	sleep 1
	mkdir -p /.backuptic
	echo "BACKUP TIC" > /.backuptic/backuptic.txt
        rsync -avhp --chown --progress /home/usuario/ /.backuptic/
else
	clear
	echo "${ca}Procesando.... ${cn}";
	sleep 1
	apt-get install -y rsync
	echo "${ca}Se borrara el backup anterior en 6 segundos...${cn}";
	sleep 6
	rm -rf /.backuptic
	echo "${ca}Creando Backup...${cn}";
	sleep 1
	mkdir -p /.backuptic
        rsync -avhp --chown --progress /home/usuario/ /.backuptic/
fi
clear
echo "${ca}Hecho!${cn}";
sleep 1
;;

##Opcion restaurartic
restaurartic)
if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Procesando... ${cn}";
	sleep 1
        apt-get install -y rsync
	echo "${ca}Se borrara el usuario anterior en 6 segundos...${cn}";
	sleep 6
	echo "${ca}Restaurando...${cn}";
	rsync -a --delete /.backuptic/ /home/usuario
else
	clear
	echo "${ca}Procesando.... ${cn}";
	sleep 1
	apt-get install -y rsync
	echo "${ca}Se borrara el usuario anterior en 6 segundos...${cn}";
	sleep 6
	echo "${ca}Restaurando...${cn}";
	rsync -a --delete /.backuptic/ /home/usuario
fi
clear
echo "${ca}Hecho!${cn}";
sleep 1
;;

##Opcion congelar
congelar)
if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Procesando... ${cn}";
	sleep 1
		if [ -f /.backuptic/backuptic.txt ]; then
			echo "${ca}Se ha detectado la carpeta BACKUPTIC${cn}";
			echo "${ca}Recuera que puedes actualizar el backup con el comando backuptic${cn}";
			echo "${ca}Comprueba que no esta programado un autorestore, de lo contrario${cn}";
			echo "${ca}Cancela el proceso.... Pulsa una tecla\c${cn}";
			read pausa
			crontab -e

		else
                        echo "${ca}No se ha detectado la carpeta BACKUPTIC${cn}";
                        sleep 2
			echo "${ca}Se creara el primer backup de ficheros para restauracion (tardara un rato).${cn}";
			sleep 2			
			echo "${ca}Se recuerda que este proceso relantiza el arranque del equipo${cn}";
		        sleep 3
			echo "${ca}Si el equipo es antiguo, no se recomienda este proceso.${cn}";
			sleep 3
			echo "${ca}Pulsa una tecla para continuar.${cn}";
			apt-get install -y rsync
			echo "${ca}Creando carpeta...${cn}";
			sleep 2
			mkdir -p /.backuptic
			echo "BACKUP TIC" > /.backuptic/backuptic.txt
			echo "${ca}Creando BACKUP...${cn}";
			sleep 2
        		rsync -avhp --chown --progress /home/usuario/ /.backuptic/
			clear
			echo "${ca}Acontinuación se programará la tarea de restauración automática...${cn}";
                        read pausa
		fi

	echo "${ca}Programando un autorestore..${cn}";
	echo "##programado un autorestore" >> /var/spool/cron/crontabs/usuario;
	crontab -l > mycron
	echo "@reboot rsync -a --delete /.backuptic/ /home/usuario" >> mycron
	crontab mycron
	rm mycron

else
	clear
	echo "${ca}Detectado debian x32${cn}";
	echo "${ca}Este proceso no ha sido probado en 32 bits!!!!)${cn}";
	echo "${ca}Utiliza el comando 21${cn}";
	sleep 4
fi
clear
echo "${ca}Hecho!${cn}";
sleep 1
;;


##Opcion 88
aula)
echo "${ca}Descargando...${cn}";
sleep 1
wget $REPOSITORIO/background/fondoaula.png
mv fondoaula.png /home/usuario/
clear
su usuario -c 'xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s /home/usuario/fondoaula.png'
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion88="1";
;;

##Opcion 88
formatear)
echo "${ca}Descargando...${cn}";
sleep 1
wget $REPOSITORIO/background/fondoformateo.bmp
mv fondoformateo.bmp /home/usuario/
clear
su usuario -c 'xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s /home/usuario/fondoformateo.bmp'
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion88="1";
;;

##Opcion 88
publico)
echo "${ca}Descargando...${cn}";
sleep 1
wget $REPOSITORIO/background/publico.png
mv publico.png /home/usuario/
clear
su usuario -c 'xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s /home/usuario/publico.png'
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion88="1";
;;

##Opcion 88
congelado)
echo "${ca}Descargando...${cn}";
sleep 1
wget $REPOSITORIO/background/congelado.png
mv congelado.png /home/usuario/
clear
su usuario -c 'xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s /home/usuario/congelado.png'
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion88="1";
;;

##Opcion 88
fondo)
echo "${ca}Descargando...${cn}";
sleep 1
wget $REPOSITORIO/background/desktop-background1024.png
mv fondo.png /home/usuario/
clear
su usuario -c 'xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s /home/usuario/fondo.png'
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion88="1";
;;

##Opcion 88
fondo800)
echo "${ca}Descargando...${cn}";
sleep 1
wget $REPOSITORIO/background/desktop-background800.png
mv desktop-background800.png /home/usuario/
clear
su usuario -c 'xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s /home/usuario/desktop-background800.png'
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion88="1";
;;

##Opcion autologin
autologin)
clear
echo "${ca}Instalando...${cn}";
sleep 1
esto="#autologin-user=";
poresto="autologin-user=usuario";
sed -i "s/$esto/$poresto/g" /etc/lightdm/lightdm.conf;

esto="#autologin-user-timeout=0";
poresto="autologin-user-timeout=0";
sed -i "s/$esto/$poresto/g" /etc/lightdm/lightdm.conf;
echo "${ca}Hecho!${cn}";
sleep 1
opcion88="1";
;;

##Opcion 88
cocodrile)
if [ "$VTIPO" = "x86_64" ]
then
	echo "${ca}Instalando...${cn}";
	sleep 1
	dpkg --add-architecture i386
	apt-get -qq update
	apt-get -y install wine32
	wget $REPOSITORIO/repository/coco.tar.gz
	tar -xf coco.tar.gz -C /home/usuario
	
	dpkg --add-architecture i386
	apt-get -qq update
        apt --fix-broken -y install
	
	echo "[Desktop Entry]" > /home/usuario/Escritorio/cocodrile.desktop
	echo "Name=Crocodrile">> /home/usuario/Escritorio/cocodrile.desktop
	echo "Comment=">> /home/usuario/Escritorio/cocodrile.desktop
	echo "Exec=wine /home/usuario/wine/coco/CROCCLIP.EXE">> /home/usuario/Escritorio/cocodrile.desktop
	echo "Icon=/home/usuario/wine/coco/icon48.png">> /home/usuario/Escritorio/cocodrile.desktop
	echo "Terminal=false">> /home/usuario/Escritorio/cocodrile.desktop
	echo "Type=Application">> /home/usuario/Escritorio/cocodrile.desktop
	chmod 777 /home/usuario/Escritorio/cocodrile.desktop
 
	echo "[Desktop Entry]" > /usr/share/applications/cocodrile.desktop
	echo "Name=Crocodrile">> /usr/share/applications/cocodrile.desktop
	echo "Comment=">> /usr/share/applications/cocodrile.desktop
	echo "Exec=wine /home/usuario/wine/coco/CROCCLIP.EXE">> /usr/share/applications/cocodrile.desktop
	echo "Icon=/home/usuario/wine/coco/icon48.png">> /usr/share/applications/cocodrile.desktop
	echo "Terminal=false">> /usr/share/applications/cocodrile.desktop
	echo "Type=Application">> /usr/share/applications/cocodrile.desktop

else
	echo "${ca}Instalando detectado debian x32)${cn} ";
	sleep 1
	wget $REPOSITORIO/repository/coco.tar.gz
	tar -xf coco.tar.gz -C /home/usuario
	cp /home/usuario/wine/accesos/* /home/usuario/Escritorio/
	echo "[Desktop Entry]" > /usr/share/applications/cocodrile.desktop
	echo "Name=Crocodrile">> /usr/share/applications/cocodrile.desktop
	echo "Comment=">> /usr/share/applications/cocodrile.desktop
	echo "Exec=wine /home/usuario/wine/coco/CROCCLIP.EXE">> /usr/share/applications/cocodrile.desktop
	echo "Icon=/home/usuario/wine/coco/icon48.png">> /usr/share/applications/cocodrile.desktop
	echo "Terminal=false">> /usr/share/applications/cocodrile.desktop
	echo "Type=Application">> /usr/share/applications/cocodrile.desktop
fi
	rm coco.tar.*
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion47="1";
;;

##Opcion 88
pneusim)
echo "${ca}Descargando...${cn}";
sleep 1
	dpkg --add-architecture i386
	apt-get -qq update
	apt-get -y install wine32
	wget $REPOSITORIO/repository/pn.tar.gz
	tar -xf pn.tar.gz -C /home/usuario
	cp /home/usuario/wine/accesos/* /home/usuario/Escritorio/
	clear
	echo "${ca}Hecho!${cn}";
	rm pn.tar.gz

	echo "[Desktop Entry]" > /usr/share/applications/Pnsim.desktop
	echo "Name=Pnsim">> /usr/share/applications/Pnsim.desktop
	echo "Comment=">> /usr/share/applications/Pnsim.desktop
	echo "Exec=wine /home/usuario/wine/Pneusim/PneusimP.EXE">> /usr/share/applications/Pnsim.desktop
	echo "Icon=/home/usuario/wine/Pneusim/icon48.png">> /usr/share/applications/Pnsim.desktop
	echo "Terminal=false">> /usr/share/applications/Pnsim.desktop
	echo "Type=Application">> /usr/share/applications/Pnsim.desktop
sleep 1
opcion88="1";
;;

##Opcion 88
flsim)
echo "${ca}Descargando...${cn}";
sleep 1
	dpkg --add-architecture i386
	apt-get -qq update
	apt-get -y install wine32
	wget $REPOSITORIO/repository/flsim.tar.gz
	tar -xf flsim.tar.gz -C /home/usuario
	cp /home/usuario/wine/accesos/* /home/usuario/Escritorio/

	echo "[Desktop Entry]" > /usr/share/applications/Flsim.desktop
	echo "Name=Flsim">> /usr/share/applications/Flsim.desktop
	echo "Comment=">> /usr/share/applications/Flsim.desktop
	echo "Exec=wine /home/usuario/wine/flsin/bin/fl_sim_p.exe">> /usr/share/applications/Flsim.desktop
	echo "Icon=/home/usuario/wine/flsin/icon48.png">> /usr/share/applications/Flsim.desktop
	echo "Terminal=false">> /usr/share/applications/Flsim.desktop
	echo "Type=Application">> /usr/share/applications/Flsim.desktop
clear
echo "${ca}Hecho!${cn}";
rm flsim.tar.*
sleep 1
opcion88="1";
;;



##Opcion 66
66)
if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Instalando...${cn}";
	sleep 1
	apt install ffmpeg -y
	apt install obs-studio -y
else
	clear
	echo "${ca}Instalando...${cn}";
	sleep 1
	apt install ffmpeg -y
	apt install obs-studio -y
fi
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion66="1";
;;


##Opcion 67
67)
if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Instalando...${cn}";
	sleep 1
	apt install mixxx -y
	apt install lmms -y
	apt install hydrogen -y
else
	clear
	echo "${ca}Instalando...${cn}";
	sleep 1
	apt install mixxx -y
	apt install lmms -y
	apt install hydrogen -y
fi
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion67="1";
;;

##Opcion 68
68)
if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Instalando...${cn}";
	sleep 1
	apt install simplescreenrecorder -y
else
	clear
	echo "${ca}Instalando...${cn}";
	sleep 1
	apt install simplescreenrecorder -y
fi
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion68="1";
;;

##Opcion 68b
68b)
if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Instalando...${cn}";
	sleep 1
 	apt install vokoscreen -y
else
	clear
	echo "${ca}Instalando...${cn}";
	sleep 1
	apt install vokoscreen -y
fi
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion68b="1";
;;


##Opcion kodi
69)
	if [ "$VTIPO" = "x86_64" ]
	then
		clear
		echo "${ca}Instalando...${cn}";
		sleep 1
		apt-get -qq update
		apt --fix-broken install -y45
		apt-get -y install deb-multimedia-keyring
		apt-get install kodi
	else
		clear
		echo "${ca}Instalando...${cn}";
		sleep 1
		#Si no esta inserta contenido
		patronX="deb http://deb.debian.org/debian stretch main contrib non-free";
		ficheroX="/etc/apt/sources.list";
		if ! grep -q "$patronX" $ficheroX; then
		    	echo Insertamos...
		    	echo "## Debian Multimedia Repo KODI##">> $ficheroX;
		    	echo "$patronX">> $ficheroX;
		fi
		apt-get -qq update
		apt-get -y install deb-multimedia-keyring
		apt-get -y install kodi
	fi
echo "${ca}Hecho!${cn}";
sleep 1
opcion69="1";
;;






##Opcion calibrar
calibrar)
if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}  ${cn}";
	sleep 1
	echo "ATENCION. EL proceso modifica el fichero /etc/X11/xorg.conf.d/99-calibration.conf";
	echo "EJECUTA ANTES aplicaciones/sistema/Calibrate Touchscreen";
	read pause
		if [ -f /etc/X11/xorg.conf.d/99-calibration.conf ]; then
		nano /etc/X11/xorg.conf.d/99-calibration.conf
		else
			mkdir /etc/X11/xorg.conf.d
			echo "Section \"InputClass\" ">/etc/X11/xorg.conf.d/99-calibration.conf
			echo "  Identifier      \"calibration\"">>/etc/X11/xorg.conf.d/99-calibration.conf
			echo "  MatchProduct    \"HS Touch \"">>/etc/X11/xorg.conf.d/99-calibration.conf
			echo "  Option  \"MinX\"  \"1250\"">>/etc/X11/xorg.conf.d/99-calibration.conf
			echo "  Option  \"MaxX\"  \"63416\"">>/etc/X11/xorg.conf.d/99-calibration.conf
			echo "  Option  \"MinY\"  \"505\"">>/etc/X11/xorg.conf.d/99-calibration.conf
			echo "  Option  \"MaxY\"  \"65414\"">>/etc/X11/xorg.conf.d/99-calibration.conf
			echo "  Option  \"TransformationMatrix\"  \"1 0 0 0 1 0 0 0 1\"">>/etc/X11/xorg.conf.d/99-calibration.conf
			echo "  Option  \"SwapXY\"        \"0\" ">>/etc/X11/xorg.conf.d/99-calibration.conf
			echo "  Option  \"InvertX\"       \"0\"  ">>/etc/X11/xorg.conf.d/99-calibration.conf
			echo "  Option  \"InvertY\"       \"0\"  ">>/etc/X11/xorg.conf.d/99-calibration.conf
			echo "  EndSection">>/etc/X11/xorg.conf.d/99-calibration.conf
			nano /etc/X11/xorg.conf.d/99-calibration.conf

		fi
fi
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion88="1";
;;


##Opcion Among
Among)
if [ "$VTIPO" = "x86_64" ]
then
	clear
	echo "${ca}Instalando...${cn}";
	sleep 1
	apt-get install q4wine
	wget $REPOSITORIO/repository/Among.zip
	mkdir /home/usuario/Among
	chmod 777 /home/usuario/Among -R
        clear
	echo ----------------------------------------------------------------------
	echo Dale al boton derecho abrir vinculo:
	echo Url: https://mega.nz/file/BRZRFKSB#jlf2aFnCPkmxiOzXbSR53zrjw2giJOLDjNROYfkjwbk
	echo Descarga y descomprime los archivos en la carpeta /home/usuario/Among
	echo ----------------------------------------------------------------------
	read pausa
        clear
	echo ----------------------------------------------------------------------
	echo El fichero Among US.exe debe estar en la ruta /home/usuario/Among/Among US.exe
	echo ----------------------------------------------------------------------
	read pausa
	NOMBREREC="Among"
	echo "[Desktop Entry]">> /home/usuario/Escritorio/$NOMBREREC.desktop;
	echo "Name=$NOMBREREC">> /home/usuario/Escritorio/$NOMBREREC.desktop;
	echo "Icon=folder-remote-symbolic">> /home/usuario/Escritorio/$NOMBREREC.desktop;
	echo "Type=Application">> /home/usuario/Escritorio/$NOMBREREC.desktop;
	echo "Exec=wine '/home/usuario/Among/Among Us.exe'">> /home/usuario/Escritorio/$NOMBREREC.desktop;
	echo "StartupNotify=false">> /home/usuario/Escritorio/$NOMBREREC.desktop;
	echo "Terminal=false">> /home/usuario/Escritorio/$NOMBREREC.desktop;
	echo "Comment=">> /home/usuario/Escritorio/$NOMBREREC.desktop;
	echo "Path=">> /home/usuario/Escritorio/$NOMBREREC.desktop;
	chmod 777 /home/usuario/Escritorio/$NOMBREREC.desktop
	echo "${ca}Instalado!!${cn} ";
else
	clear
	echo "${ca}Instalando...${cn}";
	apt-get install q4wine
	wget $REPOSITORIO/repository/Among.zip
        mkdir /home/usuario/Among
	chmod 777 /home/usuario/Among -R
        clear
	echo ----------------------------------------------------------------------
	echo Dale al boton derecho abrir vinculo:
	echo Url: https://mega.nz/file/UDJSTDpT#RIzyxhLfqrTRvPWi-U4jxL74o8LdvD6yMJ24TQWIyLA
	echo Descarga y descomprime los archivos en la carpeta /home/usuario/Among
	echo ----------------------------------------------------------------------
	read pausa
        clear
	echo ----------------------------------------------------------------------
	echo El fichero Among US.exe debe estar en la ruta /home/usuario/Among/Among US.exe
	echo ----------------------------------------------------------------------
	read pausa
	NOMBREREC="Among"
	echo "[Desktop Entry]">> /home/usuario/Escritorio/$NOMBREREC.desktop;
	echo "Name=$NOMBREREC">> /home/usuario/Escritorio/$NOMBREREC.desktop;
	echo "Icon=folder-remote-symbolic">> /home/usuario/Escritorio/$NOMBREREC.desktop;
	echo "Type=Application">> /home/usuario/Escritorio/$NOMBREREC.desktop;
	echo "Exec=wine '/home/usuario/Among/Among Us.exe'">> /home/usuario/Escritorio/$NOMBREREC.desktop;
	echo "StartupNotify=false">> /home/usuario/Escritorio/$NOMBREREC.desktop;
	echo "Terminal=false">> /home/usuario/Escritorio/$NOMBREREC.desktop;
	echo "Comment=">> /home/usuario/Escritorio/$NOMBREREC.desktop;
	echo "Path=">> /home/usuario/Escritorio/$NOMBREREC.desktop;
	chmod 777 /home/usuario/Escritorio/$NOMBREREC.desktop
	echo "${ca}Instalado!!${cn} ";
fi
sleep 1
opcion88="1";
;;



##Opcion 88
teamviewer)
echo "${ca}Descargando...${cn}";
sleep 1
wget https://download.teamviewer.com/download/version_11x/teamviewer_i386.deb
dpkg -iG teamviewer_i386.deb
apt --fix-broken -y install
clear
echo "${ca}Hecho!${cn}";
rm teamviewer_i386.deb
sleep 1
opcion88="1";
;;

##Opcion 88
-teamviewer)
echo "${ca}Borrando...${cn}";
sleep 1
apt-get -y remove teamviewer
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion88="1";
;;


##Opcion kill
kill)
clear
echo "Nombre o parte de nombre de la aplicacion?: \c"
read pkillapp
pkill $pkillapp
echo "echo!";
sleep 1
;;

##Opcion reparar swap
swap)
clear
fdisk -l /dev/sda >swap.txt
grep "swap" swap.txt
echo "Copia la ruta /dev/sdax (ej (/dev/sad5) y pegala aqui: \c"
read swapon
swapoff $swapon
mkswap $swapon
swapon -s
echo "Copia el UUID de la particion y sustituyela en el siguiente paso"
read pausa
nano /etc/fstab
echo "echo!";
sleep 1
;;

##Opcion reparar UUID (arranque lento)
UUID)
clear
echo "Reparando arranque con pausa UUID"
rm /etc/initramfs-tools/conf.d/resume
update-initramfs -u
echo "echo! (reinicia)";
sleep 3
;;

##Opcion ver log de arranque
logboot)
clear
journalctl --boot
;;

##Opcion git
git)
echo "${ca}Instalando...${cn}";
sleep 1
sudo apt-get -y install git
clear
echo "${ca}Hecho!${cn}";
sleep 1
;;
##Opcion git
-git)
echo "${ca}Instalando...${cn}";
sleep 1
sudo apt-get remove git
clear
echo "${ca}Hecho!${cn}";
sleep 1
;;

##Opcion 88
playonlinux)
echo "${ca}Descargando...${cn}";
wget -q "http://deb.playonlinux.com/public.gpg" -O- | apt-key add -
wget http://deb.playonlinux.com/playonlinux_wheezy.list -O /etc/apt/sources.list.d/playonlinux.list
apt-get -qq update
apt-get -y install playonlinux
sleep 1
opcion88="1";
;;
##Opcion 88
-playonlinux)
apt-get remove playonlinux
echo "${ca}Hecho!${cn}";
sleep 1
opcion88="1";
;;


##Opcion bebianapt
##Instalar todos los programas abalar
bebianapt)
##Anulamos el repositorio CD
esto="deb cdrom:";
poresto="# deb cdrom:";
sed -i "s/$esto/$poresto/g" /etc/apt/sources.list;

mkdir debtemp
cd debtemp

apt-get -y install gdebi
apt-get -y install xinput-calibrator
apt-get -y install autofirma
apt-get -y install wget
apt-get -y install lumi

## MULTIMEDIA
apt-get -y install openshot
apt-get -y install musescore
apt-get -y install audacity
apt-get -y install winff
apt-get -y install guvcview

## GRAFICOS

apt-get -y install mypaint
apt-get -y install librecad
apt-get -y install freecad
apt-get -y install inkscape
apt-get -y install blender
apt-get -y install shotwell
apt-get -y install openscad

## ELECTRONICA
apt-get -y install geda
apt-get -y install fritzing
#apt-get -y install s4a

## OFICINA
apt-get -qq update
apt-get -y install calibre
apt-get -y install pdfshuffler

## DESARROLLO
apt-get -y install arduino
apt-get -y install scratch
apt-get -y install geany
apt-get -y install glade
apt-get -y install freemind

## INTERNET
apt-get -f install chromium chromium-l10n
  
## EDUCACION
apt-get -y install avogadro
apt-get -y install gperiodic
apt-get -y install jclic
apt-get -y install lybniz
apt-get -y install stellarium
apt-get -y install kalgebra
apt-get -y install kalzium
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
apt-get -y install shutter

## PAQUETES ##
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget http://descargas.pntic.mec.es/cedec/exe_learning/2.3.1/intef-exe_2.3.1_all.deb
wget http://ftp.es.debian.org/debian/pool/main/s/squeak-vm/squeak-vm_4.10.2.2614-1.1+b1_i386.deb
#wget http://s4a.cat/downloads/S4A16.deb
##wget http://mblockapp.oss-cn-hongkong.aliyuncs.com/mBlock4.0/mBlock_4.0.4_i386.deb

## DESCOMPRIMIR PAQUETES ##
dpkg -i *.deb

echo "${ca}Hecho!${cn}";
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
apt-get -y install shutter
apt-get -y install autofirma
apt-get -y install anki
apt-get -y install lumi


## MULTIMEDIA

apt-get -y install kodi
apt-get -y install kdenlive
apt-get -y install openshot
apt-get -y install freemind
apt-get -y install evince
apt-get -y install musescore
apt-get -y install audacity
apt-get -y install winff
apt-get -y install guvcview
apt-get -y install recordmydesktop
apt-get -y install simplescreenrecorder

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
apt-get -y install openscad

## ELECTRONICA

apt-get -y install geda
apt-get -y install fritzing
apt-get -y install s4a

## OFICINA
apt-get -qq update
apt-get -y install calibre
apt-get -y install pdfshuffler

## DESARROLLO
apt-get -y install bluefish
apt-get -y install arduino
apt-get -y install scratch
apt-get -y install glade
apt-get -y install geany

## INTERNET
apt-get -y install icedove
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
apt-get -y install ktuberling
apt-get -y install pdfshuffler

## ACCESORIOS ##
apt-get -y install nautilus
apt-get -y install galculator
apt-get -y install pdfmod
apt-get -y install terminator
apt-get -y install vim
apt-get -y install xournal
apt-get -y install kate
apt-get -y install shutter

## PAQUETES ##
##wget http://visualino.net/downloads/ubuntu/visualino_0.7_i386.deb
wget http://descargas.pntic.mec.es/cedec/exe_learning/2.3.1/intef-exe_2.3.1_all.deb
wget http://ftp.es.debian.org/debian/pool/main/s/squeak-vm/squeak-vm_4.10.2.2614-1.1+b1_i386.deb
wget http://s4a.cat/downloads/S4A16.deb
##wget http://mblockapp.oss-cn-hongkong.aliyuncs.com/mBlock4.0/mBlock_4.0.4_i386.deb

## DESCOMPRIMIR PAQUETES ##
dpkg -i *.deb
echo "${ca}Hecho!${cn}";
sleep 1
opcion88="1";
;;

#Opcion update
update)
echo "Ultima update realizada el $UDIA ";
##Detectar Discord
if [ -f /usr/share/applications/discord.desktop ]; then
	clear;	
	echo "${ca}Detectado Discord${cn}";
	sleep 1;
fi

##Detectar Anydesk
if [ -f /usr/share/applications/anydesk.desktop ]; then
	echo "${ca}Detectado Anydesk${cn}";
	sleep 1;
fi

##Detectar Emule
if [ -f /usr/share/amule/webserver/default/favicon.ico ]; then
	echo "${ca}Detectado Emule${cn}";
	sleep 1;
fi

# Si no se ha actualizado hoy

if [ "$DIA" != "$UDIA" ]; then
	##Reparar iconos
	if [ -f /home/usuario/Escritorio/compartido.desktop ]; then
		clear;	
		echo "${ca}Reparando iconos...${cn}";
		sleep 1;
		esto="folder-remote-symbolic";
		poresto="folder";
		sed -i "s/$esto/$poresto/g" /home/usuario/Escritorio/compartido.desktop;
	fi

	##Detectar chromium
	if [ /usr/share/applications/chromium.desktop ]; then
		echo "${cv}Actualizando chromium... ${cn}";
		sleep 1
		apt-get -y install chromium chromium-l10n
	
	fi

	##Detectar Chrome
	if [ -f /usr/share/applications/google-chrome.desktop ]; then
		echo "${cv}Actualizando chrome... ${cn}";
		sleep 1
		wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
		dpkg -i google-chrome-stable_current_amd64.deb
		rm google-chrome-stable_current_amd64.deb
	fi
fi


echo "${cv}Actualizando el Sistema espere... ${cn}";
sleep 1
apt-get update
apt-get -qq -y install curl
clear
echo "${cv}Actualizando el configurador... ${cn}";
sleep 1
cp $RUTASCRIPT $RUTASCRIPT"_"$(date +%F_%H%M%S)
#verificamos version servidor
if [ "$VTIPO" = "x86_64" ]
then
	wget -q $REPOSITORIO/sh/64/setup.ver
else
	wget -q $REPOSITORIO/sh/32/setup.ver
fi

if [ ! -f setup.ver ]; then
    clear
	echo "";
	echo "${cr}                         No hay conexion a internet.${cn}";
else
    curl --silent $CENTROS
    wget -q -O $DIRECTORIO/setup.sh $REPOSITORIO/sh/64/setup.sh
    rm setup.ver
	if [ ! -f /media/usuario/TICGALICIA/setup.sh ]; then
	echo "";
	else
	#Actualizar el USB
	echo "${cv}      Se ha actualizado el setup del USB TICGALICIA. ${cn}";
	cp /root/setup.sh /media/usuario/TICGALICIA/setup.sh
	echo "";
	echo "";
	fi
    	clear
	echo "${cv}Actualizado! ${cn}";
	echo "${cr}Ya puedes ejecutar de nuevo el script.${cn}";
fi
clear
echo "${cv}Puedes forzar la desinstalacion de chrome con -58 y volverlo a instalar... ${cn}";
sleep 2
# Marcando ultimo update
echo "$DIA"> logsetup.log;
exit
opcion88="1";
;;

#Opcion fix
fix)
echo "${cv}Reparando... ${cn}";
sleep 1
echo "${cv}Solucionando problemas DPKG... ${cn}";
sleep 1
dpkg --configure -a
apt-get clean && sudo apt-get autoclean
echo "${cv}Solucionando problemas de dependencias... ${cn}";
sleep 1
apt --fix-broken -y install
apt-get update --fix-missing
apt-get install -f
echo "${cv}Borrando paquetes rotos... ${cn}";
sleep 1
apt-get remove
apt -y autoremove
echo "${cv}Listo! ${cn}";
sleep 1
;;

#Opcion version
version)
echo "Descargando fichero de version...";
sleep 1
wget -O $DIRECTORIO/setup.ver $REPOSITORIO/sh/setup.ver
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

#Opcion copiaroot
copiaroot)
echo "Copiando a /root...";
sleep 1
cp /home/usuario/setup.sh /root/setup.sh
chmod 777 /root/setup.sh
clear
echo "${cr}Ejecuta de nuevo el script.${cn}";
exit
opcion88="1";
;;

#Opcion copiatic
copiatic)
echo "Copiando a /media/TICGALICIA...";
sleep 1
cp /root/setup.sh /media/usuario/TICGALICIA/
chmod 777 /media/usuario/TICGALICIA/setup.sh
clear
echo "Copiado.";
exit
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
echo "Version del sistema operativo : \c"
cat /etc/debian_version
echo "Arquitectura (32 o 64bits) : \c"
uname -m
##getconf WORD_BIT
echo "Version del configurador : $version"
echo "Version disponible : $verserv"
echo "Ruta del Script: $DIRECTORIO"
echo "IP: \c"
ip addr | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'
echo
echo "Informacion de DISCO :"
lsblk --nodeps -o name,model,serial
echo
echo "Informacion de GRAFICA :"
lspci |grep VGA
echo
echo Escribe cpu pci o usb para mas informacion sobre perifericos del equipo
echo Escribe dpkg para ver los paquetes de software instalados.
if [ "$version" = "$verserv" ]
then
    echo
    echo
else
    echo "${cr}Existe una nueva version del configurador!.${cn}"
    echo "${ca}Escribe update para actualizarla.${cn}";
fi
echo
echo "Pulsa ENTER...\c";
read pausa;
;;


##Opcion cpu
cpu)
clear;
lscpu
echo "Pulsa ENTER...\c";
read pausa;
;;

##Opcion pci
pci)
clear;
lspci -v | less
echo "Pulsa ENTER...\c";
read pausa;
;;

##Opcion usb
usb)
clear;
lsusb
echo "Pulsa ENTER...\c";
read pausa;
;;

##Opcion listado dpkg
dpkg)
clear;
echo "Lista de paquetes";
sleep 1
dpkg -l
clear;
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
echo "El comando util muestra utilidades para los administradores";
echo
echo
echo
echo "Pulsa ENTER...\c";
read pausa;
;;


##Opcion clonezilla
clonezilla)
clear;
echo "Instalando clonezilla...";
echo
apt-get install clonezilla -y
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

##Opcion exit
exit)
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
echo "Pulsa ENTER...\c";
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
echo "Pulsa ENTER...\c";
read pausa
clear;
;;

##Opcion restaura_escritorio
restaurar_escritorio)
echo "${ca}Descargando...${cn}";
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
echo "${ca}Borrando...${cn}";
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

##Opcion repararusuario
repararusuario)
clear;
echo "Restaurando ficheros originales...";
sleep 2
cp -R /etc/skel/.[a-z]* /home/usuario/
echo "${ca}Hecho!${cn}";
sleep 2
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
echo "${ca}Borrando...${cn}";
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
echo "${ca}Hecho!${cn}";
sleep 2
clear;
;;

##Opcion bloquear redes
bloquearredes)
echo "Descargando filtro...";
sleep 1
wget -q wget $REPOSITORIO/sh/bloqueoredes.txt
cat bloqueoredes.txt >> /etc/hosts
rm bloqueoredes.txt
echo "${ca}Hecho!${cn}";
sleep 2
;;

##Opcion bloquear porno
bloquearporno)
echo "Descargando filtro...";
sleep 1
wget -q wget $REPOSITORIO/sh/bloqueoadultos.txt
cat bloqueoadultos.txt >> /etc/hosts
rm bloqueoadultos.txt
echo "${ca}Hecho!${cn}";
sleep 2
;;


##Opcion borrarhost
borrarhost)
echo "Preparando hosts...";
hostn=$(cat /etc/hostname);
sleep 1
rm /etc/hosts
echo "127.0.0.1       localhost" >> /etc/hosts
echo "127.0.0.1       "$hostn >> /etc/hosts
echo "# The following lines are desirable for IPv6 capable hosts" >> /etc/hosts
echo "::1     localhost ip6-localhost ip6-loopback" >> /etc/hosts
echo "ff02::1 ip6-allnodes" >> /etc/hosts
echo "ff02::2 ip6-allrouters" >> /etc/hosts
echo "${ca}Hecho!${cn}";
sleep 2
;;



##Opcion bloquear juegos
bloquearjuegos)
echo "Descargando filtro...";
sleep 1
wget -q wget $REPOSITORIO/sh/bloqueojuegos.txt
cat bloqueojuegos.txt >> /etc/hosts
rm bloqueojuegos.txt
echo "${ca}Hecho!${cn}";
sleep 2
;;

##Opcion hotpotatoes
hotpotatoes)
echo "${ca}Descargando...${cn}";
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
echo "${ca}Borrando...${cn}";
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
reboot)
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
prometheam)
clear
echo "${ca}No hay soporte para LINUX para esta pizarra.";
echo "Intentaremos instalar una version 32Bits!...${cn}";
sleep 5
if [ "$VTIPO" = "x86_64" ]
then
echo "${ca}Intentando instalar driver para 32 en sistema 64!${cn}";
sleep 1
dpkg --add-architecture i386
apt-get -qq update
wget http://activsoftware.co.uk/linux/repos/driver/PrometheanLtd.asc

sudo cat <<EOF>> /etc/apt/sources.list
deb [trusted=yes] http://activsoftware.co.uk/linux/repos/ubuntu xenial non-oss
deb [trusted=yes] http://activsoftware.co.uk/linux/repos/driver/ubuntu xenial oss non-oss 
EOF
apt-key add Promethean.asc
apt update
apt install libjpeg62
apt install activinspire activtools activdriver -y
apt install activtools


else
echo "${ca}Instalando 32bit!${cn}";
wget $REPOSITORIO/repository/Promethean.asc
sudo cat <<EOF>> /etc/apt/sources.list
deb http://activsoftware.co.uk/linux/repos/debian/ wheezy oss non-oss 
EOF
apt-key add Promethean.asc
apt-get update
apt-get install libjpeg62
apt-get install activinspire activtools activdriver -y
fi
rm Promethean.asc
clear
echo "${ca}Ejecuta synaptic para revisar Activtolls y demas componentes!${cn}";
sleep 5
opcion88="1";
;;

##Opcion smart
smart)
if [ "$VTIPO" = "x86_64" ]
then
echo "${ca}No tenemos este driver de momento para 64!${cn}";
sleep 1
else
echo "${ca}Instalando 32bit!${cn}";
sleep 1
echo "Ahora instalamos el driver.";
read continuar;
### http://es.archive.ubuntu.com/ubuntu/pool/main/u/udev/libudev0_175-0ubuntu9_i386.deb
dpkg -i $REPUSB/pizarras/smart/libudev0_175-0ubuntu9_i386.deb
apt-get install dkms patch libcurl3 libnspr4-0d
dpkg -i $REPUSB/pizarras/smart/smart-common_10.3.1236.1-1_i386.deb
dpkg -i $REPUSB/pizarras/smart/smart-hwr_11.0.379.1-1_i386.deb
dpkg -i $REPUSB/pizarras/smart/smart-languagesetup_2.2.1191.4-1_i386.deb
dpkg -i $REPUSB/pizarras/smart/smart-product-drivers_11.0.379.1-1_i386.deb 
apt-get -f install
echo "Ahora instalamos el software. Puedes cancelar.";
read continuar;
dpkg -i $REPUSB/pizarras/smart/smart-gallerysetup_1.3.1236.1-1_i386.deb
dpkg -i $REPUSB/pizarras/smart/smart-activation_1.1.1181.1-1_i386.deb
dpkg -i $REPUSB/pizarras/smart/smart-notebook_11.0.379.0-1_i386.deb
sudo apt-get install xinput-calibrator 
xinput-callibrator
echo Fuente
echo https://mainkivi.info/index.php/Maquinari_en_Linux
echo "${ca}Hecho!${cn}";
fi
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion88="1";
;;

##Opcion iqboard
iqboard)
if [ "$VTIPO" = "x86_64" ]
then
echo "${ca}No tenemos este driver de momento para 64!${cn}";
sleep 1
else
echo "${ca}Instalando 32bit!${cn}";
sleep 1
wget $REPOSITORIO/repository/IQBoard_ET_PS_Drivers_V7_0_20140425_32.deb
dpkg -i IQBoard_ET_PS_Drivers_V7_0_20140425_32.deb
rm IQBoard_ET_PS_Drivers_V7_0_20140425_32.deb
fi
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion88="1";
;;

##Opcion iqboard
multiclass)
if [ "$VTIPO" = "x86_64" ]
then
echo "${ca}Instalando 64bit!${cn}";
sleep 1
## wget https://www.multiclass.com/FTP/software/multiCLASS_Book_Debian_32.deb
wget https://www.multiclass.com/FTP/software/multiCLASS_Book_Debian_64.deb
dpkg -i multiCLASS_Book_Debian_64.deb
rm multiCLASS_Book_Debian_64.deb
chmod 777 /usr/bin/iwbv7/ -R
mv /usr/bin/iwbv7/plugins/mediaservice /usr/bin/iwbv7
chmod 777 /usr/bin/iwbv7/ -R
ln -s /lib/x86_64-linux-gnu/libudev.so.1 /lib/x86_64-linux-gnu/libudev.so.0
sh /usr/bin/iwbv7/run.sh
echo "${ca}Crear enlace a /usr/bin/iwbv7/run.sh${cn}";
sleep 3
else
echo "${ca}No tenemos este driver de momento para 32!${cn}";
sleep 3
fi
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion88="1";
;;


##########DRIVERS##########

##Opcion broadcom
broadcom)
apt-get install linux-image-$(uname -r|sed 's,[^-]*-[^-]*-,,') linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,') broadcom-sta-dkms
apt-get install -f
dpkg-reconfigure broadcom-sta-dkms
modprobe -r b44 b43 b43legacy ssb brcmsmac bcma
modprobe wl
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion88="1";
;;

##Opcion nvidia
nvidia)
echo "${ca}Descargando...${cn}";
sleep 1
apt-get -y install bumblebee
clear
echo "${ca}Hecho!${cn}";
sleep 1
opcion88="1";
;;

##Opcion wn725n
wn725n)
echo "${ca}Instalando...${cn}";
if [ ! -f $REPUSB/TL-WN725N-TP-Link-Debian/control_ap ]; then
echo "Necesita conexion internet y tener instalado git (github)";
echo "Deseas continuar (S/N)?: \c";
read continuar;
if [ "$continuar" = "S" ]
then
apt-get -qq update
apt-get install linux-headers-$(uname -r)
apt-get -qq update
apt-get install build-essential
git clone https://github.com/ilnanny/TL-WN725N-TP-Link-Debian.git
cd TL-WN725N-TP-Link-Debian
make all
make install
insmod 8188eu.ko
service network-manager restart
echo "${ca}Hecho!${cn}";
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
cd $REPUSB/TL-WN725N-TP-Link-Debian/
make all
make install
insmod 8188eu.ko
service network-manager restart
echo "${ca}Hecho!${cn}";
echo "Pulsa ENTER para reiniciar el equipo...\c";
read pausa
continuar="";
reboot
fi
sleep 1
;;

##Opcion vigor
vigor530usb)
echo "${ca}Instalando...${cn}";
if [ ! -f $REPUSB/vigor530usb/2.13.1.0.lm86.arm ]; then
echo "Necesita conexion internet";
echo "Deseas continuar (S/N)?: \c";
read continuar;
if [ "$continuar" = "S" ]
then
wget https://daemonizer.de/prism54/prism54-fw/fw-usb/2.13.1.0.lm86.arm --no-check-certificate
cp 2.13.1.0.lm86.arm /lib/firmware/isl3886usb
modprobe -r p54usb ; modprobe p54usb
echo "${ca}Hecho!${cn}";
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
cd $REPUSB/vigor530usb/
cp 2.13.1.0.lm86.arm /lib/firmware/isl3886usb
modprobe -r p54usb ; modprobe p54usb
echo "${ca}Hecho!${cn}";
echo "Pulsa ENTER para reiniciar el equipo...\c";
read pausa
continuar="";
reboot
fi
sleep 1
;;

##Opcion hplip
hplip)
echo "${ca}Instalando...${cn}";
if [ ! -f $REPUSB/drivers/hplip/hplip_3_17_7.run ]; then
echo "Necesita conexion internet";
echo "Deseas continuar (S/N)?: \c";
read continuar;
if [ "$continuar" = "S" ]
then
wget http://51.38.187.16/ticgalicia/repository/HPdrivers.run
sh HPdrivers.run
rm HPdrivers.run
echo "${ca}Hecho!${cn}";
else
echo "No se ha modificado.";
continuar="";
echo "Pulsa ENTER...";
read pausa
fi
else
sh $REPUSB/drivers/hplip/hplip_3_17_7.run
echo "${ca}Hecho!${cn}";
fi
sleep 1
;;

##Opcion extra (completar con aplicaciones EDIXGAL)
extra)
apt-get -y install arandr
apt-get -y install onboard
apt-get -y install qtqr
apt-get -y install xournal
apt-get -y install openscad
apt-get -y install kataluga
apt-get -y install gaupol
apt-get -y install vokoscreen
apt-get -y install lumi
apt-get -y install shutter
apt-get -y install autofirma
apt-get -y install ktuberling
apt-get -y install pdfshuffler
apt-get -y install s4a
apt-get -y install kgeography
apt-get -y install kalgebra
apt-get -y install kwordquiz
apt-get -y install geda-gschem
apt-get -y install step
apt-get -y install lybniz


#juegos
apt-get -y install tuxmath
apt-get -y install scid
apt-get -y install supertux
apt-get -y install xboard
apt-get -y install ktuberling
apt-get -y install omnitux
apt-get -y install tuxpaint
apt-get -y install tuxtype


wget https://downloads.sourceforge.net/project/arasuite/arasuite_unix_2_2_4_1.sh
sh arasuite_unix_2_2_4_1.sh
sleep 1
;;

##Opcion 88
juegos)
apt-get -y install tuxmath
apt-get -y install tuxpaint
apt-get -y install scid
apt-get -y install supertux
apt-get -y install xboard
apt-get -y install ktuberling
apt-get -y install omnitux
apt-get -y install tuxtype
apt-get -y install childsplay
apt-get -y install gcompris
apt-get -y install gbrainy
apt-get -y install blinken

;;

##Opcion 88
-sources)
clear
echo "${ca}Editando fichero sources.list${cn}";
sleep 3
nano /etc/apt/sources.list
echo "${ca}Hecho!${cn}";
sleep 1
;;

##Opcion 88
sources)
clear
echo "${ca}Atencion, se agregaran los repositorios oficiales a sources.list${cn}";
echo "${ca}Podrian duplicarse las entradas (puedes revisarlas con -sources){cn}";
read pause
echo "deb http://deb.debian.org/debian bookworm main contrib non-free non-free-firmware">> /etc/apt/sources.list;
echo "deb-src http://deb.debian.org/debian bookworm main contrib non-free non-free-firmware">> /etc/apt/sources.list;
echo "deb http://deb.debian.org/debian-security/ bookworm-security main contrib non-free non-free-firmware">> /etc/apt/sources.list;
echo "deb-src http://deb.debian.org/debian-security/ bookworm-security main contrib non-free non-free-firmware">> /etc/apt/sources.list;
echo "deb http://deb.debian.org/debian bookworm-updates main contrib non-free non-free-firmware">> /etc/apt/sources.list;
echo "deb-src http://deb.debian.org/debian bookworm-updates main contrib non-free non-free-firmware">> /etc/apt/sources.list;
echo "${ca}Hecho!${cn}";
sleep 1
;;


##Opcion 32bits
32bits)
clear;
echo "${ca}Instalando compatibilidad 32bits${cn}";
dpkg --add-architecture i386
apt-get update
apt-get dist-upgrade
apt-get -f install
apt-get clean
echo "${ca}Hecho!${cn}";
sleep 1
clear;
;;

##Opcion 32bits
-32bits)
apt-get purge `dpkg --get-selections | grep ":i386" | awk '{print $1}'`
aptitude remove "^.*:i386$"
aptitude remove ~i~ri386
dpkg --remove-architecture i386
echo "${ca}Hecho!${cn}";
sleep 1
clear;
;;


##Opcion ms
ms)
clear;
echo "Menu servidores";
sleep 1
menu=700;
clear;
;;

##Opcion ms
otros)
clear;
echo "Menu otros";
sleep 1
menu=900;
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
##########UTILIDADES##########
##Opcion mc
mc)
echo "${ca}Instalando...${cn}";
apt-get -y install mc
echo "${ca}Hecho!${cn}";
sleep 1
;;

##Opcion mc
-mc)
echo "Borrando mc ..."
apt-get -y remove mc
echo "${ca}Hecho!${cn}";
sleep 1
;;

dc)
echo "${ca}Instalando...${cn}";
apt-get install -y doublecmd-qt
echo "${ca}Hecho!${cn}";
sleep 1
;;

-dc)
echo "${ca}Borrando...${cn}";
apt-get remove -y doublecmd-qt
echo "${ca}Hecho!${cn}";
sleep 1
;;

##########FIN UTILIDADES##########
##########FIN MENU#######

*)
menu=$(( menu + 1 ));
if [ "$menu" = "11" ]
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
