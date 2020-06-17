import 'package:device_info/device_info.dart';


Map<String, dynamic> androidDeviceInfo2Json(AndroidDeviceInfo androidInfo) {
  Map<String, dynamic> retorno = Map<String, dynamic>();

  retorno.putIfAbsent("key", () => androidInfo.androidId);
  retorno.putIfAbsent("version", () => Map<String, dynamic>());
  retorno["version"].putIfAbsent("baseOS", () => androidInfo.version.baseOS);
  retorno["version"].putIfAbsent("codename", () => androidInfo.version.codename);
  retorno["version"].putIfAbsent("incremental", () => androidInfo.version.incremental);
  retorno["version"].putIfAbsent("previewSdkInt", () => androidInfo.version.previewSdkInt);
  retorno["version"].putIfAbsent("release", () => androidInfo.version.release);
  retorno["version"].putIfAbsent("sdkInt", () => androidInfo.version.sdkInt);
  retorno["version"].putIfAbsent("securityPatch", () => androidInfo.version.securityPatch);
  retorno.putIfAbsent("board", () => androidInfo.board);
  retorno.putIfAbsent("bootloader", () => androidInfo.bootloader);
  retorno.putIfAbsent("brand", () => androidInfo.brand);
  retorno.putIfAbsent("device", () => androidInfo.device);
  retorno.putIfAbsent("display", () => androidInfo.display);
  retorno.putIfAbsent("fingerprint", () => androidInfo.fingerprint);
  retorno.putIfAbsent("hardware", () => androidInfo.hardware);
  retorno.putIfAbsent("host", () => androidInfo.host);
  retorno.putIfAbsent("id", () => androidInfo.id);
  retorno.putIfAbsent("manufacturer", () => androidInfo.manufacturer);
  retorno.putIfAbsent("model", () => androidInfo.model);
  retorno.putIfAbsent("product", () => androidInfo.product);
  retorno.putIfAbsent("supported32BitAbis", () => []);
  androidInfo.supported32BitAbis.forEach((element) {
    retorno["supported32BitAbis"].add(element);
  });  retorno.putIfAbsent("supported64BitAbis", () => []);
  androidInfo.supported64BitAbis.forEach((element) {
    retorno["supported64BitAbis"].add(element);
  });  retorno.putIfAbsent("supportedAbis", () => []);
  androidInfo.supportedAbis.forEach((element) {
    retorno["supportedAbis"].add(element);
  });  retorno.putIfAbsent("tags", () => androidInfo.tags);
  retorno.putIfAbsent("type", () => androidInfo.type);
  retorno.putIfAbsent("isPhysicalDevice", () => androidInfo.isPhysicalDevice);
  retorno.putIfAbsent("androidId", () => androidInfo.androidId);
  retorno.putIfAbsent("systemFeatures", () => []);
  androidInfo.systemFeatures.forEach((element) {
    retorno["systemFeatures"].add(element);
  });
  return retorno;
}
