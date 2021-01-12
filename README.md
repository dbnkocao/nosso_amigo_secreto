![Logo of the project](https://github.com/dbnkocao/nosso_amigo_secreto/blob/master/public/readme_images/logo.png)
## Nosso Amigo Secretao

Esse projeto foi produzido durante o bootcamp do [onebitcode](https://onebitcode.com/), é uma ferramento para gerenciamento da famosa brincadeira de final de ano Amigo Secreto. Faz o sorteio de amigos garantindo que nenhum participante tire ele mesmo como amigo e envia email para os participantes avisando quem é o seu amigo secreto.


## Tecnologias

Tecnologias usadas nesse projeto.

* Ruby version  2.5.1
* Rails version 5.0.1
* Postgresql 9.5
* Redis


## Ruby Gems
* devise
* cancancan
* redis
* materialize
* sidekiq

## Deploy

* Para instalar as gems:
  >    $ bundle install
* Para criar a base de dados e a estrutura do banco de dados:
  >    $ rake db:create db:migrate
* Subindo o projeto:
  >    $ rails s

## Deploy usando Docker e Docker Compose

  > docker-compose run --rm app bundle install

  > docker-compose run --rm app yarn install

  > docker-compose run --rm app bundle exec rake db:create db:migrate

  > docker-compose up -d

## Como Usar
### 1. Home
![siign up](https://github.com/dbnkocao/nosso_amigo_secreto/blob/master/public/readme_images/home.png)


### 2. Criando novo usuário
![siign up](https://github.com/dbnkocao/nosso_amigo_secreto/blob/master/public/readme_images/signup.png)

### 3. Entrando no sistema
![login](https://github.com/dbnkocao/nosso_amigo_secreto/blob/master/public/readme_images/login.png)

### 4. Criando uma nova campanha
![new campaign](https://github.com/dbnkocao/nosso_amigo_secreto/blob/master/public/readme_images/create_campaign.png)

### 5. Listando campanhas
![list campaigns](https://github.com/dbnkocao/nosso_amigo_secreto/blob/master/public/readme_images/campaign_list.png)

### 6. Email enviado para o participante
![email user](https://github.com/dbnkocao/nosso_amigo_secreto/blob/master/public/readme_images/add_user.png)

## Funcionalidades
* Criação de inúmeras campanhas
* Sorteio automático.
* Envio de email aos participantes informando o amigo secreto.

## Links
  * Repository: (https://github.com/dbnkocao/nosso_amigo_secreto)

## Authors
* **Daniel Nascimento**: @dbnkocao (https://github.com/dbnkocao)
