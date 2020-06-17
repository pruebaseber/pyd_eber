import 'package:pyd_eber/all-exports.dart';

class DatosLocales {
  List<TablaDelfin> listaDatosDelfin = [];
  bool lLeidasDePreferencias = false;
  bool lExistenTodasLocalmente = false;
  bool lEdadesActualizadas = false;
  bool lDatasVerificadas = false;
  bool lGuardadasEnMemoria = false;
  bool lGuardadasLocalmente = false;
  bool lActualizadasPreferencias = false;
  bool lEliminadasLocalmente = false;
  bool lLimpiadasPreferencias = false;

  inicializar() {
    listaDatosDelfin.add(TablaDelfin(nombre: CATEGORIA.ENTIDAD));
    listaDatosDelfin.add(TablaDelfin(nombre: CLAVE.ENTIDAD));
    listaDatosDelfin.add(TablaDelfin(nombre: MEDIOPAGO.ENTIDAD));
    listaDatosDelfin.add(TablaDelfin(nombre: PRODUCTO.ENTIDAD));
    listaDatosDelfin.add(TablaDelfin(nombre: PRODUCTO.ENTIDAD + 'Busqueda'));
    listaDatosDelfin.add(TablaDelfin(nombre: SUBCATEGORIA.ENTIDAD));
    listaDatosDelfin.add(TablaDelfin(nombre: UNIDADMEDIDA.ENTIDAD));
    listaDatosDelfin.add(TablaDelfin(nombre: USUARIO.ENTIDAD));
  }

  leerDePreferenciasLocales() {
    listaDatosDelfin.forEach((tablaDelfin) {
      leerPreferenciaLocalDeTabla(tablaDelfin);
    });
    lLeidasDePreferencias = true;
  }

  bool leerPreferenciaLocalDeTabla(TablaDelfin tablaDelfin) {
    internalPrint('En leerPreferenciaLocalDeTabla');
//    internalPrint('data: ${tablaDelfin.data}');
    tablaDelfin.data = (DEM.preferenciasInternas.prefs
            .getString('data${tablaDelfin.nombre}') ??
        null);
//    internalPrint('data: ${tablaDelfin.data}');
    if (tablaDelfin.data != null) {
      tablaDelfin.fecha =
          DEM.preferenciasInternas.prefs.getString(tablaDelfin.nombre);
      tablaDelfin.existe = true;
    }
    internalPrint('fecha: ${tablaDelfin.fecha}');
    internalPrint('existe: ${tablaDelfin.existe}');
    return tablaDelfin.existe;
  }

  bool revisarQueExistenTodos() {
    lExistenTodasLocalmente = true;
    listaDatosDelfin.forEach((tablaDelfin) {
      if ((!tablaDelfin.existe) & (lExistenTodasLocalmente)) {
        lExistenTodasLocalmente = false;
      }
    });
    return lExistenTodasLocalmente;
  }

  bool revisarEdad(Duration duracion) {
    if (!lExistenTodasLocalmente) {
      lEdadesActualizadas = false;
    } else {
      lEdadesActualizadas = true;
      listaDatosDelfin.forEach((tablaDelfin) {
        if (tablaDelfin.nombre.contains(PRODUCTO.ENTIDAD)) {
          revisarEdadDeTabla(tablaDelfin, duracion);
        }
      });
    }
    return lEdadesActualizadas;
  }

  bool revisarEdadDeTabla(TablaDelfin tablaDelfin, Duration duracion) {
    var fecha = tablaDelfin.fecha.replaceFirst('_', '-');
    fecha = fecha.replaceFirst('_', '-');
    fecha = fecha.replaceFirst('_', ' ');
    fecha = fecha.replaceAll('_', ':');

    DateTime fechaData = DateTime.parse(fecha);
    DateTime ahora = DateTime.now();
    Duration edad = (ahora.difference(fechaData));
    if ((tablaDelfin.ultimaLecturaInfoWeb != null) &&
        (tablaDelfin.ultimaLecturaInfoWeb.difference(DateTime.now()).inHours <=
            1)) {
      tablaDelfin.actualizados = true;
    } else {
      if (edad > duracion) {
        internalPrint('Maxima Edad para ${tablaDelfin.nombre} $duracion');
        internalPrint('Edad actual de ${tablaDelfin.nombre} $edad');
        tablaDelfin.actualizados = false;
        lEdadesActualizadas = false;
      } else {
        tablaDelfin.actualizados = true;
      }
    }
    tablaDelfin.ocupado = false;
    return tablaDelfin.actualizados;
  }

  bool verificarDatas() {
    if (!lExistenTodasLocalmente) {
      lDatasVerificadas = false;
      return lDatasVerificadas;
    }
    lDatasVerificadas = true;
    listaDatosDelfin.forEach((tablaDelfin) {
      verificarDataDeTabla(tablaDelfin);
    });

    return lDatasVerificadas;
  }

  bool verificarDataDeTabla(TablaDelfin tablaDelfin) {
    tablaDelfin.verificado = false;
//    bool mm = true;
//    String dataReal = '';
//    List<int> listaCodigos = tablaDelfin.data.codeUnits;
//    listaCodigos.forEach((ascii) {
//      if (mm) dataReal += String.fromCharCode(ascii + 1);
//      if (!mm) dataReal += String.fromCharCode(ascii - 1);
//      mm = !mm;
//    });
    try {
      tablaDelfin.mapa = jsonDecode(tablaDelfin.data);
//      tablaDelfin.mapa = jsonDecode(dataReal);
      if ((tablaDelfin.mapa != null) & (tablaDelfin.mapa.length > 0)) {
        tablaDelfin.verificado = true;
        tablaDelfin.data = null; // Para liberar la memoria.
      } else {
        tablaDelfin.verificado = false;
        lDatasVerificadas = false;
        internalPrint(tablaDelfin.data);
        tablaDelfin.data = null; // Para liberar la memoria.
        tablaDelfin.mapa = null; // Para liberar la memoria.
      }
    } catch (e) {
      lDatasVerificadas = false;
      internalPrint(e);
    }
    return tablaDelfin.verificado;
  }

  bool guardarEnMemoria() {
    if (!lDatasVerificadas) {
      lGuardadasEnMemoria = false;
      return lGuardadasEnMemoria;
    }
    lGuardadasEnMemoria = true;
    listaDatosDelfin.forEach((tablaDelfin) async {
      bool lOkTabla = await cargarTablaDelfinEnMemoria(tablaDelfin);
      if (!lOkTabla) lGuardadasEnMemoria = false;
    });
    internalPrint('terminó guardarEnMemoria().');
    return lGuardadasEnMemoria;
  }

  cargarTablaDelfinEnMemoria(TablaDelfin tablaDelfin) async {
    switch (tablaDelfin.nombre) {
      case CATEGORIA.ENTIDAD:
        {
          DEM.datosLocales.procesarCategoria(tablaDelfin);
          internalPrint(tablaDelfin.nombre + ' cargada en Memoria.');
        }
        break;
      case CLAVE.ENTIDAD:
        {
          DEM.datosLocales.procesarClave(tablaDelfin);
          internalPrint(tablaDelfin.nombre + ' cargada en Memoria.');
        }
        break;
      case MEDIOPAGO.ENTIDAD:
        {
          DEM.datosLocales.procesarMedioPago(tablaDelfin);
          internalPrint(tablaDelfin.nombre + ' cargada en Memoria.');
        }
        break;
      case PRODUCTO.ENTIDAD:
        {
          DEM.datosLocales.procesarProducto(tablaDelfin);
          internalPrint(tablaDelfin.nombre + ' cargada en Memoria.');
        }
        break;
      case PRODUCTO.ENTIDAD + 'Busqueda':
        {
          DEM.datosLocales.procesarProductoBusqueda(tablaDelfin);
          internalPrint(tablaDelfin.nombre + ' cargada en Memoria.');
//          final inicio = DateTime.now();
          await DEM.pedidoActivo.actualizarDetalles();
          await DEM.pedidoActivo.actualizarTotalPedido();
//          print('Tiempo que tarda pedidoActivo.leerDePreferenciasLocales(): ${inicio.difference(DateTime.now())}');
        }
        break;
      case SUBCATEGORIA.ENTIDAD:
        {
          DEM.datosLocales.procesarSubCategoria(tablaDelfin);
          internalPrint(tablaDelfin.nombre + ' cargada en Memoria.');
        }
        break;
      case UNIDADMEDIDA.ENTIDAD:
        {
          DEM.datosLocales.procesarUnidadMedida(tablaDelfin);
          internalPrint(tablaDelfin.nombre + ' cargada en Memoria.');
        }
        break;
      case USUARIO.ENTIDAD:
        {
          DEM.datosLocales.procesarUsuario(tablaDelfin);
          internalPrint(tablaDelfin.nombre + ' cargada en Memoria.');
        }
        break;
    }
  }

  bool guardarLocalmente() {
    if (!lDatasVerificadas) {
      lGuardadasLocalmente = false;
      return lGuardadasLocalmente;
    }
    lGuardadasLocalmente = true;
    listaDatosDelfin.forEach((tablaDelfin) async {
      bool lOkTabla = await guardarLocalmenteTabla(tablaDelfin);
      if (!lOkTabla) lGuardadasLocalmente = false;
    });
    return lGuardadasLocalmente;
  }

  Future<bool> guardarLocalmenteTabla(TablaDelfin tablaDelfin) async {
    bool lOk = false;
    lOk = await DEM.preferenciasInternas.prefs
        .setString('data${tablaDelfin.nombre}', tablaDelfin.data);
    if (lOk) {
      lOk = await DEM.preferenciasInternas.prefs
          .setString(tablaDelfin.nombre, tablaDelfin.fecha);
    }
    return lOk;
  }

  bool eliminarLocalmente() {
    if (!lExistenTodasLocalmente) {
      lEliminadasLocalmente = false;
      return lEliminadasLocalmente;
    }
    lEliminadasLocalmente = true;
    listaDatosDelfin.forEach((tablaDelfin) async {
      bool lOkTabla = await eliminarLocalmenteTabla(tablaDelfin);
      if (!lOkTabla) lEliminadasLocalmente = false;
    });
    return lEliminadasLocalmente;
  }

  Future<bool> eliminarLocalmenteTabla(TablaDelfin tablaDelfin) async {
    bool lOk = false;
    lOk = await DEM.preferenciasInternas.prefs
        .remove('data${tablaDelfin.nombre}');
    if (lOk) {
      lOk = await DEM.preferenciasInternas.prefs.remove(tablaDelfin.nombre);
    }
    return lOk;
  }

//  bool limpiarPreferencias() {
//    if (!lLeidasDePreferencias) {
//      lLimpiadasPreferencias = false;
//    }
//  }

  procesarCategoria(TablaDelfin tablaDelfin) {
    DEM.listaCategoria.clear();
    internalPrint(
        'procesar${tablaDelfin.nombre} data a Memoria mapa: ${tablaDelfin.mapa}');
    if (tablaDelfin.mapa == null) {
      internalPrint(
          '... *** ERROR *** MAPA NULL.  Abortando la cargada en Memoria de ${tablaDelfin.nombre}');
      return;
    }
//    Map datos = json.decode(tablaDelfin.data);
    tablaDelfin.mapa.forEach((key, value) {
      RegCategoria registro = RegCategoria();
      registro.fromMap(value);
      internalPrint('registro: ${registro.nombre}');
      DEM.listaCategoria.add(registro);
    });
    tablaDelfin.ocupado = false;
  }

  procesarClave(TablaDelfin tablaDelfin) {
    DEM.listaClave.clear();
    internalPrint(
        'procesar${tablaDelfin.nombre} data a Memoria mapa: ${tablaDelfin.mapa}');
    if (tablaDelfin.mapa == null) {
      internalPrint(
          '... *** ERROR *** MAPA NULL.  Abortando la cargada en Memoria de ${tablaDelfin.nombre}');
      return;
    }
//    Map datos = json.decode(tablaDelfin.data);
    tablaDelfin.mapa.forEach((key, value) {
      RegClave registro = RegClave();
      registro.fromMap(value);
      DEM.listaClave.add(registro);
    });
    tablaDelfin.ocupado = false;
  }

  procesarMedioPago(TablaDelfin tablaDelfin) {
    DEM.listaMedioPago.clear();
    internalPrint(
        'procesar${tablaDelfin.nombre} data a Memoria mapa: ${tablaDelfin.mapa}');
    if (tablaDelfin.mapa == null) {
      internalPrint(
          '... *** ERROR *** MAPA NULL.  Abortando la cargada en Memoria de ${tablaDelfin.nombre}');
      return;
    }
//    Map datos = json.decode(tablaDelfin.data);
    tablaDelfin.mapa.forEach((key, value) {
      RegMedioPago registro = RegMedioPago();
      registro.fromMap(value);
      DEM.listaMedioPago.add(registro);
    });
    tablaDelfin.ocupado = false;
  }

  procesarProducto(TablaDelfin tablaDelfin) {
    DEM.listaProducto.clear();
    internalPrint(
        'procesar${tablaDelfin.nombre} data a Memoria mapa: ${tablaDelfin.mapa}');
    if (tablaDelfin.mapa == null) {
      internalPrint(
          '... *** ERROR *** MAPA NULL.  Abortando la cargada en Memoria de ${tablaDelfin.nombre}');
      return;
    }
//    Map datos = json.decode(tablaDelfin.data);
    tablaDelfin.mapa.forEach((key, value) {
      DEM.listaProducto.addAll({key: []});
      Map mapa = value;
      mapa.forEach((key2, value2) {
        RegProducto registro = RegProducto();
        registro.fromMap(value2);
        DEM.listaProducto[key].add(registro);
      });
    });
    tablaDelfin.ocupado = false;
  }

  procesarProductoBusqueda(TablaDelfin tablaDelfin) {
    DEM.listaProductoBusqueda.clear();
    internalPrint(
        'procesar${tablaDelfin.nombre} data a Memoria mapa: ${tablaDelfin.mapa}');
    if (tablaDelfin.mapa == null) {
      internalPrint(
          '... *** ERROR *** MAPA NULL.  Abortando la cargada en Memoria de ${tablaDelfin.nombre}');
      return;
    }
//    Map datos = json.decode(tablaDelfin.data);
    tablaDelfin.mapa.forEach((key, value) {
      RegProducto registro = RegProducto();
      registro.fromMap(value);
      DEM.listaProductoBusqueda.add(registro);
    });
    tablaDelfin.ocupado = false;
  }

  procesarSubCategoria(TablaDelfin tablaDelfin) {
    DEM.listaSubCategoria.clear();
    internalPrint(
        'procesar${tablaDelfin.nombre} data a Memoria mapa: ${tablaDelfin.mapa}');
    if (tablaDelfin.mapa == null) {
      internalPrint(
          '... *** ERROR *** MAPA NULL.  Abortando la cargada en Memoria de ${tablaDelfin.nombre}');
      return;
    }
//    Map datos = json.decode(tablaDelfin.data);
    tablaDelfin.mapa.forEach((key, value) {
      DEM.listaSubCategoria.addAll({key: []});
      Map mapa = value;
      mapa.forEach((key2, value2) {
        RegSubCategoria registro = RegSubCategoria();
        registro.fromMap(value2);
        DEM.listaSubCategoria[key].add(registro);
      });
    });
    tablaDelfin.ocupado = false;
  }

  procesarUnidadMedida(TablaDelfin tablaDelfin) {
    DEM.listaUnidadMedida.clear();
    internalPrint(
        'procesar${tablaDelfin.nombre} data a Memoria mapa: ${tablaDelfin.mapa}');
    if (tablaDelfin.mapa == null) {
      internalPrint(
          '... *** ERROR *** MAPA NULL.  Abortando la cargada en Memoria de ${tablaDelfin.nombre}');
      return;
    }
//    Map datos = json.decode(tablaDelfin.data);
    tablaDelfin.mapa.forEach((key, value) {
      RegUnidadMedida registro = RegUnidadMedida();
      registro.fromMap(value);
      DEM.listaUnidadMedida.add(registro);
    });
    tablaDelfin.ocupado = false;
  }

  procesarUsuario(TablaDelfin tablaDelfin) {
    DEM.listaUsuario.clear();
    Map datos = json.decode(tablaDelfin.data);
    datos.forEach((key, value) {
      RegUsuario registro = RegUsuario();
      registro.fromMap(value);
      DEM.listaUsuario.add(registro);
    });
    tablaDelfin.ocupado = false;
  }

  Future<bool> leerDatosActualizadosEnWeb() async {
    bool lOk = true;
    DEM.datosLocales.listaDatosDelfin.forEach((tablaDelfin) async {
//      bool lOkTabla = await leerDatosActualizadosEnWebDeTabla(tablaDelfin);
//      if (!lOkTabla) lOk = false;
    });
    return lOk;
  }

//  Future<bool> esperarPorStream(Stream<dynamic> stream) async {
//    await stream.listen((event) { }).asFuture()
//  }

  leerDatosActualizadosEnWebDeTabla(
      TablaDelfin tablaDelfin, ProcesosAbstractos proceso) {
    bool lOk = false;
    Stream<dynamic> stream = DataJsonZipped.onValue(child: tablaDelfin.nombre);
    StreamSubscription<dynamic> subscription;
    ResultadoProceso resultadoProceso = ResultadoProceso();
    subscription = stream.listen((event) {
      Map<dynamic, dynamic> _data;
      internalPrint('event recibido en el stream');
      if (kIsWeb) {
        if ((event != null) &&
            (event.snapshot != null) &&
            (event.snapshot.val() != null)) _data = event.snapshot.val();
      } else {
        if ((event != null) &&
            (event.snapshot != null) &&
            (event.snapshot.value != null)) _data = event.snapshot.value;
      }
      internalPrint('_data $_data}');
      tablaDelfin.ultimaLecturaInfoWeb = DateTime.now();
      if (_data != null) {
        lOk = true;
        if (tablaDelfin.fecha != _data['DateUploaded']) {
          tablaDelfin.fecha = _data['DateUploaded'];
          tablaDelfin.url = _data['Url'];
          tablaDelfin.descargar = true;
          resultadoProceso.codigo = 1;
          resultadoProceso.siguienteProceso = 'DESCARGAR';
          resultadoProceso.mensaje =
              'Hay datos nuevos de ${tablaDelfin.nombre}';
          proceso.progresandoProceso(resultadoProceso);
        } else {
          resultadoProceso.codigo = -1;
          resultadoProceso.mensaje =
              'NO hay datos nuevos de ${tablaDelfin.nombre}';
          proceso.terminadoProceso(resultadoProceso);
        }
      }
      internalPrint('terminado $lOk');
      subscription.cancel();
    }, onError: (error) {
      lOk = false;
      resultadoProceso.codigo = 0;
      resultadoProceso.mensaje =
          '*** ERROR *** al leer Info de ${tablaDelfin.nombre}';
      resultadoProceso.objeto = error;
      resultadoProceso.error = true;
      proceso.errorEnProceso(resultadoProceso);
      internalPrint('onError $lOk');
      subscription.cancel();
    },
//        onDone: () {
//              lOk = true;
//              subscription.cancel();
//              categoriaBloc.add(EventoCategoriaEnMemoriaCargada(resultadoProceso));
//              internalPrint('onDone $lOk');
//        },
        cancelOnError: true);
  }

//  Future<bool> leerDatosActualizadosEnWebDeTablaMalo(
//      TablaDelfin tablaDelfin) async {
//    bool lOk = false;
//    internalPrint('getLastUpdate de ${tablaDelfin.nombre}');
//    Stream<dynamic> stream = DataJsonZipped.onValue(child: tablaDelfin.nombre);
//    StreamSubscription<dynamic> subscription;
//    subscription = stream.listen((event) async { internalPrint(event); });
//    final x = await subscription.asFuture<bool>(true);
//    internalPrint('x');
//    internalPrint(x);
//    internalPrint('retornando $lOk');
//    return lOk;
//    subscription = stream.listen(
//            (event) {
//              Map<dynamic, dynamic> _data;
//              internalPrint('event recibido en el stream');
//              if (kIsWeb) {
//                if ((event != null) &&
//                    (event.snapshot != null) &&
//                    (event.snapshot.val() != null)) _data = event.snapshot.val();
//              } else {
//                if ((event != null) &&
//                    (event.snapshot != null) &&
//                    (event.snapshot.value != null)) _data = event.snapshot.value;
//              }
//              internalPrint(_data);
//              if (_data != null) {
////        internalPrint(_data);
//                lOk = true;
//                if (tablaDelfin.fecha != _data['DateUploaded']) {
//                  tablaDelfin.fecha = _data['DateUploaded'];
//                  tablaDelfin.url = _data['Url'];
//                  tablaDelfin.descargar = true;
////          getLastData(tablaDelfin);
//                }
//              }
////        subscription.();
//              internalPrint('terminado $lOk');
////      return lOk;
//            },
//        onError: (error) {
//              lOk = false;
//              subscription.cancel();
//              internalPrint('onError $lOk');
//        },
//        onDone: () {
//              lOk = true;
//              subscription.cancel();
//              internalPrint('onDone $lOk');
//        },
//        cancelOnError: true);
//    Future f1 = subscription.asFuture();
//    lOk = await Future.wait([f1]).then((value) {
//      internalPrint('Future.wait[f1]');
//      internalPrint(value);
//      return true;
//    });
//    internalPrint('lOk final');
//    internalPrint(lOk);
//    return lOk;
////    lOk = await stream.firstWhere((element) {
////      internalPrint(element);
////      internalPrint('Primer elemento recibio del stream');
////      subscription.cancel();
////      return true;
////    }, orElse: () {
////      internalPrint('NO RECIBIDO el primer elemento del stream');
////      subscription.cancel();
////      return false;
////    });
////    return lOk;
////    return lOk;  // TODO: ??? No debería porque hay una subscription pendiente.
//  }

  Future<bool> descargarDatosDeWebDeTabla(TablaDelfin tablaDelfin) async {
    bool lOk = false;
    while (tablaDelfin.descargar) {
      if (tablaDelfin.ocupado) {
        esperar(Duration(seconds: 1));
        continue;
      }
      tablaDelfin.ocupado = true;
      Map<String, Map> datos = {tablaDelfin.nombre: null};
      lOk =
          await DownloadDataZip2Json.downloadJsonZipped(tablaDelfin.url, datos);
      if (lOk) {
        tablaDelfin.descargar = false;
        if (datos[tablaDelfin.nombre] != null) {
          tablaDelfin.data = json.encode(datos[tablaDelfin.nombre]);
//        await DEM.datosLocales.cargarTablaDefinEnMemoria(tablaDelfin);
        } else {
          tablaDelfin.ocupado = false;
        }
      }
    }
    return lOk;
  }

  esperar(Duration duration) {
    return Future.delayed(duration).then((value) => null);
  }
}
