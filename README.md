# Desafio Devops
Esse projeto disponibiliza uma aplicação escrita em Python, onde sua finalidade é gravar e exibir mensagens.



# Parâmetros de configuração

As credenciais de acesso para o provisionamento dos recursos computacionais e autenticação no registry, estão armazenadas nas respectivas váriaveis de ambiente:

|VARIÁVEL|DESCRIÇÃO|
|:---|:---|
|access_key|Chave de acesso à AWS|
|secret_key|Segredo de acesso à AWS |
|DOCKER_PWD|Senha do registry|
|DOCKER_USER|Usuário do registry|

Configure essas variáveis no repositório do projeto do Gitlab. 

# Tecnologias utilizadas
- Terraform para a criação dos recursos computacionais na AWS  
- Gitlab-ci para a execução da pipeline do projeto
- Docker para criação da imagem da aplicação

# Execução do projeto:

Foi criado uma pipeline contendo os seguintes estágios:
 - Lint
 - Build
 - Publish
 - Deploy

 Para alterar algum comportamento da pipeline, edite o arquivo **.gitlab-ci.yml**.

 Trecho do arquivo:
 ```c

. . .

Docker_build-package:
  image: docker:20.10.16
  stage: build
  needs: [Docker_Lint] 
  script:
    - docker build --tag=python-api:1.0 . 
    - docker save -o python-api:1.0.tar python-api:1.0
  allow_failure: false

  cache: {}

. . .

```
# Testes

Após a execução da pipeline, verifique o IP informado no estágio _Terraform_Deploy_para configurar a url de cadastro de mensagens.


Estágio _Terraform_Deploy_ da pipeline:
```c

. . .

aws_instance.globo: Creation complete after 33s [id=i-0857c239b9eeccf55]
Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
Outputs:
public_ip = "54.160.165.34"
Saving cache for successful job
00:01
. . .

Job succeeded
```

Abra um terminal shell em seu computador e utilize o comando curl para cadastrar as mensagens:


Use os comandos abaixo para cadastrar as mensagens

```c
# matéria 1
curl -sv public_ip/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"alice@example.com","comment":"first post!","content_id":1}'
curl -sv public_ip/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"alice@example.com","comment":"ok, now I am gonna say something more useful","content_id":1}'
curl -sv public_ip/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"bob@example.com","comment":"I agree","content_id":1}'

# matéria 2
curl -sv public_ip/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"bob@example.com","comment":"I guess this is a good thing","content_id":2}'
curl -sv public_ip/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"charlie@example.com","comment":"Indeed, dear Bob, I believe so as well","content_id":2}'
curl -sv public_ip/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"eve@example.com","comment":"Nah, you both are wrong","content_id":2}'

```

Pra a exibição dessas mensagens, abra um navegador web e informa as duas urls abaixo:

```c
# listagem matéria 1
curl -sv public_ip/api/comment/list/1

# listagem matéria 2
curl -sv public_ip/api/comment/list/2
```


# Observações

Por padrão a aplicação fica disponível na porta 8000. Porém ao iniciar o contêiner na instância, foi realizado o mapeamento de porta para 80. Assim, não há necessidade de informar a porta IP.


