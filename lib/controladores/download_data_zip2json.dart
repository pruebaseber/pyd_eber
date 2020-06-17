import 'dart:typed_data';
import 'dart:convert' as convert;
import 'package:http/http.dart';
import 'package:archive/archive.dart';

class DownloadDataZip2Json {
  /// Download json files of data from a given url
  /// and extract "datos.key" from it
  /// and stores Map in "datos.value" respectivelly
  static Future<bool> downloadJsonZipped(
      String url, Map<String, Map> datos) async {
    bool resultado = false;
    Archive archive;
    Uint8List bytes;
    try {
      print(url);
      print('Reading Bytes...');
      bytes = await readBytes(url);
    } catch (e) {
      print('*** ERROR Reading Bytes $e');
    }
    if (bytes != null) {
      try {
        print('Zip Decoding...');
        archive = ZipDecoder().decodeBytes(bytes);
      } catch (e) {
        print('Zip Decoding $e');
      }
    }
    if (archive != null) {
      for (final file in archive) {
        final table = file.name;
        print(table);

        if (file.isFile & datos.containsKey(table)) {
          try {
            print('Json Decoding $table...');
            Map decodedFile =
                convert.jsonDecode(String.fromCharCodes(file.content));
//          List<Map> lista = [];
//          decodedFile.forEach((key, value) { lista.add(value); });
            datos[table] = decodedFile;
            print('Added to data Map $table');
            resultado = true;
          } catch (e) {
            print('Json Decoding $e');
          }
        }
      }
    }
    return resultado;
  }
}
