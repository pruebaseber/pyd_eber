import 'package:flutter_device_type/flutter_device_type.dart';

import 'all-exports.dart';
import 'estilos.dart';

class Responsive {
  // Para el comportamiento correcto del Responsive, siempre hay que hacer cálculos
  // Estándares responsive:

  // 421px to 767px width: most smartphones in landscape mode
  // 768px to 1023px: most Android tablets and iPads in portrait mode
  // 1024px to 1365px: most Android tablets and iPads in landscape mode, older desktop/laptop monitors
  // 1366px and above: iPad PRO, HDready and FullHD desktop laptop monitors

  // 420px maximum width: cover all smartphones in portrait mode
  static const bp420px = 420;
  // 421px to 767px width: most smartphones in landscape mode
  static const bp767px = 767;
  // 768px to 1023px: most Android tablets and iPads in portrait mode
  static const bp1023px = 1023;
  // 1024px to 1365px: most Android tablets and iPads in landscape mode, older desktop/laptop monitors
  static const bp1365px = 1365;
  // 1366px and above: iPad PRO, HDready and FullHD desktop laptop monitors
  static const bp1366px = 1366;

  static const xsm = 1;
  static const sm = 2;
  static const md = 3;
  static const lg = 4;
  static const xlg = 5;
  static bool hor = false;
  static bool ver = true;

  static double ancho = 100;
  static double alto = 100;

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

  // Item Datos Generales (Clientes, Usuarios, Colectoras, Despachadores, etc.)
  static int itemsDatoGeneral = 3;
  static double margenEntreItemsDatoGeneral = 10.0;
  static double radioAspectoItemGridDatoGeneral = 1.2;
  static double anchoItemDatoGeneral = (anchoContenido -
      (margenHorizontalContenido * 2) -
      (2 * itemsDatoGeneral * margenEntreItemsDatoGeneral)) /
      itemsDatoGeneral;

  static double paddingEntreCamposEdicion = 5.0;

  // Edicion Datos Generales
  static double anchoCampoEdicionDatoGeneralFull = 100;
  static double anchoCampoEdicionDatoGeneralMedio =
      anchoCampoEdicionDatoGeneralFull / 2;
  static double anchoCampoEdicionDatoGeneralTercio =
      anchoCampoEdicionDatoGeneralFull / 3;
  static double anchoCampoEdicionDatoGeneralDosTercios =
      (anchoCampoEdicionDatoGeneralFull / 3) * 2;
  static double anchoCampoEdicionDatoGeneralCuarto =
      anchoCampoEdicionDatoGeneralFull / 4;
  static double anchoCampoEdicionDatoGeneralTresCuartos =
      (anchoCampoEdicionDatoGeneralFull / 4) * 3;

  // Tarjeta (Card) para Edición, usar ancho y alto de Contenido y agregar Paddings
  static double paddingHorizontalTarjetaEdicion = 0.0;
  static double paddinVerticalTarjetaEdicion = 0.0;

  // Ancho Item Categoria, SubCategoria
  static int itemsCatSubCat = 1;
  static double radioAspectoItemCatSubCat = 1.3;
  static double anchoItemCatSubCat = (ancho * .8) / 3.05;

  // y sus márgenes
  static double margenEntreItemsCatSubCat = 10;

  // Item Productos y sus márgenes
  static int itemsProd = 1;
  static double radioAspectoItemProd = 1;
  static double anchoItemProd = (ancho * .8) / 3.05;
  static double margenEntreItemsProd = 10;

  static int itemsGrid = 3;
  static double margenEntreItemsGrid = 10;
  static double radioAspectoItemGrid = 1;

  static int itemsGridPublicidad = 2;
  static double margenEntreItemsGridPublicidad = 10;
  static double radioAspectoItemGridPublicidad = 1;

  static bool esTableta = Device.get().isTablet;

  static bool esWeb = kIsWeb;

  static double altoPublicidad = alto;
  static double anchoPublicidad = ancho;
  static double altoLogo = alto;
  static double anchoLogo = ancho;

  static double tamayoIconoGrande = 35;
  static double tamayoIconoMedio = 30;
  static double tamayoIconoChico = 25;
////////////////////////////////////////////////////////////////////////////////
////   Calcular Responsive                                                  ////
////////////////////////////////////////////////////////////////////////////////
  static calcularResponsive(BuildContext context) {
//    print('...calcularResponsive');
//    CD.iniciar(context);
    App.variables.calcular(context);
    altoOSInfo = altoOSInfo = MediaQuery.of(context).padding.top;

    hor = (MediaQuery.of(context).orientation == Orientation.landscape);
    ver = (MediaQuery.of(context).orientation == Orientation.portrait);

    ancho = MediaQuery.of(context).size.width;
    alto = MediaQuery.of(context).size.height;

    // Se incluye el Recálculo de estilo (tamaños de fuentes)
    Estilos.estiloListadosPyD = estiloListados.copyWith(fontSize: 18);
    if (ancho <= bp420px) {
      modoResponsive = 'xsm Mímimo <= $bp420px';
      modo = xsm;
      if (hor) {
        itemsDatoGeneral = 2;
        radioAspectoItemGridDatoGeneral = 1.2;
        itemsCatSubCat = 2;
        itemsProd = 2;
        itemsGridPublicidad = 2;
        radioAspectoItemGridPublicidad = 1;
        altoPublicidad = alto * .5;
        anchoPublicidad = ancho * .4;
        altoLogo = alto * .3;
        anchoLogo = alto * .3;
      } else {
        itemsDatoGeneral = 1;
        radioAspectoItemGridDatoGeneral = 1.2;
        itemsCatSubCat = 1;
        itemsProd = 1;
        itemsGridPublicidad = 1;
        radioAspectoItemGridPublicidad = 1;
        altoPublicidad = alto * .3;
        anchoPublicidad = ancho * .7;
        altoLogo = alto * .25;
        anchoLogo = alto * .25;
      }
    } else {
      if (ancho <= bp767px) {
        modoResponsive = 'sm Pequeño ${bp420px+1} a $bp767px';
        modo = sm;
        if (hor) {
          itemsDatoGeneral = 3;
          radioAspectoItemGridDatoGeneral = 1.2;
          itemsCatSubCat = 3;
          itemsProd = 2;
          itemsGridPublicidad = 2;
          radioAspectoItemGridPublicidad = 1;
          altoPublicidad = alto * .5;
          anchoPublicidad = ancho * .4;
          altoLogo = alto * .5;
          anchoLogo = ancho * .4;
        } else {
          itemsDatoGeneral = 2;
          radioAspectoItemGridDatoGeneral = 1.2;
          itemsCatSubCat = 2;
          itemsProd = 2;
          itemsGridPublicidad = 1;
          radioAspectoItemGridPublicidad = 1;
          altoPublicidad = alto * .4;
          anchoPublicidad = ancho * .5;
          altoLogo = alto * .4;
          anchoLogo = ancho * .5;
        }
      } else {
        if (ancho <= bp1023px) {
          modoResponsive = 'md Medio ${bp767px+1} a $bp1023px';
          modo = md;
          if (hor) {
            itemsDatoGeneral = 4;
            radioAspectoItemGridDatoGeneral = 1.2;
            itemsCatSubCat = 4;
            itemsProd = 3;
            itemsGridPublicidad = 3;
            radioAspectoItemGridPublicidad = 1;
            altoPublicidad = alto * .5;
            anchoPublicidad = ancho * .4;
            altoLogo = alto * .5;
            anchoLogo = ancho * .4;
          } else {
            itemsDatoGeneral = 3;
            radioAspectoItemGridDatoGeneral = 1.2;
            itemsCatSubCat = 3;
            itemsProd = 2;
            itemsGridPublicidad = 2;
            radioAspectoItemGridPublicidad = 1;
            altoPublicidad = alto * .4;
            anchoPublicidad = ancho * .5;
            altoLogo = alto * .4;
            anchoLogo = ancho * .5;
          }
        } else {
          if (ancho <= bp1365px) {
            modoResponsive = 'lg Grande ${bp1023px+1} a $bp1365px';
            modo = lg;
            if (hor) {
              itemsDatoGeneral = 4;
              radioAspectoItemGridDatoGeneral = 1.2;
              itemsCatSubCat = 4;
              itemsProd = 4;
              itemsGridPublicidad = 3;
              radioAspectoItemGridPublicidad = 1;
              altoPublicidad = alto * .5;
              anchoPublicidad = ancho * .4;
              altoLogo = alto * .5;
              anchoLogo = ancho * .4;
            } else {
              itemsDatoGeneral = 3;
              radioAspectoItemGridDatoGeneral = 1.8;
              itemsCatSubCat = 3;
              itemsProd = 3;
              itemsGridPublicidad = 2;
              radioAspectoItemGridPublicidad = 1;
              altoPublicidad = alto * .4;
              anchoPublicidad = ancho * .5;
              altoLogo = alto * .4;
              anchoLogo = ancho * .5;
            }
          } else {
            modoResponsive = 'xlg Extra-Grande $bp1366px';
            modo = xlg;
            if (hor) {
              itemsDatoGeneral = 4;
              radioAspectoItemGridDatoGeneral = 1.7;
              itemsCatSubCat = 6;
              itemsProd = 5;
              itemsGridPublicidad = 3;
              radioAspectoItemGridPublicidad = 1;
              altoPublicidad = alto * .5;
              anchoPublicidad = ancho * .4;
              altoLogo = alto * .5;
              anchoLogo = ancho * .4;
            } else {
              itemsDatoGeneral = 4;
              radioAspectoItemGridDatoGeneral = 1.2;
              itemsCatSubCat = 5;
              itemsProd = 4;
              itemsGridPublicidad = 3;
              radioAspectoItemGridPublicidad = 1;
              altoPublicidad = alto * .4;
              anchoPublicidad = ancho * .5;
              altoLogo = alto * .4;
              anchoLogo = ancho * .5;
            }
          }
        }
      }
    }

//    print('Verificación de Responsive:');
//    print('itemsDatoGeneral $itemsDatoGeneral');

    // Ajuste de variables basadas en los modos
    margenHorizontalContenido = 5;
    margenVerticalContenido = 5;

    paddingHorizontalContenido = 5;
    paddingVerticalContenido = 5;

    altoBarraEstado = 60;

    altoOndaDecorativa = 51;

    paddingHorizontalTarjetaEdicion = anchoContenido * 0.05;
    paddinVerticalTarjetaEdicion = altoContenido * 0.05;

    if (kIsWeb) {
      anchoContenido = ancho * .9;
      margenHorizontalContenido = ancho * .05;
      if (isGteLg()) {
        anchoContenido = ancho * .98;
        margenHorizontalContenido = ancho * .01;
        paddingHorizontalTarjetaEdicion = anchoContenido * 0.01;
        paddinVerticalTarjetaEdicion = altoContenido * 0.01;
      }
    } else {
      anchoContenido = ancho; // - (margenHorizontalContenido * 2);
      margenHorizontalContenido = 0;
      paddingHorizontalTarjetaEdicion = anchoContenido * 0.01;
      paddinVerticalTarjetaEdicion = altoContenido * 0.01;
    }

    altoContenido = alto - altoAppBar - altoBarraEstado - altoOSInfo;

    margenEntreItemsCatSubCat = ancho * 0.01;
    anchoItemCatSubCat =
        (anchoContenido - (margenEntreItemsCatSubCat * itemsCatSubCat * 2)) /
            itemsCatSubCat;

    margenEntreItemsProd = ancho * 0.01;
    anchoItemProd =
        (anchoContenido - (margenEntreItemsProd * itemsProd * 2)) / itemsProd;

    margenEntreItemsDatoGeneral = 10.0;
    anchoItemDatoGeneral = (anchoContenido -
        (margenHorizontalContenido * 2) -
        (2 * itemsDatoGeneral * margenEntreItemsDatoGeneral)) /
        itemsDatoGeneral;

    margenEntreItemsGridPublicidad = 10;
    anchoItemDatoGeneral = (anchoContenido -
        (margenHorizontalContenido * 2) -
        (2 * itemsGridPublicidad * margenEntreItemsGridPublicidad)) /
        itemsGridPublicidad;


    paddingEntreCamposEdicion = 10.0;

    anchoCampoEdicionDatoGeneralFull =
        anchoContenido - (paddingHorizontalTarjetaEdicion * 2) ;
//    print(ancho);
//    print(anchoCampoEdicionDatoGeneralFull);
    anchoCampoEdicionDatoGeneralMedio = (anchoCampoEdicionDatoGeneralFull - (paddingEntreCamposEdicion * 2)) / 2;
    anchoCampoEdicionDatoGeneralTercio = (anchoCampoEdicionDatoGeneralFull - (paddingEntreCamposEdicion * 2)) / 3;
    anchoCampoEdicionDatoGeneralDosTercios = ((anchoCampoEdicionDatoGeneralFull - (paddingEntreCamposEdicion * 2)) / 3) * 2;
    anchoCampoEdicionDatoGeneralCuarto = (anchoCampoEdicionDatoGeneralFull - (paddingEntreCamposEdicion * 2)) / 4;
    anchoCampoEdicionDatoGeneralTresCuartos = ((anchoCampoEdicionDatoGeneralFull - (paddingEntreCamposEdicion * 2)) / 4) * 3;

    Estilos.ajustar();
  }

  static bool isXsm() {
    return modo == xsm;
  }
  static bool isSm() {
    return modo == sm;
  }
  static bool isMd() {
    return modo == md;
  }
  static bool isLg() {
    return modo == lg;
  }
  static bool isXlg() {
    return modo == xlg;
  }

  static bool isGteXsm() {
    return modo >= xsm;
  }
  static bool isGteSm() {
    return modo >= sm;
  }
  static bool isGteMd() {
    return modo >= md;
  }
  static bool isGteLg() {
    return modo >= lg;
  }
  static bool isGteXlg() {
    return modo >= xlg;
  }

  static bool isLteXsm() {
    return modo <= xsm;
  }
  static bool isLteSm() {
    return modo <= sm;
  }
  static bool isLteMd() {
    return modo <= md;
  }
  static bool isLteLg() {
    return modo <= lg;
  }
  static bool isLteXlg() {
    return modo <= xlg;
  }
}

calcAlto(double factor, {double min, double max, List<double> minus}) {
  double ret = Responsive.alto * factor;
  if (minus != null) {
    minus.forEach((element) {
      ret = ret - element;
    });
  }
  if (min != null) if (ret < min) ret = min;
  if (max != null) if (ret > max) ret = max;
  return ret;
}

calcAncho(double factor, {double min, double max, List<double> minus}) {
  double ret = Responsive.ancho * factor;
  if (minus != null) {
    minus.forEach((element) {
      ret = ret - element;
    });
  }
  if (min != null) if (ret < min) ret = min;
  if (max != null) if (ret > max) ret = max;
  return ret;
}
