# Usa como base la imagen oficial de Amazon Corretto 17 (Java 17)
# "al2022" = Amazon Linux 2022
# "headless" = versión sin componentes gráficos, ideal para servidores
FROM amazoncorretto:17.0.5-al2022-RC-headless

# Información del mantenedor o autor de la imagen
# (Esta instrucción es opcional y actualmente está en desuso)
MAINTAINER Richard Chesterwood "contact@virtualpairprogrammers.com"

# Copia el archivo .jar de tu aplicación (generado por Maven o Gradle)
# desde el directorio local 'target/' hacia el contenedor
# y lo renombra a 'webapp.jar'
ADD target/positionreceiver-0.0.1-SNAPSHOT.jar webapp.jar

# Expone el puerto 8080 para que se pueda acceder a la aplicación
# desde fuera del contenedor (ejemplo: docker run -p 8080:8080 ...)
EXPOSE 8080

# Define el comando que se ejecutará automáticamente
# cuando se inicie el contenedor: ejecuta el JAR con Java
CMD ["java", "-jar", "webapp.jar"]

