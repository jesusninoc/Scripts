#! /bin/bash
# Script que realiza las siguientes tareas:
# Listar-Ficheros
# Crear-Fichero
# Leer-Ficheros
# Copiar-Fichero
# Mover-Fichero
# Eliminar-Fichero
# Permisos
# Instalar-Paquete
# Matar-Process
# Crear-User
# Desactivar-User
# Eliminar-User
# Crear-Grupo
# Eliminar-Grupo
# Tarea-Programada

echo "Seleccione una de las siguientes tareas:"
echo "Listar-Ficheros, Crear-Fichero, Leer-Ficheros, Copiar-Fichero, Mover-Fichero, Eliminar-Fichero, Permisos, Instalar-Paquete, Matar-Process, Crear-User, Desactivar-User, Eliminar-User, Crear-Grupo, Eliminar-Grupo, Tarea-Programada" 
read opc
case $opc in
Listar-Ficheros)
	ls -la
;;
Crear-Fichero)
	echo "Escriba el nombre del fichero:"
	read nomfich
	mkdir $nomfich
;;
Leer-Fichero)
	echo "Escriba el nombre del fichero a leer:"
	read nomfichleer
	type $nomfichleer
;;
Copiar-Fichero)
	echo "Escriba el nombre del fichero que desea copiar"
	read nomfichcopy
	echo "Escriba el nombre del fichero nuevo:"
	read nuevofich
	cp $viejo $nuevo
;;
Mover-Fichero)
	echo "Escriba el nombre del fichero que desea mover:"
        read movefich
        echo "Escriba el nombre del fichero nuevo:"
        read movenewfich
        mv $movefich $movenewfich
;;
Eliminar-Fichero)
	echo "Escriba el nombre del fichero que desea mover:"
	read deletefich
	r, $deletefich
;;
Permisos)
	echo "Escriba el nombre del fichero al que desea asignar permisos:"
	read nomfichepermisos
	echo "Asigne los permisos:"
	read permisos
	chmod $permisos $nomfichpermisos
;;
Instalar-Paquete)
	echo "Escriba el nombre del paquete que desea instalar:"
	read paquetinstall
	sudo apt-get install $paquetinstall
;;
Matar-Process)
	top
	echo "Escriba el nombre del proceso que desea eliminar:"
	read nomprocess
	kil -TERM $nomprocess
;;
Crear-User)
	echo "Escriba el nombre del usuario que va a crear:"
	read nomuser
	sudo adduser $nomuser
;;
Desactivar-User)
	echo "Escriba el nombre del usuario que va a desactivar:"
	read nomuser
	sudo usermod -L $nomuser
;;
Eliminar-User)
	echo "Escriba el usuario que va a eliminar:"
	read nomuser
	sudo userdel $nomuser
;;
Crear-Grupo)
	echo "Escriba el nombre del grupo que va a crear:"
	read nomgrupo
	groupadd $nomgrupo
;;
Eliminar-Grupo)
	echo "Escriba el nombre del grupo que va a eliminar:"
	read nomgrupo
	groupdell $nomgrupo
;;
Tarea-Programada)
	echo "Creación de una tarea programada, sigua los pasos:"
	echo "Introduzca los minutos (0-59):"
	read min
	echo "Introduzca la hora(formato 24h):"
	read hora
	echo "Introduzca un día del mes:"
	read diames
	echo "Introduzca el mes:"
	read mes
	echo "Día de la semana 0 a 7 donde 0 y 7 es domingo, o introduzca la tres primeras letras del día (mon, tue, wed, thu, fri, sat, sun)"
	echo "Intruduzca el dia de la semana:"
	read  diasemana
	echo "Introduzca el comando que desea ejecutar"
	read orden
	crontab -e 
	$min $hora $diames $mes $diasemana $orden
;;
esac
