#!/bin/bash
# 1-Asegurar que el script lo ejecuta el superusuario
if [[ "${UID}" -eq 0 ]]
then
# 2-Pide el nombre del usuario.
        echo "Introduce el nombre de usuario: "
        read  nombre_usuari
        # 3-Pide el nombre real del usuarios (se introducira en el campo de lo comentarios).
        echo "Introduce el nombre real: "
        read  nombre_real
        # 4-Pide la contraseña.
        echo "Introduce la contraseña que quieres tener: "
        read -s contra
        # 5-Crea el usuario.
        useradd -c ${nombre_real} -m ${nombre_usuari}
        # 6-Comprueba que el usuario ha sido creado correctamente.
        cat /etc/passwd | grep ${nombre_usuari}
        if [[ $? -eq 0 ]]
        then
                echo "Comprovación de que el usario se ha creado correctamente"
        else
                echo "ha ocurrido un error"
                exit 1
        fi
