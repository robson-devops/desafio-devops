#!/bin/bash

#-----------------------------------------------------------------------------------------------------
#                          |SCRIPT DE CONFIGURAÇÃO DO S.O. E INSTALAÇÃO DA APLICAÇÃO|
#-----------------------------------------------------------------------------------------------------
# EQUIPE   : DevOps
# AUTOR    : Robson Ferreira
#-----------------------------------------------------------------------------------------------------
# DESCRIÇÃO DO SCRIPT:
#  Configuração do Sistema Operacional e da aplicação Python.
#-----------------------------------------------------------------------------------------------------
# EXEMPLO DE EXECUÇÃO DO SCRIPT:
#  - Não se aplica. Execução automática via pipeline.
#-----------------------------------------------------------------------------------------------------
# HISTÓRICO:
# v1.0 - 06/06/2022 - Robson Ferreira: Criação do script.
#-----------------------------------------------------------------------------------------------------
# INFORMAÇÕES IMPORTANTES:
# - Os comandos serão executados com o usuário root.Tenha cuidado...;-)
#-----------------------------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------------------------
# - CONFIGURAÇÃO DO SISTEMA OPERACIONAL

    apt-get update -y
    apt install docker.io -y
    usermod -aG docker $USER

# - INSTALAÇÃO DA APLICAÇÃO 

    docker pull robsonferreira/python-api:1.0
    docker run -dit --name python-api -p 80:8000 robsonferreira/python-api:1.0


#-----------------------------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------------------------
 
 exit 0
