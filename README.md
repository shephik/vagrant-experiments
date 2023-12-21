# vagrant-experiments


-------------------- запуск Vagrant -------------------

`vagrant init bento/ubuntu-20.04`

`vagrant up`

ИЛИ если долго качать через впн, то перейти по ссылке на бокс, скачать через браузер

`vagrant box add --name bento/ubuntu-20.04 C:\Users\Ekaterina\Downloads\ae255a22-7794-44f1-a922-36aaa87c7bc7`\
`vagrant up`

Может возникнуть ошибка 
`Timed out while waiting for the machine to boot`

Тогда в Vagrantfile расскоментить/добавить

```
config.vm.provider "virtualbox" do |vb|
  vb.gui = true
  vb.cpus = 1
end
```

`vagrant destroy`
`vagrant up`



-------------------- работа в ВМ -------------------
`vagrant ssh` \

'cd \/vagrant' \

устанавливаем Postgres, Nodejs для Ubuntu ( проверяем `node -v` и `sudo -u postgres psql`)

Создаем пользователя vagrant с паролем и БД

**1 вариант**\
`sudo -u postgres psql`

`CREATE ROLE vagrant WITH LOGIN PASSWORD 'vagrant';`

Заходим под дефолтным юзером
`sudo -i -u postgres`\
`createdb vagrant`\
`exit`

**2 вариант**\
`sudo -u postgres createuser --createdb vagrant`\
`sudo -u postgres createdb vagrant`\
`sudo -u postgres psql -c "ALTER USER vagrant WITH PASSWORD 'vagrant';"`


`psql` => работа под юзером vagrant 
`exit` 



------------------- разворачивание проекта в vagrant --------------------- \
`clone https://github.com/${proj_name}.git`

`cd /vagrant/${proj_name}`

выполнить команды проекта




**Всю настройку внутри vagrant ssh можно заменить командой `vagrant provision` при наличии файла `script.sh`**
