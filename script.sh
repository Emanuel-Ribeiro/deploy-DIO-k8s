#!/bin/bash

echo "****************************"
echo "* Criando as imagens...... *"
echo "****************************"

docker build -t alan297/php-backend:1.0 backend/.
docker build -t alan297/sql-database:1.0 database/.

echo "**********************************"
echo "* Realizando push das imagens....*"
echo "**********************************"

docker push alan297/php-backend:1.0
docker push alan297/sql-database:1.0

echo "*************************************"
echo "*Criando servicos no cluster k8s....*"
echo "*************************************"

kubectl apply -f ./services.yml

echo "**************************************"
echo "**     Criando os deployments....   **"
echo "**************************************"

kubectl apply -f ./deployment.yml