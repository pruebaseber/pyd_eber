import 'package:pyd_eber/all-exports.dart';

class UISelectorImagenes extends StatefulWidget {
  @override
  _UISelectorImagenesState createState() => _UISelectorImagenesState();
}

class _UISelectorImagenesState extends State<UISelectorImagenes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIAppBar(context, text: 'Selector de Imágenes'),
    );
  }
}
