# Trabajo final Ruby 2017

La aplicacion provee un gestor de cursos, alumnos evaluaciones y notas para una catedra

**Aclaración: esta documentacion es válida para SO Ubuntu u otros derivados de debian, para otras distribuciones o SO podría no funcionar**

**Preparacion del ambiente:**

	* Version de ruby 2.3.3
	* Luego de hacer el git clone se debe chequar tener instalado bundler.
	* Si no se tiene instalado se ejecuta "gem install bundler" en la consola
	
Luego se debe ejecutar en consola "bundle install" estando situados dentro del directorio donde se encuentra el proyecto clonado

En este punto es muy comun instalacion de la gema "nokogiri", para solucionar esto debemos instalar nokogiri previamente (http://www.nokogiri.org/tutorials/installing_nokogiri.html).

**Base de Datos:**

Se utiliza mysql como gestor de base de datos, por lo que se lo debe tenerlo instalado, y para evitar futuros errores en la inicialización del servidor tambien es bueno instalar la gema (https://rubygems.org/gems/mysql2/versions/0.4.4)

En produccion en cambio se definió postgresql como base de datos, por lo que abrá que instalar la gema 'pg' (https://rubygems.org/gems/pg/versions/0.21.0-x64-mingw32, no se recomienda la version 1.0.0 porque suele generar problemas con la version de ruby)

Luego de que se haya ejecutado correctamente bundle install y de tener funcionando mysql podemos ejecutar sobre el directorio del proyecto "rails db:create db migrate" para crear la base de datos y las tablas correspondientes.

Si se quiere precargar la base de datos para que contenga informacion desde el inicio sin tener que cargarla a mano se puede ejecutar "rails db:seed" y asi se insertarán todos los datos definidos en el archivo seeds.rb.

**Puesta en ejecucion:**

Parados sobre el directorio del proyecto se ejecuta "rails server", eso pondrá en ejecución la aplicacion en localhost puerto 3000.
La primera vez que ponemos en funcionamiento el server puede fallar ya sea por no haber instalado mysql o tambiíen puede generar problemas la dependencia con la gema nodejs, para solucionar esto se debe instalar dicha gema.

Luego de seguir estos pasos ya se puede utilizar la aplicacion en 
http://localhost:3000
El seeds provee un usuario por defecto para utilizar la aplicacion:
	* email de usuario: prueba@ruby.com
	* password: 1234567



**Testing:**

Para ejecutar los test se ejecuta sobre el directorio del proyecto "rails test" y así correrá todos los test definidos en el proyecyo; si se quiere ejecutar algún test en particular se debe indicar como parámetro del comando la ruta hacia el archivo que contiene el test.
Ej: si se quieren correr los test del modelo Evaluation se debe ejecutar "rails test test/models/evaluation_test.rb", y asi con todos. 




