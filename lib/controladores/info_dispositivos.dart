import 'dart:io' show Platform;
import 'package:firebase_database/firebase_database.dart';
import 'package:device_info/device_info.dart';
import 'package:pyd_eber/all-exports.dart';
import 'package:pyd_eber/dem.dart';

//import 'AndroidDeviceInfo_2_json.dart';

class InfoDispositivo {
  DeviceInfoPlugin deviceInfo;
  AndroidDeviceInfo androidInfo;
  IosDeviceInfo iosDeviceInfo;

//  Map<String, dynamic> datos;

  guardarInfoDispositivo() async {
    if (kIsWeb) {
    } else {
      //
      DatabaseReference drDispositivo =
          FirebaseDatabase.instance.reference().child('Dispositivos');

      //
      drDispositivo.child(DEM.dispositivo.key).once().then((value) async {
        if ((value != null) && (value.value != null)) {
          // TODO: Incrementar la cantidad de veces que se conecta
          // TODO: Fecha y hora (histórico?)
          DEM.dispositivo.fechaUltimaConexion = DateTime.now();
          print(value);
        } else {
          DEM.dispositivo.fechaCreacion = DateTime.now();
          DEM.dispositivo.fechaUltimaConexion = DateTime.now();
          await drDispositivo
              .update({DEM.dispositivo.key: DEM.dispositivo.toJson()});
//          await drDispositivo.update({'datos': json.encode(DEM.dispositivo.datos)});
//          await drDispositivo.update({'conexiones': 1});
        }
      });
    }
  }

  void iniciarlizarInfoDispositivo() async {
    DEM.dispositivo.assign(null);
    deviceInfo = DeviceInfoPlugin();
    if (kIsWeb) {
      // Guardar la Dirección IP como información del dispositivo
      // TODO: https://pub.flutter-io.cn/packages/ipfinder
      //
    } else {
      if (Platform.isAndroid) {
        androidInfo = await deviceInfo.androidInfo;
        DEM.dispositivo.datos = _readAndroidBuildData(androidInfo);
        DEM.dispositivo.key = androidInfo.androidId;
        DEM.dispositivo.nombre = DEM.dispositivo.datos['id'];
        DEM.dispositivo.identificador = DEM.dispositivo.datos['androidId'];
        DEM.dispositivo.marca = DEM.dispositivo.datos['brand'];
        DEM.dispositivo.modelo = DEM.dispositivo.datos['model'];
        DEM.dispositivo.clase = DEM.dispositivo.datos['product'];
        DEM.dispositivo.tipo = Platform.operatingSystem;
        DEM.dispositivo.sistemaOperativo = DEM.dispositivo.datos['version.release'];
        DEM.dispositivo.versionSO = DEM.dispositivo.datos['baseOS'];
        DEM.dispositivo.version = DEM.dispositivo.datos['codename'];
      }
      if (Platform.isIOS) {
        iosDeviceInfo = await deviceInfo.iosInfo;
        DEM.dispositivo.datos = _readIosDeviceInfo(iosDeviceInfo);
        DEM.dispositivo.key = iosDeviceInfo.identifierForVendor;
        DEM.dispositivo.nombre = DEM.dispositivo.datos['name'];
        DEM.dispositivo.identificador = DEM.dispositivo.datos['identifierForVendor'];
        DEM.dispositivo.marca = DEM.dispositivo.datos['Apple'];
        DEM.dispositivo.modelo = DEM.dispositivo.datos['model'];
        DEM.dispositivo.clase = DEM.dispositivo.datos['localizedModel'];
        DEM.dispositivo.tipo = Platform.operatingSystem;
        DEM.dispositivo.sistemaOperativo = DEM.dispositivo.datos['systemName'];
        DEM.dispositivo.versionSO = DEM.dispositivo.datos['systemVersion'];
        DEM.dispositivo.version = DEM.dispositivo.datos['utsname.sysname'];
      }
    }
  }

// Simulador
//    iosDeviceInfo = {IosDeviceInfo}
// name = "iPhone 11"
// systemName = "iOS"
// systemVersion = "13.5"
// model = "iPhone"
// localizedModel = "iPhone"
// identifierForVendor = "774AD10A-6887-4D01-BB05-A8D03872867C"
// isPhysicalDevice = false
// utsname = {IosUtsname}
//  sysname = "Darwin"
//  nodename = "ABNERs-MacBook-Air.local"
//  release = "19.5.0"
//  version = "Darwin Kernel Version 19.5.0: Tue May 26 20:41:44 PDT 2020; root:xnu-6153.121.2~2/RELEASE_X86_64"
//  machine = "x86_64"

//  iALE:
// iosDeviceInfo = {IosDeviceInfo}
// name = "iALE"
// systemName = "iOS"
// systemVersion = "13.5"
// model = "iPhone"
// localizedModel = "iPhone"
// identifierForVendor = "E35CDD4A-AF09-4C4E-BE07-5BCCD43E45E9"
// isPhysicalDevice = true
// utsname = {IosUtsname}
//  sysname = "Darwin"
//  nodename = "iALE"
//  release = "19.5.0"
//  version = "Darwin Kernel Version 19.5.0: Tue Apr 28 22:25:26 PDT 2020; root:xnu-6153.122.1~1/RELEASE_ARM64_T8010"
//  machine = "iPhone9,3"

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }
}
