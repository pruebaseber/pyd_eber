

class DatabaseReference {
  Stream<dynamic> onValue;

  val() {
    return null;
  }
}

class FakeFirebase {
  ref(String x) {
    print('*** ===> FakeFirebase database().ref(String); ($x) ***');
  }
}

database() {
  return FakeFirebase();
}
