

class DatabaseReference {
  Stream<dynamic> onValue;

  val() {
    return null;
  }
  push() {
    return APush();
  }
  child(String path) {

  }
}

class APush {
  String key;
}

class FakeFirebase {
  ref(String x) {
    print('*** ===> FakeFirebase database().ref(String); ($x) ***');
  }
}

database() {
  return FakeFirebase();
}
