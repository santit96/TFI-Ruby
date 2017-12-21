#Trabajo final Ruby 2017
La aplicacion provee un gestor de cursos, alumnos evaluaciones y notas para una catedra

**Aclaración: esta documentacion es válida para SO Ubuntu u otros derivados de debian, para otras distribuciones o SO podría no funcionar**

##Preparacion del ambiente:

	.Luego de hacer el git clone se debe chequar tener instalado bundler.
	.Si no se tiene instalado se ejecuta "gem install bundler" en la consola
	
	Luego se debe ejecutar en consola "bundle install" estando situados dentro del directorio donde se encuentra el proyecto clonado

	En este punto es muy comun instalacion de la gema "nokogiri", para solucionar esto debemos instalar nokogiri previamente (http://www.nokogiri.org/tutorials/installing_nokogiri.html).

##**Base de Datos:**

	Se utiliza sqlite3 como gestor de base de datos, por lo que se lo debe tenerlo instalado (se puede instalar desde consola con apt-get install sqlite3), y para evitar futuros errores en la inicialización del servidor tambien es bueno instalar la gema (https://rubygems.org/gems/sqlite3/versions/1.3.11?locale=es)

	Luego de que se haya ejecutado correctamente bundle install y de tener funcionando sqlite podemos ejecutar sobre el directorio del proyecto "rails db:create db migrate" para crear la base de datos y las tablas correspondientes.

	Si se quiere precargar la base de datos para que contenga informacion desde el inicio sin tener que cargarla a mano se puede ejecutar "rails db:seed" y asi se insertarán todos los datos definidos en el archivo seeds.rb.

##Puesta en ejecucion:

	Parados sobre el directorio del proyecto se ejecuta "rails server", eso pondrá en ejecución la aplicacion en localhost puerto 3000.
	La primera vez que ponemos en funcionamiento el server puede fallar ya sea por no haber instalado sqlite3 o tambiíen puede generar problemas la dependencia con la gema nodejs, para solucionar esto se debe instalar dicha gema,

	Luego de seguir estos pasos (se supone) ya se puede utilizar la aplicacion en 
	http://localhost:3000

##Testing:
	
	Para ejecutar los test se ejecuta sobre el directorio del proyecto "rails test test/models/modeloATestear_test.rb "
	Los test de los controllers fallan por el problema con la gema **devise**, que el grupo de desarrollo del proyecto no pudo solucionar.
	A su vez la primera vez que se quieran ejecutar los test para que cree la dase de datos correspondiente se debe descomentar la linea "require 'test_helper' de los test que se encuentran en test/models/ , luego volverla a comentar sino los tests producirán un error (cuando se descomenta la linea y se ejecutan los test estos generarán un error, pero luego al volver a comentar la linea ya se ejecutarán bien).
	Perdon por la inutilidad del equipo de desarrollo en este aspecto, ya despedimos a un par de pasantes responsables de esto.



