### Por Adolfo David Mauro mail: davidmauroweb@gmail.com


clear

echo "*****************************************************"
echo " Post Instal de Void"
echo " Escritorio  BSPWM + Sxhkd + polibar + Lxdm"
echo " NOTA: la clave puede ser solicitada en varias"
echo " oportunidades por cuestiones de TimeOut"
echo " * Los fondos cambian aleatoriamente entre las"
echo "  Imágenes en ~/Fondosvs, coloque ahí sus imagenes"
echo " * La configuración de los atajos de teclados esta en "
echo " en .config/sxhkd/sxhkdrc"
echo "******************************************************"
echo ""
echo ""
sleep 2s
echo "Introduzca contraseña para continuar"
sudo -k
if sudo true; then
	clear
	echo "Iniciando Instalación..."
	sleep 2s
else
	clear
	echo "Debe introduccir contraseña para continuar"
	exit 1
fi


#base grafica
echo "actualizando el sistema"
sudo xbps-install -Syyu
echo "Instalando extras del sistema"
sudo xbps-install -Sy at-spi2-core base-devel xtools p7zip xdg-user-dirs NetworkManager network-manager-applet xorg xinit gvfs gvfs-mtp elogind lightdm lightdm-gtk-greeter bspwm nano sxhkd polybar htop neofetch leafpad xarchiver octoxbps arc-icon-theme arc-theme feh picom font-Siji font-unifont-bdf font-FixedMisc terminator jgmenu arandr pcmanfm lxappearance volumeicon ImageMagick
echo " Fin de instalación de extras "
echo "<Enter> para continuar"
read al

#Ofimatica
clear
echo "Paquetes de Oficina"
echo "-------------------"
echo "1. Abiword + Gnumeric"
echo "2. Libreoffice"
echo "3. Sin Paquetes de Oficina"
read o
spell= "aspell hunspell-es_ES"
case $o in
	1)
		o="abiword gnumeric "$spell
		;;
	2)
		o="libreoffice libreoffice-i18n-es "$spell
		;;
	*)
		echo "Se ha omitido la instalación de paquetes de Oficina"
		o=""
		;;
esac

clear
echo "Navegadores"
echo "-------------------"
echo "1. Firefox"
echo "2. Chromium"
echo "3. Midori"
echo "4. Dillo (navegador gráfico minimalista)"
read w
case $w in
	1)
	w=" firefox"
	;;
	2)
	w=" chromium"
	;;
	3)
	w=" midori"
	;;
	4)
	w=" dillo"
	;;
	*)
	echo "Se ha omitido la instalación del navegador"
	w=""
	;;
esac

clear
echo "Multimedia"
echo "-------------------"
echo "1. VLC"
echo "2. mpv + audacious"
read m
case $m in
        1)
        m=" vlc "
        ;;
        2)
        m=" mpv audacious"
        ;;
        *)
        echo "Se ha omitido la instalación reproductores multimedia"
        m=""
        ;;
esac


# Instalo las selecciones
echo "instalaciondo los paquetes seleccionados - Ingrese la clave si es requerida"
sudo xbps-install -Sy $o $w $m

clear
echo "Aplicando configuraciones..."
sleep 2s

#config
xdg-user-dirs-update

echo "copiando archivos de configuracion personal"


mkdir $HOME/.config
cp config/* -R $HOME/.config/
cp config/.nanorc $HOME/
#mkdir $HOME/.config/bspwm
#cp config/bspwm/* $HOME/.config/bspwm/
#mkdir $HOME/.config/sxhkd
#cp config/sxhkd/* $HOME/.config/sxhkd/
#mkdir $HOME/.config/polybar
#cp config/polybar/* $HOME/.config/polybar/
#mkdir $HOME/.config/jgmenu
#cp config/jgmenu/* $HOME/.config/jgmenu/
mkdir $HOME/Scripts
cp Scripts/* $HOME/Scripts/ -R
echo $w >> $HOME/.config/sxhkd/sxhkdrc

mkdir $HOME/Fondosvs
cp *.jpg $HOME/Fondosvs/

#iniciar servicios
echo "Activando Servicios"
sudo ln -s /etc/sv/dbus /var/service/
sudo ln -s /etc/sv/NetworkManager /var/service/
sudo ln -s /etc/sv/elogind /var/service/
sudo ln -s /etc/sv/lightdm /var/service/
#sudo echo "vm.swappiness=2" >> /etc/sysctl.conf
sudo cp Unifon* /usr/share/fonts/ -R
sudo cp light* /etc/lightdm


###

echo "Instalacion de VoidBsp Completada"
echo "Pulse cualquiera tecla para continuar..."
read tecla
clear
