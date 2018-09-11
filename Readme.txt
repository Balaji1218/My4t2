# Copyright Temenos @ 2018
# This repository contains following files that will be used to create T24 Domain, where T24 application will be deployed

1) create-T24-domain.py
2) createT24Domain.sh
3) t24DomainEnv.sh
4) Dockerfile

Build Docker Image:
To build Docker Image of Weblogic T24 Domain, place all the files listed above in a folder. Select the location and execute 

$ docker build -t t24domain .

System will create the docker image, whose name is t24domain. This image will be used to deploy T24 Application.