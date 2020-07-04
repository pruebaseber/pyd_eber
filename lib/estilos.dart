import 'all-exports.dart';

class Estilos {
  static TextStyle estiloListadosPyD = TextStyle(
    fontFamily: AppRes.appResMap[Co.FONT_1R],
    fontStyle: FontStyle.normal,
    fontSize: 10.0,
    color: AppRes.appResMap[Co.COLOR_ITEM_LISTA],
    fontWeight: FontWeight.normal,
    letterSpacing: 2.0,
    wordSpacing: 4.0,
  );

  static TextStyle estiloProducto =
  TextStyle(color: Colors.black, fontFamily: 'Express', letterSpacing: 1.3);

  static TextStyle estiloProductoBusqueda =
  TextStyle(color: Colors.black, letterSpacing: 1.3);

  static ajustar() {
    estiloListadosPyD = TextStyle(
      fontFamily: AppRes.appResMap[Co.FONT_1R],
      fontStyle: FontStyle.normal,
      fontSize: 16.0,
      color: AppRes.appResMap[Co.COLOR_ITEM_LISTA],
      fontWeight: FontWeight.normal,
      letterSpacing: 2.0,
      wordSpacing: 4.0,
    );

    estiloProducto =
        TextStyle(color: Colors.black, fontFamily: 'Express', letterSpacing: 1.3);

    estiloProductoBusqueda =
        TextStyle(color: Colors.black, letterSpacing: 1.3);
  }
}
