import 'dart:io';
import 'package:appres/appres.dart';
import 'package:network_to_file_image/network_to_file_image.dart';
//import 'package:path/path.dart' as p;
import 'package:pyd_eber/all-exports.dart';

NetworkToFileImage imagenLocalWeb1(
  String nombreArchivo,
  String carpetaLocal,
  String baseWeb,
) {
//  mostrar(File archivo) async {
//    bool existe = await archivo.exists();
//    print('${existe ? 'Existe' : 'NO EXISTE'} ${archivo.path}');
//  }

  File file(String filename, String auxFolder) {
    String pathName =
        DEM.dir.path + DEM.carpetaImagenesLocales + auxFolder + filename;
//    print(pathName);
    final retorno = File(pathName);
//    mostrar(retorno);
    return retorno;
  }

  return NetworkToFileImage(
    url: baseWeb.replaceAll('__NOMBRE__', nombreArchivo),
    file: file(nombreArchivo, carpetaLocal),
//    debug: true,
  );
}

ImageProvider<dynamic> imagenLocalWeb(
  String nombreArchivo,
  String carpetaLocal,
  String baseWeb,
) {
//  mostrar(File archivo) async {
//    bool existe = await archivo.exists();
//    print('${existe ? 'Existe' : 'NO EXISTE'} ${archivo.path}');
//  }

  File file(String filename, String auxFolder) {
//    print(DEM.dir.path);
//    print(DEM.carpetaImagenesLocales);
//    print(auxFolder);
//    print(filename);
    String pathName =
        DEM.dir.path + DEM.carpetaImagenesLocales + auxFolder + filename;
//    print(pathName);
    final retorno = File(pathName);
//    mostrar(retorno);
    return retorno;
  }

  if (kIsWeb) {
    return NetworkImage(baseWeb.replaceAll('__NOMBRE__', nombreArchivo));
  } else {
    return NetworkToFileImage(
      url: baseWeb == null ? '' : baseWeb.replaceAll('__NOMBRE__', nombreArchivo),
      file: file(nombreArchivo, carpetaLocal),
//    debug: true,
    );
  }
}
