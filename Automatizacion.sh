#!/bin/bash

# PARTE 1: Crear el repositorio de trabajo

# Crear carpeta local
mkdir PRACTICA_GIT
cd PRACTICA_GIT

# Inicializar el repositorio
git init

# Crear fichero README
echo "This is a README file" > README.md

# Añadir el fichero y hacer commit
git add README.md
git commit -m "Initial Commit"

# Verificar el estado del repositorio
git status

# Crear un repositorio en GitHub (esto debe hacerse manualmente)
echo "Por favor, crea un repositorio en GitHub llamado PRACTICA_GIT y copia la URL."
read -p "Pega la URL del repositorio remoto: " REPO_URL

# Conectar el repositorio local con el remoto
git remote add origin $REPO_URL
git branch -M main
git push -u origin main

# Crear fichero indice.txt
echo -e "Capítulo 1: Introducción a Git\nCapítulo 2: Flujo de trabajo básico\nCapítulo 3: Repositorios remotos" > indice.txt

# Añadir el fichero y hacer commit
git add indice.txt
git commit -m "Añadido índice del libro."

# Modificar el fichero indice.txt
echo -e "Capítulo 1: Introducción a Git\nCapítulo 2: Flujo de trabajo básico\nCapítulo 3: Gestión de ramas\nCapítulo 4: Repositorios remotos" > indice.txt

# Mostrar los cambios
git diff

# Añadir el fichero y hacer commit
git add indice.txt
git commit -m "Añadido capítulo 3 sobre gestión de ramas."

# Cambiar el mensaje del último commit
git commit --amend -m "Añadido capítulo 3 sobre gestión de ramas al índice."

# Subir los cambios al repositorio remoto
git push origin main

# PARTE 2: Historial de cambios

# Mostrar el historial de cambios
git log

# Crear la carpeta capítulos y el fichero capitulo1.txt
mkdir capitulos
echo "Git es un sistema de control de versiones ideado por Linus Torvalds." > capitulos/capitulo1.txt

# Añadir los cambios y hacer commit
git add capitulos/capitulo1.txt
git commit -m "Añadido capítulo 1."

# Crear el fichero capitulo2.txt
echo "El flujo de trabajo básico con Git consiste en: 1- Hacer cambios en el repositorio. 2- Añadir los cambios a la zona de intercambio temporal. 3- Hacer un commit de los cambios." > capitulos/capitulo2.txt

# Añadir los cambios y hacer commit
git add capitulos/capitulo2.txt
git commit -m "Añadido capítulo 2."

# Mostrar las diferencias entre versiones
git diff HEAD~2 HEAD

# Crear el fichero capitulo3.txt
echo "Git permite la creación de ramas lo que permite tener distintas versiones del mismo proyecto y trabajar de manera simultánea en ellas." > capitulos/capitulo3.txt

# Añadir los cambios y hacer commit
git add capitulos/capitulo3.txt
git commit -m "Añadido capítulo 3."

# Mostrar las diferencias entre la primera y la última versión
git diff $(git log --pretty=format:%H | tail -1) HEAD

# Añadir una línea al fichero indice.txt
echo "Capítulo 5: Conceptos avanzados" >> indice.txt

# Añadir los cambios y hacer commit
git add indice.txt
git commit -m "Añadido capítulo 5 al índice."

# Mostrar quién ha hecho cambios en indice.txt
git log indice.txt

# Subir los cambios al repositorio remoto
git push origin main

# PARTE 3: Deshacer cambios

# Eliminar la última línea de indice.txt
sed -i '$ d' indice.txt

# Verificar el estado del repositorio
git status

# Deshacer los cambios en indice.txt
git checkout -- indice.txt

# Verificar el estado del repositorio
git status

# Eliminar la última línea de indice.txt y añadir al staging area
sed -i '$ d' indice.txt
git add indice.txt

# Verificar el estado del repositorio
git status

# Quitar los cambios del staging area
git reset indice.txt

# Verificar el estado del repositorio
git status

# Deshacer los cambios en indice.txt
git checkout -- indice.txt

# Verificar el estado del repositorio
git status

# Eliminar la última línea de indice.txt y capitulo3.txt
sed -i '$ d' indice.txt
rm capitulos/capitulo3.txt

# Crear un archivo vacío capitulo4.txt
touch capitulos/capitulo4.txt

# Añadir los cambios al staging area
git add .

# Verificar el estado del repositorio
git status

# Quitar los cambios del staging area
git reset

# Verificar el estado del repositorio
git status

# Deshacer los cambios para volver a la versión anterior
git checkout -- .

# Verificar el estado del repositorio
git status

# Eliminar la última línea de indice.txt y capitulo3.txt
sed -i '$ d' indice.txt
rm capitulos/capitulo3.txt

# Añadir los cambios al staging area y hacer commit
git add .
git commit -m "Borrado accidental."

# Deshacer el último commit, pero mantener los cambios
git reset --soft HEAD~1

# Verificar el historial y el estado del repositorio
git log
git status

# Volver a hacer el commit
git commit -m "Borrado accidental."

# Deshacer el último commit y los cambios anteriores
git reset --hard HEAD~1

# Verificar el historial y el estado del repositorio
git log
git status

# Subir los cambios al repositorio remoto
git push origin main

# PARTE 4: RAMAS

# Crear una nueva rama bibliografía
git branch bibliografia

# Mostrar las ramas del repositorio
git branch

# Cambiar a la rama bibliografía
git checkout bibliografia

# Modificar capitulo1.txt en la rama bibliografía
echo "En este capítulo veremos cómo usar GitHub para alojar repositorios en remoto." >> capitulos/capitulo1.txt

# Añadir los cambios y hacer commit
git add capitulos/capitulo1.txt
git commit -m "Añadido capítulo 1."

# Mostrar la historia del repositorio incluyendo todas las ramas
git log --all --graph --oneline

# Crear el fichero bibliografia.txt
echo "Chacon, S. and Straub, B. Pro Git. Apress." > bibliografia.txt

# Añadir los cambios y hacer commit
git add bibliografia.txt
git commit -m "Añadida primera referencia bibliográfica."

# Cambiar a la rama main
git checkout main

# Fusionar la rama bibliografía con main
git merge bibliografia

# Eliminar la rama bibliografía
git branch -d bibliografia

# Crear la rama bibliografía nuevamente
git branch bibliografia

# Cambiar a la rama bibliografía
git checkout bibliografia

# Modificar bibliografia.txt en la rama bibliografía
echo -e "Scott Chacon and Ben Straub. Pro Git. Apress.\nRyan Hodson. Ry’s Git Tutorial. Smashwords (2014)" > bibliografia.txt

# Añadir los cambios y hacer commit
git add bibliografia.txt
git commit -m "Añadida nueva referencia bibliográfica."

# Cambiar a la rama main
git checkout main

# Modificar bibliografia.txt en la rama main
echo -e "Chacon, S. and Straub, B. Pro Git. Apress.\nLoeliger, J. and McCullough, M. Version control with Git. O’Reilly." > bibliografia.txt

# Añadir los cambios y hacer commit
git add bibliografia.txt
git commit -m "Añadida nueva referencia bibliográfica."

# Fusionar la rama bibliografía con main y resolver conflictos
git merge bibliografia

# Resolver el conflicto en bibliografia.txt
echo -e "Chacon, S. and Straub, B. Pro Git. Apress.\nLoeliger, J. and McCullough, M. Version control with Git. O’Reilly.\nHodson, R. Ry’s Git Tutorial. Smashwords (2014)" > bibliografia.txt

# Añadir los cambios y hacer commit
git add bibliografia.txt
git commit -m "Resuelto conflicto de bibliografía."

# Mostrar la historia del repositorio incluyendo todas las ramas
git log --all --graph --oneline

# Subir los cambios al repositorio remoto
git push origin main

echo "¡Práctica completada!"