// Proyecto: Delfin API
// Version: 1.0.0
// Autor: Alse Developers
// Unidad: app-variables.dart
// Variables de la Aplicación

import 'all-exports.dart';


class App {
  static final AppVariables variables = AppVariables();
  static final String ESTILO_ITEM_TITULO = 'estiloItemTitulo';
  static final String ESTILO_ITEM_DATO = 'estiloItemTitulo';
}

class AppVariables {

  calcular(BuildContext context) {

    if (!CD.iniciado) CD.iniciar(context);

    // TODO: Que se pudiera configurar todo desde base de datos

    AppRes.appResMap[Co.APP_NAME] = 'DelfinAPI';
    AppRes.appResMap[Co.APP_DENOM] = 'Delfin API';
    AppRes.appResMap[Co.LOGO_P] = 'assets/images/logo_la_2000.jpg';
    AppRes.appResMap[Co.LOGO_M] = 'assets/images/logo_la_2000.jpg';
    AppRes.appResMap[Co.LOGO_G] = 'assets/images/logo_la_2000.png';

    AppRes.appResMap[Co.BACKGROUND_1] =  'assets/images/fondo.jpg';
    AppRes.appResMap[Co.BACKGROUND_2] =  'assets/images/fondo.jpg';
    AppRes.appResMap[Co.BACKGROUND_3] =  'assets/images/fondo.jpg';
    AppRes.appResMap[Co.BACKGROUND_ADMIN] =  'assets/images/fondo.jpg';
    AppRes.appResMap[Co.BACKGROUND_LOGIN] =  'assets/images/fondo.png';

    AppRes.appResMap[Co.FONT_1L] = 'Express';
    AppRes.appResMap[Co.FONT_1R] = 'Express';
    AppRes.appResMap[Co.FONT_1M] = 'Express';
    AppRes.appResMap[Co.FONT_1B] = 'Express';

    AppRes.appResMap[Co.FONT_2L] = 'Swiss721';
    AppRes.appResMap[Co.FONT_2R] = 'Swiss721';
    AppRes.appResMap[Co.FONT_2M] = 'Swiss721';
    AppRes.appResMap[Co.FONT_2B] = 'Swiss721';

    AppRes.appResMap[Co.FONT_3L] = 'Porkys';
    AppRes.appResMap[Co.FONT_3R] = 'Porkys';
    AppRes.appResMap[Co.FONT_3M] = 'Porkys';
    AppRes.appResMap[Co.FONT_3B] = 'Porkys';

    AppRes.appResMap[Co.FONT_3L] = 'Angelina';
    AppRes.appResMap[Co.FONT_3R] = 'Angelina';
    AppRes.appResMap[Co.FONT_3M] = 'Angelina';
    AppRes.appResMap[Co.FONT_3B] = 'Angelina';

    AppRes.appResMap[Co.LISTA_ALTO_ENCABEZADO] = 0.0;
    AppRes.appResMap[Co.LISTA_ESPACIO_ENTRE_COLUMNAS] = 5.0;
    AppRes.appResMap[Co.LISTA_ALTO_FILA] = 25.0;
    AppRes.appResMap[Co.LISTA_ALTO_TITULOS] = 25.0;
    AppRes.appResMap[Co.LISTA_FACTOR_ALTO_TOTAL] = .65;
    AppRes.appResMap[Co.LISTA_FACTOR_ANCHO_TOTAL] = .65;
    AppRes.appResMap[Co.LISTA_ALTO_PIE_PAGINACION] = 56;


    final blanco = Colors.white;
    final negro = Colors.black;
    final verdeOscuro = Color(0xFF153543);
    final verdeClaro = Color(0xFF4FAB94);
    final rojo = Color(0xFFD73F35);
    final grisClaro = Color(0xFFAEBAC1);
    final grisOscuro = Color(0xFF65777C);

    // Colores del tema Pulido y Acogedor de la paleta de colores

//    final tiza = Color(0xFFEFE9D7); // verdeClaro
//    final ceniza = Color(0xFFD5C3AA); // cambié por verdeOscuro
//    final gris = Color(0xFF867666); // cambié por grisOscuro
//    final mostaza = Color(0xFFE1B80D); // cambié por grisClaro

    final tiza = Color(0xFFEFE9D7);
    final azulPastel = Color(0xFF4D7DB7);
    final violeta = Color(0xFF8E44B3);
    final azulMarino = Color(0xFF2C3FA7);

    AppRes.appResMap[Co.COLOR_1] = blanco;
    AppRes.appResMap[Co.FONDO_1] = tiza;

    AppRes.appResMap[Co.COLOR_2] = violeta;
    AppRes.appResMap[Co.FONDO_2] = azulPastel;

    AppRes.appResMap[Co.COLOR_3] = rojo;
    AppRes.appResMap[Co.FONDO_3] = Colors.transparent;

    AppRes.appResMap[Co.COLOR_4] = azulPastel;
    AppRes.appResMap[Co.FONDO_4] = tiza;

    AppRes.appResMap[Co.COLOR_5] = blanco;
    AppRes.appResMap[Co.FONDO_5] = azulPastel;

    AppRes.appResMap[Co.COLOR_6] = azulMarino;
    AppRes.appResMap[Co.FONDO_6] = violeta;

    AppRes.appResMap[Co.COLOR_PRINCIPAL] = AppRes.appResMap[Co.COLOR_6];

    AppRes.appResMap[Co.COLOR_ITEM_LISTA] = blanco;
    AppRes.appResMap[Co.COLOR_FONDO_ITEM_LISTA] = tiza;

    AppRes.appResMap[Co.COLOR_TITULO_LISTA] = rojo;
    AppRes.appResMap[Co.COLOR_FONDO_TITULO_LISTA] = azulMarino;

    AppRes.appResMap[Co.COLOR_TITULO_EDICION] = rojo;
    AppRes.appResMap[Co.COLOR_FONDO_TITULO_EDICION] = blanco;

//    AppRes.appResMap[Co.FONDO_7] = ;
//    AppRes.appResMap[Co.FONDO_8] = grisClaro;
//    AppRes.appResMap[Co.FONDO_9] = grisClaro;
//    AppRes.appResMap[Co.FONDO_10] = grisClaro;

    // Login/Authentication providers
    AppRes.appResMap[Co.LOGIN_EMAIL] = true;
    AppRes.appResMap[Co.LOGIN_GOOGLE] = true;
    AppRes.appResMap[Co.LOGIN_FACEBOOK] = true;
    AppRes.appResMap[Co.LOGIN_TWITTER] = true;

    AppRes.appResMap[Co.TAMAYO_ICONOS_LOGIN] = 35;

    AppRes.appResMap[Co.ALTO_EDICION] = 40.0;

    AppRes.appResMap[Co.ESTILO_ITEM_TITULO] = TextStyle(
      fontFamily: AppRes.appResMap[Co.FONT_1B],
      fontSize: 30.0,
      color: AppRes.appResMap[Co.COLOR_1],
      letterSpacing: 2.0,
    );
    AppRes.appResMap[Co.ESTILO_ITEM_DATO] = TextStyle(
      fontFamily: AppRes.appResMap[Co.FONT_1R],
      fontSize: 15.0,
      color: AppRes.appResMap[Co.COLOR_1],
    );

    // Botones en General, lo que incluye Guardar y Borrar
    AppRes.appResMap[Co.ALTO_BOTONES] = 35.0;
    AppRes.appResMap[Co.ANCHO_BOTONES] = 120.0;
    AppRes.appResMap[Co.MARGENES_BOTONES] = 10.0;
    AppRes.appResMap[Co.COLOR_TEXTO_BOTON_PRINCIPAL] =
    AppRes.appResMap[Co.COLOR_5];
    AppRes.appResMap[Co.COLOR_FONDO_BOTON_PRINCIPAL] =
    AppRes.appResMap[Co.FONDO_2];

    // Textos bases cuando faltan datos y otros mensajes sencillos
    AppRes.appResMap[Co.VALOR_FORANEO_NO_DEFINIDO] = '<No Definido>';

    AppRes.appResMap[Co.COLOR_FONDO_TEXTO_EDICION] = blanco;

    ///Decoración de Container con bordes semidelgados redondeados en caja rectangular
    AppRes.appResMap[Co.DECORACION_CONTENEDOR_EDICION] = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(width: 3, color: AppRes.appResMap[Co.FONDO_1]),
      color: AppRes.appResMap[Co.COLOR_FONDO_TEXTO_EDICION],
    );



    AppRes.appResMap[Co.TAMAYO_FUENTE_ETIQUETA] = 20.0;
    AppRes.appResMap[Co.COLOR_ETIQUETA_EDICION] = negro;

    /// Estilo de Etiquetas de Formularios
    /// Cambiamos el fondo y el color de las letras y la etiqueta que van sobre
    /// el componente
    AppRes.appResMap[Co.ESTILO_ETIQUETA] = TextStyle(
      fontFamily: AppRes.appResMap[Co.FONT_4R],
      fontSize: AppRes.appResMap[Co.TAMAYO_FUENTE_ETIQUETA],
      color: AppRes.appResMap[Co.COLOR_ETIQUETA_EDICION],
      letterSpacing: 2.0,
      backgroundColor: Colors.transparent,
//      fontWeight: FontWeight.bold,
    );

    AppRes.appResMap[Co.ESTILO_ETIQUETA_CATEGORIAS] = TextStyle(
      color: AppRes.appResMap[Co.COLOR_ETIQUETA_EDICION],
      //fontFamily: 'Angelina',
      fontWeight: FontWeight.bold,
      fontFamily: AppRes.appResMap[Co.FONT_1R],
    );

    AppRes.appResMap[Co.ESTILO_TITULO] = TextStyle(
      fontFamily: AppRes.appResMap[Co.FONT_4R],
      color: AppRes.appResMap[Co.COLOR_TITULO_EDICION],
      fontSize: 22.0,
      letterSpacing: 2.0,
      fontWeight: FontWeight.bold,
    );

    AppRes.appResMap[Co.TAMAYO_TEXTO_BOTON_PRINCIPAL] = 30.0;

    AppRes.appResMap[Co.ESTILO_TEXTO_BOTON_PRINCIPAL] = TextStyle(
      fontFamily: AppRes.appResMap[Co.FONT_1R],
      color: AppRes.appResMap[Co.COLOR_TEXTO_BOTON_PRINCIPAL],
      fontSize: AppRes.appResMap[Co.TAMAYO_TEXTO_BOTON_PRINCIPAL],
      fontWeight: FontWeight.bold,
    );

    AppRes.appResMap[Co.ESTILO_BOTON] = TextStyle(
      fontFamily: AppRes.appResMap[Co.FONT_4R],
//color: AppRes.appResMap[Co.COLOR_TEXTO_BOTON_PRINCIPAL],
      color: AppRes.appResMap[Co.COLOR_TEXTO_BOTON_PRINCIPAL],
      fontSize: 18, // AppRes.appResMap[Co.TAMAYO_TEXTO_BOTON_PRINCIPAL],
//              fontWeight: FontWeight.bold,
    );

    // App Color de Fondo
    AppRes.appResMap[Co.COLOR_FONDO_APP] = verdeClaro;
    AppRes.appResMap[Co.COLOR_FONDO_APP_BAR] = verdeOscuro;
    AppRes.appResMap[Co.COLOR_APP_BAR] = blanco;

    // Lista de Seleccion
    AppRes.appResMap[Co.COLOR_FONDO_OPCION_SELECCION] = verdeClaro;
    AppRes.appResMap[Co.COLOR_OPCION_SELECCION] = verdeOscuro;

    // Logo
    AppRes.appResMap[Co.ALTO_LOGO] = CD.minimo / 4;
    AppRes.appResMap[Co.ANCHO_LOGO] = CD.minimo / 4;

    // Cuadros de Dialogo
    AppRes.appResMap[Co.FONDO_CUADROS_DE_DIALOGO] = AppRes.appResMap[Co.FONDO_1];

    AppRes.appResMap[Co.APP_LOCALE] = 'es_CO';

//    AppRes.appResMap[Co.USUARIOS_PRUEBAS] = null;
    AppRes.appResMap[Co.USUARIOS_PRUEBAS] = [
      // Usuarios para Pruebas
      Authentication(
          name: 'Senior Apps',
          email: DEM.uSenior,
          password: DEM.pSenior,
          passwordConfirm: DEM.pSenior,
          savePassword: false,
          saveUser: false),
      Authentication(name: 'Pruebas Uno',
          email: 'pruebas.appuno1@gmail.com',
          password: 'password',
          passwordConfirm: 'password',
          savePassword: false,
          saveUser: false),
      Authentication(name: 'Abner Hernández',
          email: 'abnerh69@gmail.com',
          password: 'hernandez',
          passwordConfirm: 'hernandez',
          savePassword: false,
          saveUser: false),
      Authentication(name: 'Nombre Usuario',
          email: 'abnershr@gmail.com',
          password: 'hernandez',
          passwordConfirm: 'hernandez',
          savePassword: false,
          saveUser: false),
      Authentication(name: 'Pruebas Uno',
          email: 'pruebas.appuno1@gmail.com',
          password: '12345678',
          passwordConfirm: '12345678',
          verifyEmail: false,
          verifyAuthorization: false,
          savePassword: false,
          saveUser: false),
      Authentication(name: 'Pruebas Dos',
          email: 'pruebas.appdos2@gmail.com',
          password: 'password',
          passwordConfirm: 'password',
          savePassword: false,
          saveUser: false),
    ];

  }
}
//color: AppRes.appResMap[Co.DECORACION_BOTON_PRINCIPAL] != null ? null : funcion == null ? Colors.grey : AppRes.appResMap[Co.COLOR_FONDO_BOTON_PRINCIPAL],
//decoration: AppRes.appResMap[Co.DECORACION_BOTON_PRINCIPAL],
