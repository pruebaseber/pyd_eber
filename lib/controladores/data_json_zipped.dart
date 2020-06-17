import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:pyd_eber/data_web_mobile/firebase.dart'
if (dart.library.html) 'package:firebase/firebase.dart' as fb_web;
import 'package:pyd_eber/all-exports.dart';

import 'download_data_zip2json.dart';


class DataJsonZipped {

  String lastUpdated = '';
  static DatabaseReference drDataJsonZipped = FirebaseDatabase.instance.reference().child('DataJsonZipped/la2000');

  static fb_web.DatabaseReference drDataJsonZippedWeb = fb_web.database().ref('DataJsonZipped/la2000');

  static Stream<dynamic> onValue({String child = ''}) {
    if (child != '') {
      if (kIsWeb) {
        return fb_web.database().ref('DataJsonZipped/la2000/$child').onValue;
      } else {
        return drDataJsonZipped.child(child).onValue;
      }
    }
    if (kIsWeb) {
      return drDataJsonZippedWeb.onValue;
    } else {
      return drDataJsonZipped.onValue;
    }
  }

  checkDataZipJson(Map<String, Map> data) async {
    Stream<dynamic> stream = onValue();

    stream.listen((event) async {
      Map<dynamic, dynamic> _data;
      if (kIsWeb) {
        if ((event != null) &&
            (event.snapshot != null) &&
            (event.snapshot.val() != null)) _data = event.snapshot.val();
      } else {
        if ((event != null) &&
            (event.snapshot != null) &&
            (event.snapshot.value != null)) _data = event.snapshot.value;
      }
      if (_data != null) {
        String url = _data['Url'];
        String dateUploaded = _data['DateUploaded'];
        String fileNames = _data['FileNames'];
        if (lastUpdated != dateUploaded) {
          final datas = fileNames.split(',');
          datas.forEach((name) {
            name = name.trim();
            if (name != '') data.addAll({name: {}});
          });
          bool ok = await DownloadDataZip2Json.downloadJsonZipped(url, data);
          print('checkDataZipJson & downloadJsonZipped $ok');
        }
      }
    });

  }

}