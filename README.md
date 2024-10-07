# Odoo Enterprise & IDE Visual Studio Code
Entorno de desarrollo de Odoo Enterprise con IDE Visual Studio

![Odoo Enterprise & Visual Studio Code](https://i.ytimg.com/vi/N1KjLdbv7kA/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLATEFBlsHpR1dYaHMiHvTApC3E4Qg)

# Contenido

- [Odoo Enterprise \& IDE Visual Studio Code](#odoo-enterprise--ide-visual-studio-code)
- [Contenido](#contenido)
- [Guía de configuración rápida:](#guía-de-configuración-rápida)
- [El archivo `.env`](#el-archivo-env)
- [Preparar entorno](#preparar-entorno)
- [Forma manual de preparar entorno de desarrollo](#forma-manual-de-preparar-entorno-de-desarrollo)
- [Preparar entorno de desarrollo. Ubuntu 20.04, Ubuntu 22.04, Ubuntu 24.04](#preparar-entorno-de-desarrollo-ubuntu-2004-ubuntu-2204-ubuntu-2404)
  - [Instalación de requisitos en maquina local](#instalación-de-requisitos-en-maquina-local)
  - [Clonar el repositorios de Odoo](#clonar-el-repositorios-de-odoo)
  - [Crear un entorno virtual](#crear-un-entorno-virtual)
    - [Instalar las dependencias de Odoo](#instalar-las-dependencias-de-odoo)
- [Gestión de submódulos (sub-proyecto o sub-repositorio)](#gestión-de-submódulos-sub-proyecto-o-sub-repositorio)
  - [Cómo agregar un nuevo submódulo](#cómo-agregar-un-nuevo-submódulo)
  - [Cómo descargar actualizaciones de superproyectos](#cómo-descargar-actualizaciones-de-superproyectos)
  - [Cómo actualizar los submódulos a la última versión en cada rama](#cómo-actualizar-los-submódulos-a-la-última-versión-en-cada-rama)
    - [Si quieres actualizar un submódulo específico](#si-quieres-actualizar-un-submódulo-específico)
    - [Si también deseas cambiar a la rama principal de cada submódulo](#si-también-deseas-cambiar-a-la-rama-principal-de-cada-submódulo)
  - [Cómo cambiar de rama con submódulos](#cómo-cambiar-de-rama-con-submódulos)
  - [Subir cambios al repositorio del subproyecto](#subir-cambios-al-repositorio-del-subproyecto)
  - [Cómo hacer merge con submódulos](#cómo-hacer-merge-con-submódulos)
    - [1. Cambiar a la rama destino:](#1-cambiar-a-la-rama-destino)
    - [2. Actualiza la rama de destino:](#2-actualiza-la-rama-de-destino)
    - [3. Fusiona la rama de origen:](#3-fusiona-la-rama-de-origen)
    - [4. Actualiza los submódulos:](#4-actualiza-los-submódulos)
    - [5. Confirma los cambios:](#5-confirma-los-cambios)
    - [6. Empuja los cambios:](#6-empuja-los-cambios)
  - [Cómo eliminar submódulo](#cómo-eliminar-submódulo)
    - [1. Desvincular el submódulo](#1-desvincular-el-submódulo)
    - [2. Eliminar las referencias al submódulo](#2-eliminar-las-referencias-al-submódulo)
    - [3. Eliminar los archivos del submódulo](#3-eliminar-los-archivos-del-submódulo)
    - [4. Confirmar los cambios](#4-confirmar-los-cambios)
    - [5. Eliminar la entrada del submódulo en el archivo .gitmodules](#5-eliminar-la-entrada-del-submódulo-en-el-archivo-gitmodules)
    - [6. Confirmar la eliminación del submódulo en el repositorio principal](#6-confirmar-la-eliminación-del-submódulo-en-el-repositorio-principal)
    - [7. (Opcional) Empujar los cambios](#7-opcional-empujar-los-cambios)
  - [Configuraciones útiles para submódulos](#configuraciones-útiles-para-submódulos)
- [Extras de GIT](#extras-de-git)
  - [Múltiples ubicaciones remotas donde el repositorio está almacenado](#múltiples-ubicaciones-remotas-donde-el-repositorio-está-almacenado)
    - [1. Verificar remotos actuales:](#1-verificar-remotos-actuales)
    - [2. Agregar un nuevo remote:](#2-agregar-un-nuevo-remote)
    - [3. Verificar que se agregó correctamente:](#3-verificar-que-se-agregó-correctamente)
    - [4. Realizar operaciones con múltiples remotos:](#4-realizar-operaciones-con-múltiples-remotos)
      - [Push a un remoto específico:](#push-a-un-remoto-específico)
      - [Push de todas las ramas a un remoto específico:](#push-de-todas-las-ramas-a-un-remoto-específico)
      - [Fetch desde un remoto específico:](#fetch-desde-un-remoto-específico)
      - [Pull desde un remoto específico:](#pull-desde-un-remoto-específico)
  - [¿Cómo cambiar de rama predeterminada o rama de seguimiento?](#cómo-cambiar-de-rama-predeterminada-o-rama-de-seguimiento)
- [Extras de Odoo](#extras-de-odoo)
  - [Scaffold](#scaffold)
  - [Shell](#shell)
  - [Shell para usar IPython como REPL](#shell-para-usar-ipython-como-repl)
- [Errores comunes](#errores-comunes)
  - [OSError: \[Errno 24\] inotify instance limit reached](#oserror-errno-24-inotify-instance-limit-reached)
  - [psycopg2.InterfaceError: connection already closed](#psycopg2interfaceerror-connection-already-closed)
- [Fuentes](#fuentes)
- [Contribuciones](#contribuciones)

# Guía de configuración rápida:
**Clonar y configurar:**
```
git clone git@github.com:focuzai/odoo_vsc.git
cd odoo_vsc
cp .env.example .env
```
# El archivo `.env`
Las variables de entorno ubicado en `.env` proporcionan configuraciones dinámicas a Odoo y al proyecto en general.

Archivo de muestra `.env`
```
# Odoo
ODOO_TAG=16.0

# Usuario de GitHub y token de acceso para clonar repositorios privados
GITHUB_USER=Hchumpitaz
GITHUB_ACCESS_TOKEN=ghp_token
```
# Preparar entorno
Ejecutar el archivo `setup_env.sh` para preparar el entorno de desarrollo local. Instalador preparado para Ubuntu 20.04, Ubuntu 22.04 y Ubuntu 24.04.
```
chmod +x setup_env.sh
./setup_env.sh
```

# Forma manual de preparar entorno de desarrollo
# Preparar entorno de desarrollo. Ubuntu 20.04, Ubuntu 22.04, Ubuntu 24.04
## Instalación de requisitos en maquina local
**Instalación de PostgreSQL**
```
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install gnupg gnupg2 gnupg1 -y
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
sudo wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo gpg --dearmor -o /usr/share/keyrings/postgresql.gpg
echo "deb [signed-by=/usr/share/keyrings/postgresql.gpg] http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list
sudo apt-get update
sudo apt-get install --no-install-recommends -y postgresql-client
```
**Opcional instalar PostgreSQL completo:**

    sudo apt-get install postgresql-16 -y

**Instalación de dependencias:**

Odoo
```
sudo apt-get install -y python3 python3-pip -y
sudo apt-get install -y git build-essential libsasl2-dev python3-cffi python3-dev python3-venv python3-wheel libldap2-dev libssl-dev libpq-dev
```

Rafnixg
```
sudo apt install python3-dev python3-pip python3-venv libxml2-dev \
    libxslt1-dev libldap2-dev libsasl2-dev libtiff5-dev \
    libjpeg8-dev libopenjp2-7-dev zlib1g-dev libfreetype6-dev \
    liblcms2-dev libwebp-dev libharfbuzz-dev libfribidi-dev libxcb1-dev libpq-dev libssl-dev
```

Yenthe666
```
sudo apt-get install python3 python3-pip -y
sudo apt-get install git python3-cffi build-essential wget python3-dev python3-venv python3-wheel libxslt-dev libzip-dev libldap2-dev libsasl2-dev python3-setuptools node-less libpng-dev libjpeg-dev gdebi -y
```
## Clonar el repositorios de Odoo

Configurar las varibles de entorno

Para clonar el repositorio de Odoo Community, Odoo Enterprise y Themes:

    chmod +x clone-addons.sh
    ./clone-addons.sh

## Crear un entorno virtual

Para crear un entorno virtual de Python para Odoo (>= python3.8), ejecute el siguiente comando:
    
    python3 -m venv env

Este comando creará un entorno virtual para Odoo en la carpeta `env`.

Para desactivar el entorno virtual:

    deactivate

### Instalar las dependencias de Odoo
Para instalar las dependencias de python para Odoo, ejecute los siguientes comandos:

    source env/bin/activate
    pip3 install --upgrade pip setuptools wheel --no-cache-dir
    pip3 install -r odoo/requirements.txt --no-cache-dir
    pip3 install -r requirements.txt --no-cache-dir
    deactivate

Estos comandos activarán el entorno virtual de Odoo, instalarán las dependencias necesarias y desactivarán el entorno virtual.

# Gestión de submódulos (sub-proyecto o sub-repositorio)

## Cómo agregar un nuevo submódulo

    git submodule add -b <branch> <url> <path>
    git commit -m "feat: Se agrego nuevo submódulo <name>"

## Cómo descargar actualizaciones de superproyectos
De forma predeterminada, el repositorio del submódulo se recupera, pero no se actualiza cuando ejecuta `git pull` en el superproyecto. Se necesita usar `git submodule update`, o agregar `--recurse-submodules` a pull:

    git pull
    git submodule update --init --recursive

o, en un comando (Git >= 2.14)

    git pull --recurse-submodules

`--init` es necesario si el superproyecto agregó nuevos submódulos, y `--recursive` es necesario si algún submódulo tiene submódulos.

Si alguna vez el superproyecto cambia la URL del submódulo, se requiere un comando por separado:

    git submodule sync --recursive
    git submodule update --init --recursive

## Cómo actualizar los submódulos a la última versión en cada rama

Este comando recuperará las últimas versiones de los submódulos según la rama configurada en el archivo `.gitmodules ` y los actualizará en tu repositorio.

    git submodule update --remote

### Si quieres actualizar un submódulo específico

Esto actualizará solo el submódulo con el nombre especificado.

    git submodule update --remote nombre_submodulo

### Si también deseas cambiar a la rama principal de cada submódulo

Estos comandos cambiarán cada submódulo a la rama principal y luego realizarán un pull para actualizarlos.

    git submodule foreach git checkout main
    git submodule foreach git pull origin main

## Cómo cambiar de rama con submódulos
De forma predeterminada, el árbol de trabajo del submódulo no se actualiza para que coincida con el commit registrado en el superproyecto al cambiar de rama. Necesita usar `git submodule update`, o agregar `--recurse-submodules` a checkout:


    git checkout <branch>
    git submodule update --recursive

o, en un comando (Git >= 2.13)

    git checkout --recurse-submodules <branch>

## Subir cambios al repositorio del subproyecto

Mientras está en el directorio del submódulo:

    git push

O mientras está en el directorio principal:

    git push --recurse-submodules=on-demand

## Cómo hacer merge con submódulos
Cuando estás trabajando con submódulos en Git y necesitas realizar un git merge entre ramas que contienen submódulos, hay algunos pasos adicionales que debes seguir para asegurarte de que los submódulos se actualicen correctamente. Aquí hay una guía paso a paso:

Supongamos que tienes dos ramas: rama_origen y rama_destino, y quieres fusionar rama_origen en rama_destino.

### 1. Cambiar a la rama destino:

    git checkout rama_destino

### 2. Actualiza la rama de destino:
Asegúrate de que la rama de destino esté actualizada con los cambios más recientes:

    git pull origin rama_destino

### 3. Fusiona la rama de origen:
Fusiona la rama de origen en la rama de destino:

    git merge rama_origen

### 4. Actualiza los submódulos:
Después de fusionar las ramas, necesitas actualizar los submódulos:

    git submodule update --init --recursive

Este comando asegura que los submódulos estén inicializados y actualizados después de la fusión. Si el submódulo ha sido agregado o actualizado en la rama de origen, este paso asegura que esos cambios se reflejen en la rama de destino.

### 5. Confirma los cambios:
Confirma los cambios en la rama de destino, incluyendo las actualizaciones de los submódulos:

    git commit -m "Merge rama_origen into rama_destino"

### 6. Empuja los cambios:
Empuja los cambios a la rama de destino en el repositorio remoto:

    git push origin rama_destino

Recuerda que, en algunos casos, podría ser necesario realizar pasos adicionales dependiendo de cómo se hayan configurado y gestionado los submódulos en tu proyecto. Por ejemplo, si los submódulos han sido modificados en la rama de origen, esos cambios deben confirmarse y empujarse en esa rama antes de realizar la fusión en la rama de destino.

## Cómo eliminar submódulo

### 1. Desvincular el submódulo

    git submodule deinit -f ruta_del_submodulo

Este comando desvincula el submódulo y lo elimina de la configuración del submódulo. La opción -f fuerza la desvinculación.

### 2. Eliminar las referencias al submódulo

    git rm --cached ruta_del_submodulo

Esto elimina las referencias al submódulo del índice (staging area) pero mantiene los archivos en tu sistema de archivos.

### 3. Eliminar los archivos del submódulo

    rm -rf ruta_del_submodulo
    rm -rf .git/modules/ruta_del_submodulo

Esto elimina los archivos del submódulo de tu sistema de archivos.

### 4. Confirmar los cambios

    git commit -m "Eliminado submódulo: ruta_del_submodulo"

Este comando confirma los cambios en el repositorio principal.

### 5. Eliminar la entrada del submódulo en el archivo .gitmodules
Abre el archivo .gitmodules y elimina la entrada correspondiente al submódulo que acabas de eliminar. Este archivo se encuentra en la raíz de tu repositorio.

### 6. Confirmar la eliminación del submódulo en el repositorio principal

    git commit -m "Eliminada la configuración del submódulo: ruta_del_submodulo"

### 7. (Opcional) Empujar los cambios
Si deseas aplicar estos cambios al repositorio remoto:

    git push

## Configuraciones útiles para submódulos

Siempre muestre el registro del submódulo cuando vea diferencias:

    git config --global diff.submodule log

Muestre un breve resumen de los cambios del submódulo en su mensaje git status:

    git config --global status.submoduleSummary true

Haga que push sea predeterminado en --recurse-submodules = on-demand:

    git config --global push.recurseSubmodules on-demand

Haga que todos los comandos (excepto clone) estén predeterminados en --recurse-submodules si admiten la bandera (esto funciona para git pull desde Git 2.15):

    git config --global submodule.recurse true
    
# Extras de GIT
## Múltiples ubicaciones remotas donde el repositorio está almacenado

### 1. Verificar remotos actuales:
Puedes verificar los remotos actuales de tu repositorio usando el siguiente comando:

    git remote -v

### 2. Agregar un nuevo remote:
Para agregar un nuevo "origin" (remote), puedes hacerlo con el siguiente comando:

    git remote add <nombre-remoto> <URL-remoto>

Donde <nombre-remoto> es un nombre descriptivo que le das a este remoto (por ejemplo, "origin2") y <URL-remoto> es la URL del repositorio remoto.

Ejemplo:

    git remote add gitlab git@gitlab.com:hchumpitaz92/odoo_enterprise.git

### 3. Verificar que se agregó correctamente:

Vuelve a ejecutar el comando `git remote -v` para asegurarte de que el nuevo remoto se haya agregado correctamente.

### 4. Realizar operaciones con múltiples remotos:

#### Push a un remoto específico:
```
git push <nombre-remoto> <rama-local>
```

Ejemplo:

    git push gitlab 17.0

#### Push de todas las ramas a un remoto específico:
```
git push --set-upstream <nombre-remoto> --all
```
`--set-upstream ` (o simplemente `-u`) establece la rama remota predeterminada para la rama local actual. Esto significa que en futuros comandos `git push` y `git pull`, no necesitarás especificar la rama remota y la rama local, ya que la conexión se establecerá automáticamente.

Ejemplo:

    git push --set-upstream gitlab --all

#### Fetch desde un remoto específico:
```
git fetch <nombre-remoto>
```

Ejemplo:

    git fetch gitlab

#### Pull desde un remoto específico:
```
git pull <nombre-remoto> <rama-remota>
```

Ejemplo:

    git pull gitlab 17.0

Esto te permitirá trabajar con varios repositorios remotos simultáneamente.

Recuerda que "origin" es simplemente un nombre convencional, y puedes darle cualquier nombre a tus remotos. El término "origin" es comúnmente utilizado para referirse al repositorio principal, pero no es obligatorio.

## ¿Cómo cambiar de rama predeterminada o rama de seguimiento?

Si deseas cambiar la rama predeterminada (o la rama de seguimiento) para la rama local actual en Git, puedes utilizar el comando `git branch --set-upstream-to` o su forma abreviada `git branch -u`. Aquí hay un ejemplo de cómo hacerlo:

Supongamos que estás actualmente en la rama local "mi_rama_actual" y quieres establecer la rama remota "origin/nueva_rama_remota" como su rama de seguimiento. Puedes hacerlo de la siguiente manera:

    git branch -u origin/nueva_rama_remota

Recuerda que en Git, la rama predeterminada para el push y pull se basa en la rama de seguimiento, por lo que establecer la rama de seguimiento es útil para simplificar comandos futuros.

# Extras de Odoo
## Scaffold

Ubicarse en la raiz del proyecto y ejecutar:

Para Linux y MAC el comando:

    python odoo/odoo-bin scaffold name_module src/addons/

Para Windows el comando:

    python.exe odoo/odoo-bin scaffold name_module src/addons/

## Shell

Para acceder a la shell de Odoo en Linux o Mac:

    python odoo-bin shell -d <nombrebd> -c ./odoo.conf

Si ves “>>>”, entonces ya te encuentras en la línea de comandos de Odoo

Ejemplo de como cambiar la clave del administrador:

    >>> self.env[“res.users”].browse(2).password = "admin"
    >>> selv.env.cr.commit()

## Shell para usar IPython como REPL

IPython es un shell interactivo de Python que proporciona funciones avanzadas como autocompletado, resaltado de sintaxis, historial de comandos y más. Utilizar IPython como REPL (Read-Eval-Print Loop) en lugar del shell estándar de Python puede mejorar nuestra experiencia de programación en Odoo.

Instala IPython en tu sistema:

    pip install ipython

Ahora que IPython está instalado, ejecutar:

    odoo/odoo-bin shell -c config/odoo.conf -d <db-name> --xmlrpc-port 8888 --gevent-port 8899 --shell-interface ipython


# Errores comunes
## OSError: [Errno 24] inotify instance limit reached

    sudo nano /etc/sysctl.conf
    fs.inotify.max_user_instances = 1100000
    sudo sysctl -p

## psycopg2.InterfaceError: connection already closed

Abrir el archivo python `odoo/odoo/service/server.py`:

Comentar las lineas:
```python
select.select([pg_conn], [], [], SLEEP_INTERVAL + number)
time.sleep(number / 100)
pg_conn.poll()
```
Y agregar lo siguiente para solo mostrar un logger de error y evitar que el debug se detenga.

```python
try:
    select.select([pg_conn], [], [], SLEEP_INTERVAL + number)
    time.sleep(number / 100)
    pg_conn.poll()
except Exception as e:
    _logger.error("Error en la conexión a la base de datos: %s", e)
    pass
```

# Fuentes

- [Manejo de dependencias con Submódulos](https://training.github.com/downloads/es_ES/submodule-vs-subtree-cheat-sheet/)
- [Git-submodule](https://git-scm.com/docs/git-submodule)
- [Actualizar los submódulso git de un proyecto](https://mascandobits.es/programacion/actualizar-los-submodulos-git-de-un-proyecto/)
- [Atlassian | Submódulos de Git](https://www.atlassian.com/es/git/tutorials/git-submodule)
- [Actualización de submódulo en Git](https://www.delftstack.com/es/howto/git/submodule-update-in-git/)
- [Creando un entorno de desarrollo para Odoo 14.0 con VSCode en Ubuntu 22.04](https://blog.rafnixg.dev/creando-un-entorno-de-desarrollo-para-odoo-140-con-vscode-en-ubuntu-2204)
- [Explorando Odoo a fondo: Cómo trabajar con la shell de la CLI y configurar IPython como REPL](https://blog.rafnixg.dev/explorando-odoo-a-fondo-como-trabajar-con-la-shell-de-la-cli-y-configurar-ipython-como-repl)
- [Archivo de configuración odoo.conf](https://wiki.nuxpy.com/index.php/Archivo_de_configuraci%C3%B3n_odoo.conf)

# Contribuciones

- [Harrison Chumpitaz](mailto:hchumpitaz92@gmail.com)

```docker
version: '3.1'
services:
  web:
    image: focuz/odoo_enterprise:16.0
    depends_on:
      - db
    ports:
      - "8069:8069"
    volumes:
      - odoo-web-data:/var/lib/odoo
      - ./config:/etc/odoo
      - ./addons:/mnt/extra-addons
    environment:
      - PASSWORD_FILE=/run/secrets/postgresql_password
    secrets:
      - postgresql_password
  db:
    image: postgres:14
    environment:
      - POSTGRES_DB=postgres
      - POSTGRES_PASSWORD_FILE=/run/secrets/postgresql_password
      - POSTGRES_USER=odoo
      - PGDATA=/var/lib/postgresql/data/pgdata
    volumes:
      - odoo-db-data:/var/lib/postgresql/data/pgdata
    secrets:
      - postgresql_password
volumes:
  odoo-web-data:
  odoo-db-data:
secrets:
  postgresql_password:
    file: odoo_pg_pass
```