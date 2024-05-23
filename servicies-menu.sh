#!/bin/bash

listar_contenido(){
	echo ""
	read -p "Introduce la Ruta Absoluta a la Carpeta: " ruta
	if [ -d "$ruta" ]; then
		ls -l "$ruta"
    	else
        	echo "La ruta no es un directorio válido."
    	fi
}

crear_archivo(){
	echo ""
	read -p "Ingrese la linea de texto para almacenar en el archivo: " texto
	echo ""
	read -p "Ingrese el nombre que tendrá el archivo: " archivo
	echo "$texto" > "$archivo"
	echo "Archivo ' $archivo ' fue creado exitosamente, con contenido: $texto"
}

comparar_archivos(){
echo ""
read -p "Ingrese la Ruta al Primer Archivo: " archivo1
read -p "Ingrese la Ruta al Segundo Archivo: " archivo2
echo ""
diff "$archivo1" "$archivo2"
}

use_awk(){
echo ""
echo "**Ejemplo de awk, imprimirá la tercera columna/palabra de un 'archivo.txt'**"
echo ""
read -p "Ingrese la ruta del archivo para usar con awk: " archivo
echo ""
awk '{print $3}' "$archivo"
}

use_grep(){
echo "***Ejemlo de grep buscando una cadena en los archivos de texto creados***"
echo ""
read -p "Ingrese la cadena de texto a buscar: " cadena
echo ""
grep "$cadena" *.txt
}

while true; do
	echo ""
	echo "**************************Menú**************************"
	echo "1. Listar el contenido de un fichero(carpeta)"
	echo "2. Crear un archivo de texto con una linea de texto"
	echo "3. Comparar dos archivos de texto"
	echo "4. Mostrar el uso de awk"
	echo "5. Mostrar el uso de grep"
	echo "6. Salir"
	echo ""
	
	read -p "Elige una opcion: " opcion

	case $opcion in
        1) listar_contenido ;;
        2) crear_archivo ;;
        3) comparar_archivos ;;
        4) use_awk ;;
        5) use_grep ;;
        6) echo "Saliendo..."; exit ;;
        *) echo "Opción no válida" ;;
    esac

done