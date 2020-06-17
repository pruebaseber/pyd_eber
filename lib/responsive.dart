

import 'all-exports.dart';

class Responsive {
  // Para el comportamiento correcto del Responsive, siempre hay que hacer cálculos
  // Estándares responsive:
  // 420px maximum width: cover all smartphones in portrait mode
  // 421px to 767px width: most smartphones in landscape mode
  // 768px to 1023px: most Android tablets and iPads in portrait mode
  // 1024px to 1365px: most Android tablets and iPads in landscape mode, older desktop/laptop monitors
  // 1366px and above: iPad PRO, HDready and FullHD desktop laptop monitors
  static const xsm = 1;
  static const sm = 2;
  static const md = 3;
  static const lg = 4;
  static const xlg = 5;
  static const hor = Orientation.landscape;
  static const ver = Orientation.portrait;

  static double ancho = CD.ancho;
  static double alto = CD.alto;

  static double altoOSInfo = 0;

  static double altoBarraEstado = 0;

  static double altoAppBar = kToolbarHeight;
//  static double altoInferior = 100;
  static double altoOndaDecorativa = 0;

  static double anchoContenido = ancho;
  static double altoContenido = alto - altoBarraEstado - altoOndaDecorativa;

  static double margenHorizontalContenido = 0;
  static double margenVerticalContenido = 0;

  static double paddingHorizontalContenido = 0;
  static double paddingVerticalContenido = 0;

  static String modoResponsive = 'No Calculado';
  static int modo = 5;

  // Ancho Item Categoria, SubCategoria
  static int itemsCatSubCat = 1;
  static double radioAspectoItemCatSubCat = 1.3;
  static double anchoItemCatSubCat = (ancho *.8) / 3.05;
  // y sus márgenes
  static double margenEntreItemsCatSubCat = 10;

  // Item Productos y sus márgenes
  static int itemsProd = 1;
  static double radioAspectoItemProd = 1;
  static double anchoItemProd = (ancho *.8) / 3.05;
  static double margenEntreItemsProd = 10;

  static int itemsGrid = 3;
  static double margenEntreItemsGrid = 10;
  static double radioAspectoItemGrid = 1;

  static calcularResponsive(BuildContext context) {
//    print('calcularResponsive');
    CD.iniciar(context);
    App.variables.calcular(context);
    altoOSInfo = altoOSInfo = MediaQuery.of(context).padding.top;

    ancho = CD.ancho;
    alto = CD.alto;

    if (CD.ancho <= 420) {
      modoResponsive = 'xsm Mímimo <=420';
      if (CD.orientacion == hor) {
        itemsCatSubCat = 2;
        itemsProd = 2;
      } else {
        itemsCatSubCat = 1;
        itemsProd = 1;
      }
      modo = xsm;
    } else {
      if (CD.ancho <= 767) {
        modoResponsive = 'sm Pequeño 421 a 767';
        modo = sm;
        if (CD.orientacion == hor) {
          itemsCatSubCat = 3;
          itemsProd = 2;
        } else {
          itemsCatSubCat = 2;
          itemsProd = 2;
        }
      } else {
        if (CD.ancho <= 1023) {
          modoResponsive = 'md Medio 768 a 1023';
          modo = md;
          if (CD.orientacion == hor) {
            itemsCatSubCat = 4;
            itemsProd = 3;
          } else {
            itemsCatSubCat = 3;
            itemsProd = 2;
          }
        } else {
          if (CD.ancho <= 1365) {
            modoResponsive = 'lg Grande 1024 a 1365';
            modo = lg;
            if (CD.orientacion == hor) {
              itemsCatSubCat = 4;
              itemsProd = 4;
            } else {
              itemsCatSubCat = 3;
              itemsProd = 3;
            }
          } else {
            modoResponsive = 'xlg Extra-Grande > 1365';
            modo = xlg;
            if (CD.orientacion == hor) {
              itemsCatSubCat = 6;
              itemsProd = 5;
            } else {
              itemsCatSubCat = 5;
              itemsProd = 4;
            }
          }
        }
      }
    }

    // Ajuste de variables basadas en los modos

    margenHorizontalContenido = 5;
    margenVerticalContenido = 5;

    paddingHorizontalContenido = 5;
    paddingVerticalContenido = 5;

    altoBarraEstado = 60;

    altoOndaDecorativa = 51;

    if (kIsWeb) {
      anchoContenido = (ancho *.9) - (margenHorizontalContenido * 2);

    } else {
      anchoContenido = ancho; // - (margenHorizontalContenido * 2);

    }

    altoContenido = alto - altoAppBar - altoBarraEstado - altoOSInfo;

    margenEntreItemsCatSubCat = ancho * 0.01;
    anchoItemCatSubCat = (anchoContenido - (margenEntreItemsCatSubCat * itemsCatSubCat * 2)) / itemsCatSubCat;

    margenEntreItemsProd = ancho * 0.01;
    anchoItemProd =  (anchoContenido - (margenEntreItemsProd * itemsProd * 2)) / itemsProd;

  }

}