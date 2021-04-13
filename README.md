# ALEXFLIX
En el repository podemos ver, los tres proyectos realizados para fundamentar este proyecto.
ALEXFLIX: Proyecto final, donde podemos ver las peliculas correspondientes.
ApiAlexflix: Api con la que trabaja el proyecto para la obtención y modificación de datos.
NuGetAlexflixModels: NuGet de los modelos con los que trabaja mi proyecto.

## SCRIPT
Ejecutar en  SQL Manager Studio, realizado esto debe añadir la cadena de conexión de dicha BaseDatos a appsettings.json

## ENVIO DE CORREOS
Esta version esta oculto el correo usado para ello, tan solo debe ir a appsettings.json y poner un correo corporativo, por ejemplo OFFICE365, para poder obtener la funcionalidad de envio de correos y a su vez restauracion de contraseñas.

## INFORMACION USARIOS:
Los usuarios debido a la seguridad no se puede migrar los salt y password facilmente, al generar al scrip, no autogenera mal y no corresponde al salt correcto para login.

Dicho esto, usted mismo puede hacer la configuración de usuario, solo debe registrarse con un usuario, digamos que le llamamos admin y le ponemos una password. Para que dicho usuario pueda obtener permisos de administración debe cambiar en la base de datos (Users) el campo Rol y ponerle 'ADMIN'.

Con esta pequeña configuración podra utilizar este usuario como administrador.

Además de esto, usted puede crear tantos clientes como quiera, tan solo registrandose en la página.

## ENCRIPTACION:
Se usa un salt, recogido en la base de datos del usuario y cifrado SHA256
Cada usuario se genera un salt nuevo y se cifra la password que es recogida,
en la bbdd

## RECURSOS
Las imagenes y videos, se usan por Blob Storage. Esta aplicación tiene la funcionalidad añadida con el Emulador. Debemos arrancarlo crear un container llamado 'alexflix' y poner todo el interior de dicha carpeta en el nuevo container.

## Pelicula Prueba
He dejado una pelicula, con sus datos, foto y video. Para realizar la prueba de creaccion de Peliculas.

