import 'dart:io';
import 'package:pyd_eber/all-exports.dart';
import 'package:path/path.dart' as p;

internalPrint(dynamic message) {
  // print(message);
  DEM.internalLog.add('${DateTime.now().toIso8601String()} => ${message}');
}

class DEM {
  // Constantes
  static const ESPERA_SEGUNDOS_INICIO_SESION_INTERNA = 10;
  static const ESPERA_SEGUNDOS_TABLA_OCUPADA = 10;
  static String carpetaImagenesLocales = '/pyd/imagenes/';
  static String carpetaImagenesLocalesCategorias = 'categorias/';
  static String carpetaImagenesLocalesSubCategorias = 'subcategorias/';
  static String carpetaImagenesLocalesProductos = 'productos/';
  static String urlImagenesWebCategorias =
      'https://firebasestorage.googleapis.com/v0/b/la2000-pyd.appspot.com/o/imagenes_categorias%2F__NOMBRE__?alt=media';
  static String urlImagenesWebSubCategorias =
      'https://firebasestorage.googleapis.com/v0/b/la2000-pyd.appspot.com/o/imagenes_subcategorias%2F__NOMBRE__?alt=media';

//  static String urlImagenesWebProductos = 'productos/';
  static List<String> internalLog = [];
  static String uSenior = 'eberaplicaciones@gmail.com';
  static String pSenior = 'TruVenEber.2020';

  static InfoDispositivo infoDispositivo;

  static bool lSesionIniciada = false;
  static VoidCallback callBackInicioSetState = () {};
  static VoidCallback reSetStateMain = () {};

  static Navegacion navegacion = Navegacion();

  static PreferenciasInternas preferenciasInternas;
  static DatosLocales datosLocales;
  static PedidoActivo pedidoActivo;

  static bool modoBusqueda = false;

  static Directory dir;

  static String listaMensajes = '';

  static iniciar() async {
    preferenciasInternas = PreferenciasInternas();
    await preferenciasInternas.inicializar();
    datosLocales = DatosLocales();
    datosLocales.inicializar();

    carpetaImagenesLocales = '/pyd/imagenes/';
    carpetaImagenesLocalesCategorias = 'categorias/';
    carpetaImagenesLocalesSubCategorias = 'subcategorias/';
    carpetaImagenesLocalesProductos = 'productos/';
    urlImagenesWebCategorias =
        'https://firebasestorage.googleapis.com/v0/b/la2000-pyd.appspot.com/o/imagenes_categorias%2F__NOMBRE__?alt=media';
    urlImagenesWebSubCategorias =
        'https://firebasestorage.googleapis.com/v0/b/la2000-pyd.appspot.com/o/imagenes_subcategorias%2F__NOMBRE__?alt=media';
    inicializarConfiguracion();
  }

  // Mapas en Memoria para Edición de datos
  // --------------------------------------

//  Base de Datos: Delfin API    =>  142
//  ---------------------------
  // Delfin Control
  static Map mapaRegDelfinControl;
  static RegDelfinControl regDelfinControl = RegDelfinControl();
  static List<RegDelfinControl> listaDelfinControl = List<RegDelfinControl>();

  // Delfin Control Check
  static Map mapaRegDelfinControlCheck;
  static RegDelfinControlCheck regDelfinControlCheck = RegDelfinControlCheck();
  static List<RegDelfinControlCheck> listaDelfinControlCheck =
      List<RegDelfinControlCheck>();

  // Delfin Control History
  static Map mapaRegDelfinControlHistory;
  static RegDelfinControlHistory regDelfinControlHistory =
      RegDelfinControlHistory();
  static List<RegDelfinControlHistory> listaDelfinControlHistory =
      List<RegDelfinControlHistory>();

  // Claves
  static Map mapaRegClave;
  static RegClave regClave = RegClave();
  static List<RegClave> listaClave = List<RegClave>();

  // Usuarios
  static Map mapaRegUsuario;
  static RegUsuario regUsuario = RegUsuario();
  static List<RegUsuario> listaUsuario = List<RegUsuario>();

  // Categorías
  static Map mapaRegCategoria;
  static RegCategoria regCategoria = RegCategoria();
  static List<RegCategoria> listaCategoria = List<RegCategoria>();
  static Duration duracionTablaDelfinCategoria = Duration(days: 30);

  // Medios de Pago
  static Map mapaRegMedioPago;
  static RegMedioPago regMedioPago = RegMedioPago();
  static List<RegMedioPago> listaMedioPago = List<RegMedioPago>();
  static Duration duracionTablaDelfinMedioPago =
      Duration(days: 365 * 100); // 100 años???

  // Unidades de Medidas
  static Map mapaRegUnidadMedida;
  static RegUnidadMedida regUnidadMedida = RegUnidadMedida();
  static List<RegUnidadMedida> listaUnidadMedida = List<RegUnidadMedida>();

  // Sub Categorías
  static Map mapaRegSubCategoria;
  static RegSubCategoria regSubCategoria = RegSubCategoria();
  static Map<String, List<RegSubCategoria>> listaSubCategoria =
      Map<String, List<RegSubCategoria>>();
  static Duration duracionTablaDelfinSubCategoria = Duration(days: 30);

  // Productos
  static Map mapaRegProducto;
  static RegProducto regProducto = RegProducto();
  static List<RegProducto> listaProductoBusqueda = List<RegProducto>();
  static List<RegProducto> listaProductosFiltrados = List<RegProducto>();
  static Map<String, List<RegProducto>> listaProducto = {};
  static Duration duracionTablaDelfinProducto = Duration(days: 30);

  static List<CodigoImagen> listaImagenCodigoProducto = List<CodigoImagen>();

  //  Base de Datos: P & D    =>  143
//  ---------------------------
  // Dispositivos
  static Map mapaDispositivo;
  static Dispositivo dispositivo = Dispositivo();
  static List<Dispositivo> listaDispositivos = List<Dispositivo>();

  // Clientes
  static Map mapaCliente;
  static Cliente cliente = Cliente();
  static List<Cliente> listaClientes = List<Cliente>();

  // Direcciones
  static Map mapaDireccion;
  static Direccion direccion = Direccion();
  static List<Direccion> listaDirecciones = List<Direccion>();

  // Pedidos
  static Map mapaPedido;
  static Pedido pedido = Pedido();
  static List<Pedido> listaPedidos = List<Pedido>();

  // Detalles de Pedidos
  static Map mapaDetPedido;
  static DetPedido detPedido = DetPedido();
  static List<DetPedido> listaDetPedidos = List<DetPedido>();

  // Recetas
  static Map mapaReceta;
  static Receta receta = Receta();
  static List<Receta> listaRecetas = List<Receta>();

  // Ingredientes
  static Map mapaIngrediente;
  static Ingrediente ingrediente = Ingrediente();
  static List<Ingrediente> listaIngredientes = List<Ingrediente>();

  // Preparaciones
  static Map mapaPreparacion;
  static Preparacion preparacion = Preparacion();
  static List<Preparacion> listaPreparaciones = List<Preparacion>();

  // Noticias
  static Map mapaNoticia;
  static Noticia noticia = Noticia();
  static List<Noticia> listaNoticias = List<Noticia>();

  static cerrarSesionEnMemoria() {
    // Delfin Control
    mapaRegDelfinControl = null;
    // Delfin Control Check
    mapaRegDelfinControlCheck = null;
    // Delfin Control History
    mapaRegDelfinControlHistory = null;
    // Claves
    mapaRegClave = null;
    // Usuarios
    mapaRegUsuario = null;
    // Categorías
    mapaRegCategoria = null;
    // Medios de Pago
    mapaRegMedioPago = null;
    // Unidades de Medidas
    mapaRegUnidadMedida = null;
    // Sub Categorías
    mapaRegSubCategoria = null;
    // Productos
    mapaRegProducto = null;
    // Dispositivos
    mapaDispositivo = null;
    // Clientes
    mapaCliente = null;
    // Direcciones
    mapaDireccion = null;
    // Pedidos
    mapaPedido = null;
    // Detalles de Pedidos
    mapaDetPedido = null;
    // Recetas
    mapaReceta = null;
    // Ingredientes
    mapaIngrediente = null;
    // Preparaciones
    mapaPreparacion = null;
    // Noticias
    mapaNoticia = null;
  }

  static Future<void> inicializarConfiguracion() async {
    // Delfin Control
    mapaRegDelfinControl = regDelfinControl.toMap();
    // Delfin Control Check
    mapaRegDelfinControlCheck = regDelfinControlCheck.toMap();
    // Delfin Control History
    mapaRegDelfinControlHistory = regDelfinControlHistory.toMap();
    // Claves
    mapaRegClave = regClave.toMap();
    // Usuarios
    mapaRegUsuario = regUsuario.toMap();
    // Categorías
    mapaRegCategoria = regCategoria.toMap();
    // Medios de Pago
    mapaRegMedioPago = regMedioPago.toMap();
    // Unidades de Medidas
    mapaRegUnidadMedida = regUnidadMedida.toMap();
    // Sub Categorías
    mapaRegSubCategoria = regSubCategoria.toMap();
    // Productos
    mapaRegProducto = regProducto.toMap();

    // Dispositivos
    mapaDispositivo = dispositivo.toMap();
    // Clientes
    mapaCliente = cliente.toMap();
    // Direcciones
    mapaDireccion = direccion.toMap();
    // Pedidos
    mapaPedido = pedido.toMap();
    // Detalles de Pedidos
    mapaDetPedido = detPedido.toMap();
    // Recetas
    mapaReceta = receta.toMap();
    // Ingredientes
    mapaIngrediente = ingrediente.toMap();
    // Preparaciones
    mapaPreparacion = preparacion.toMap();
    // Noticias
    mapaNoticia = noticia.toMap();

    // Información del Dispositivo
    infoDispositivo = InfoDispositivo();
    infoDispositivo.iniciarlizarInfoDispositivo();

    pedidoActivo = PedidoActivo();
//    final inicio = DateTime.now();
    pedidoActivo.leerDePreferenciasLocales();
//    print('Tiempo que tarda pedidoActivo.leerDePreferenciasLocales(): ${inicio.difference(DateTime.now())}');

    if (!kIsWeb) {
      dir = await getApplicationDocumentsDirectory();
//    dir = await getTemporaryDirectory();
      String directorioRaiz = dir.path + carpetaImagenesLocales;
      String directorioNuevo = directorioRaiz +
          carpetaImagenesLocalesCategorias;
//    print(directorioNuevo);
      Directory(directorioNuevo).createSync(recursive: true);

      directorioNuevo = directorioRaiz + carpetaImagenesLocalesSubCategorias;
//    print(directorioNuevo);
      Directory(directorioNuevo).createSync(recursive: true);

      directorioNuevo = directorioRaiz + carpetaImagenesLocalesProductos;
//    print(directorioNuevo);
      Directory(directorioNuevo).createSync(recursive: true);
//    File f = File(directorioNuevo+'prueba.txt');
//    f.writeAsString('contenido');
    }

//    DataJsonZipped dataJsonZipped = DataJsonZipped();
//    print('DEM.datos antes de $datos');
//    await dataJsonZipped.checkDataZipJson(datos);
//    print('DEM.datos después de $datos');

//    ProductoFB.paraBusqueda(listaProductoBusqueda);
//    CategoriaFB.todos(listaCategoria);
//    SubCategoriaFB.todos(listaSubCategoria);
//    ProductoFB.todos(listaProducto);
  }

  static Future<void> cerrarSesion() async {
    DEM.cerrarSesionEnMemoria();
    Sesion.cerrarSesion();
  }

  static bool validarUsuario() {
    return true;
  }

  static testSearchByText(String texto) {
//    int son = 0;
//    listaProducto.forEach((e) {
//      son += 1;
//      print(son);
//    });
//    print(listaProducto.length);
    List<RegProducto> resultado = listaProductoBusqueda
        .where((producto) => producto.nombre.contains(texto))
        .toList();
    resultado.forEach((p) {
      print(p.nombre);
    });

//    final searchByText = listaProducto.where((i) {
//
//      return null;
//    }).toList();
  }

  static void ejecutarConUsuarioInterno() async {
    // Lista de Imágenes por Código de Producto
    if (listaImagenCodigoProducto.length == 0) {
      ProductoFB.imagenesProductos(listaImagenCodigoProducto);
    }
  }
}
