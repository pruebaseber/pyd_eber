import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


List dataWebMobile(BuildContext context, AsyncSnapshot snap) {
  List items;
  if (snap.hasData && !snap.hasError && snap.data.snapshot != null) {
    items = [];

    List item;
    Map data;

    if (kIsWeb) {
      if (snap.data.snapshot.val() is List) {
        item = snap.data.snapshot.val();
      } else {
        data = snap.data.snapshot.val();
      }
    } else {
      if (snap.data.snapshot.value is List) {
        item = snap.data.snapshot.value;
      } else {
        data = snap.data.snapshot.value;
      }
    }

    if (item != null) {
      item.forEach((element) {
        if (element != null) {
          items.add(element);
        }
      });
      item = null;
    }

    if (data != null) {
      data.forEach((index, data) =>
          items.add({"key": index, ...data}));
    }
  }
  return items;
}