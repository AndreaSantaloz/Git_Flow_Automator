#!/bin/bash

mkdir PRACTICA_GIT
cd PRACTICA_GIT
git init
echo "This is a README file" > README.md
git add README.md
git commit -m "Initial Commit"
git status
echo "Pega la URL del repositorio remoto: "
read -p "" REPO_URL
git remote add origin $REPO_URL
git branch -M main
git push -u origin main
echo -e "Capítulo 1: Introducción a Git\nCapítulo 2: Flujo de trabajo básico\nCapítulo 3: Repositorios remotos" > indice.txt
git add indice.txt
git commit -m "Añadido índice del libro."
echo -e "Capítulo 1: Introducción a Git\nCapítulo 2: Flujo de trabajo básico\nCapítulo 3: Gestión de ramas\nCapítulo 4: Repositorios remotos" > indice.txt
git diff
git add indice.txt
git commit -m "Añadido capítulo 3 sobre gestión de ramas."
git commit --amend -m "Añadido capítulo 3 sobre gestión de ramas al índice."
git push origin main
git log
mkdir capitulos
echo "Git es un sistema de control de versiones ideado por Linus Torvalds." > capitulos/capitulo1.txt
git add capitulos/capitulo1.txt
git commit -m "Añadido capítulo 1."
echo "El flujo de trabajo básico con Git consiste en: 1- Hacer cambios en el repositorio. 2- Añadir los cambios a la zona de intercambio temporal. 3- Hacer un commit de los cambios." > capitulos/capitulo2.txt
git add capitulos/capitulo2.txt
git commit -m "Añadido capítulo 2."
git diff HEAD~2 HEAD
echo "Git permite la creación de ramas lo que permite tener distintas versiones del mismo proyecto y trabajar de manera simultánea en ellas." > capitulos/capitulo3.txt
git add capitulos/capitulo3.txt
git commit -m "Añadido capítulo 3."
git diff $(git log --pretty=format:%H | tail -1) HEAD
echo "Capítulo 5: Conceptos avanzados" >> indice.txt
git add indice.txt
git commit -m "Añadido capítulo 5 al índice."
git log indice.txt
git push origin main
sed -i '$ d' indice.txt
git status
git checkout -- indice.txt
git status
sed -i '$ d' indice.txt
git add indice.txt
git status
git reset indice.txt
git status
git checkout -- indice.txt
git status
sed -i '$ d' indice.txt
rm capitulos/capitulo3.txt
touch capitulos/capitulo4.txt
git add .
git status
git reset
git status
git checkout -- .
git status
sed -i '$ d' indice.txt
rm capitulos/capitulo3.txt
git add .
git commit -m "Borrado accidental."
git reset --soft HEAD~1
git log
git status
git commit -m "Borrado accidental."
git reset --hard HEAD~1
git log
git status
git push origin main
git branch bibliografia
git branch
git checkout bibliografia
echo "En este capítulo veremos cómo usar GitHub para alojar repositorios en remoto." >> capitulos/capitulo1.txt
git add capitulos/capitulo1.txt
git commit -m "Añadido capítulo 1."
git log --all --graph --oneline
echo "Chacon, S. and Straub, B. Pro Git. Apress." > bibliografia.txt
git add bibliografia.txt
git commit -m "Añadida primera referencia bibliográfica."
git checkout main
git merge bibliografia
git branch -d bibliografia
git branch bibliografia
git checkout bibliografia
echo -e "Scott Chacon and Ben Straub. Pro Git. Apress.\nRyan Hodson. Ry’s Git Tutorial. Smashwords (2014)" > bibliografia.txt
git add bibliografia.txt
git commit -m "Añadida nueva referencia bibliográfica."
git checkout main
echo -e "Chacon, S. and Straub, B. Pro Git. Apress.\nLoeliger, J. and McCullough, M. Version control with Git. O’Reilly." > bibliografia.txt
git add bibliografia.txt
git commit -m "Añadida nueva referencia bibliográfica."
git merge bibliografia
echo -e "Chacon, S. and Straub, B. Pro Git. Apress.\nLoeliger, J. and McCullough, M. Version control with Git. O’Reilly.\nHodson, R. Ry’s Git Tutorial. Smashwords (2014)" > bibliografia.txt
git add bibliografia.txt
git commit -m "Resuelto conflicto de bibliografía."
git log --all --graph --oneline
git push origin main
echo "¡Práctica completada!"
