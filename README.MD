## __Ambiente React Native com Docker__
---

### __Requisitos Geral__
- Docker

### __Requisitos Windows__
- Android Studio 
- Chocolatey

### __Requisitos Mac OS__
- Android Studio ou XCODE
- Cocoapods

---

### __Instruções Ambiente Local__

#### __Windows__
1 - Instalar [Chocolatey](https://chocolatey.org/install) <br>
2 - Realizar configuração CLI do [React Native](https://reactnative.dev/docs/environment-setup) <br>
_Obs. Script para automatizar configuração nesse repositório em "Scripts". Para sua execução, recomenda-se a execução do PowerShell no modo administrador._


#### __iOS__
1 - Instalar [Cocoapods](https://cocoapods.org/) <br>
2 - Realizar configuração CLI do [React Native](https://reactnative.dev/docs/environment-setup) <br>
_Obs. Script para automatizar configuração nesse repositório em "Scripts". Para sua execução, recomenda-se a execução do PowerShell no modo administrador._

---

### __Instruções ambiente Docker__
1 - Clonar esse repositório. <br>
2 -  Alterar path em "volumes" no arquivo "docker-compose.yml" para o local do projeto.
```
#Default
volumes:
    - /local/path/to/project/:/docker/path

#Example
volumes:
    - D:/Trabalho/Aditiva/projetos/test/AwesomeProject/:/docker/path
```
3 - Acessar via terminal o diretório do DOCKER-RN e executar o comando para subir
```
 docker-compose up 
 #ou para executar isoladamente
 docker-compose up -d
```

4 - Instalar dependências do Projeto
```
#Identificar 'name' para executar o comando
docker ps -a 
docker exec -it <container_name> bash -c “cd /docker/path && yarn install”
```

4.1 Em caso de iOS
```
#Instale o Cocoapods antes de executar esse passo.

#Acesse o diretório do projeto react native e em seguida a pasta ios 
pod install
```

5 - Executar Projeto
```
#Bundle
docker exec -it <container_name> bash -c "cd /docker/path && yarn run start"

#Android
docker exec -it <container_name> bash -c "cd /docker/path && yarn run android"

#iOS
docker exec -it <container_name> bash -c "cd /docker/path && yarn run ios"
```