# prueba_tecnica_juan

Prueba de Desarrollo T眉L

## Corriendo Tests 馃И

Para correr todos los unit y widget test use el siguiente comando

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```
Para ver el reporte generado de cobertura, pueden usar [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

## Descarga e instalaci贸n  馃殌

Primero, clone el repositorio con el comando 'clone', o simplemente descargue el zip.

`$ git clone https://gitlab.com/palmeraMarketing/opain/app-prod/-/edit/master`

Luego, descargue Android Studio o Visual Studio Code, con sus respectivos [complementos del editor de Flutter](https://flutter.dev/docs/get-started/editor). Para obtener m谩s informaci贸n sobre el procedimiento de instalaci贸n de Flutter, [consulte la guia de consulte la guia de instalaci贸n oficial](https://flutter.dev/).

Instale las dependencias de pubspec.yaml ejecutando flutter packages get desde la ruta principal del proyecto (consulte el [uso de la documentaci贸n de los paquetes](https://flutter.dev/docs/development/packages-and-plugins/using-packages#adding-a-package-dependency-to-an-app) para obtener m谩s detalles y c贸mo hacerlo en el editor).

`$ flutter packages get`

para resolver posibles conflictos ejecute flutter clean y posteriormente flutter pub get

`$ flutter clean` 

`$ flutter pub get`

Ah铆 lo tiene, ahora puede abrir y editar el proyecto.
