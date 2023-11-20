# Rotten-Tomatoes

## Backend

### Node version: 20.9.0;
### postgres: Last version;

#### OBS
usar o NVM (Node Version Manager) para facilitar o uso do Node;
O nome do BD deve ser 'rottenTomatoes';

### Dentro do diretório do projeto rodar

'npm i' ou 'npm install' para instalar as dependência do projeto;. Todas as dependencias do mesmo podem ser vista no 'package.json'

### Se não houve erros, rodar

'npm run dev', para roda o projeto na versão com o nodemon (utilizado para identificar as modificações no código) ou npm 'npm run start'
para rodar o projeto sem o nodemon;


### Rodar o projeto no servidor


#### Comandos úteis para o servidor

Verificar se o postgres esta instalado no servidor: 'sudo systemctl status postgresql'

Instalar postgressql via terminal: 'sudo apt install postgresql'

Acessar o PSQL: sudo -u postgres psql

Alterar senha usuario postgres: alter user <username> with encrypted password '<password>'

listar tabelas no psql: \d
listar usuarios no psql: \du
listar banco de dados no psql: \l
acessar um BD no psql: \c <nome_do_BD>
sair do psql: '\q'

