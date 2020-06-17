// Delfin API
// Productos

import 'package:pyd_eber/all-exports.dart';

class ProcesosBlocProducto extends ProcesosAbstractos {
  ProcesosBlocProducto(this.blocProducto);

  static const ESPERA = 160;
  final BlocProducto blocProducto;
  TablaDelfin tablaDelfinProducto;

  void inicializarProducto() async {
    internalPrint('PROCESO 0 inicializar...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Inicialización de Datos de Productos
    tablaDelfinProducto = TablaDelfin(nombre: PRODUCTO.ENTIDAD);
    DEM.listaProducto.clear();

    resultadoProceso.mensaje = 'Productos Inicializada';

    internalPrint('PROCESO 0 inicializar: ${resultadoProceso.mensaje}');
    await inicializarProceso(resultadoProceso);
    await esperar(50);
    leerPreferenciasProducto();
  }

  leerPreferenciasProducto() async {
    internalPrint('PROCESO 1 leerPreferencias...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Proceso real Leer Preferencias Producto
    bool lOk = DEM.datosLocales.leerPreferenciaLocalDeTabla(tablaDelfinProducto);

    resultadoProceso.mensaje = 'Productos leída en Preferencias ';
    if (tablaDelfinProducto.existe) {
      resultadoProceso.mensaje += 'existe';
    } else {
      resultadoProceso.mensaje += 'NO existe';
    }

    internalPrint('PROCESO 1 leerPreferencias: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);

    if (lOk) { 
      validarEdadDataProducto();
    } else {
      leerInfoDeWebProducto();
    }
  }

  validarEdadDataProducto() async {
    internalPrint('PROCESO 2 validarDatosLocales...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Proceso real Validar Datos Locales Producto
    bool lOk = DEM.datosLocales.revisarEdadDeTabla(tablaDelfinProducto, DEM.duracionTablaDelfinProducto);
    if (lOk) {
      if (tablaDelfinProducto.data != null) {
        tablaDelfinProducto.data = tablaDelfinProducto.data.replaceAll('"8":', '"CodigoProducto":');
        tablaDelfinProducto.data = tablaDelfinProducto.data.replaceAll('"1":', '"Existencia":');
        tablaDelfinProducto.data = tablaDelfinProducto.data.replaceAll('"4":', '"Nombre":');
        tablaDelfinProducto.data = tablaDelfinProducto.data.replaceAll('"0":', '"Venta1":');
        tablaDelfinProducto.data = tablaDelfinProducto.data.replaceAll('"5":', '"CodigoSubCategoria":');
      }
      lOk = DEM.datosLocales.verificarDataDeTabla(tablaDelfinProducto);
      if (lOk) {
        resultadoProceso.mensaje = 'Productos validados datos locales';
      } else {
        resultadoProceso.mensaje = '*** ERROR *** Productos datos locales NO SON VALIDOS';
        resultadoProceso.error = true;
      }
    }
    internalPrint('PROCESO 2 validarDatosLocales: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);
    if (lOk) {
      await cargarEnMemoriaProducto();
    } else {
//      await errorEnProceso(resultadoProceso);
      await borrarPreferenciasProducto();
    }
    leerInfoDeWebProducto();
  }

  cargarEnMemoriaProducto() async {
    internalPrint('PROCESO 3 cargarEnMemoria...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Proceso real Cargar en Memoria Producto
    tablaDelfinProducto.ocupado = true;
    DEM.datosLocales.cargarTablaDelfinEnMemoria(tablaDelfinProducto);
    tablaDelfinProducto.ocupado = false;

    resultadoProceso.codigo = DEM.listaProducto.length;
    resultadoProceso.mensaje = 'Productos datos cargados en memoria';
    resultadoProceso.objeto = DEM.listaProducto;

    internalPrint('PROCESO 3 cargarEnMemoria: ${resultadoProceso.mensaje}');
    await terminadoProceso(resultadoProceso);
  }

  leerInfoDeWebProducto() async {
    internalPrint('PROCESO 4 leerInfoDeWeb...');
    if (tablaDelfinProducto.ultimaLecturaInfoWeb != null) {
      internalPrint('tablaDelfinCategoria.ultimaLecturaInfo ${tablaDelfinProducto.ultimaLecturaInfoWeb.difference(DateTime.now()).inSeconds}');
      if (tablaDelfinProducto.ultimaLecturaInfoWeb.difference(DateTime.now()).inSeconds < 30) {
        internalPrint('PROCESO 4 leerInfoDeWeb Producto: NO EJECUTADO.  Ya se ejecutó hace menos de 30 segundos.');
        return;
      }
    }
    ResultadoProceso resultadoProceso = ResultadoProceso();

    if (Sesion.usuarioFb == null) {
      final maximoTiempo = DateTime.now().add(Duration(seconds: DEM.ESPERA_SEGUNDOS_INICIO_SESION_INTERNA));
      internalPrint('No se ha iniciado Sesión, no podremos ni siquiera intentar leerInfoDeWebProducto');
      internalPrint((DateTime.now().compareTo(maximoTiempo) <= 0));
      int iEspera = 0;
      while ((Sesion.usuarioFb == null) & (DateTime.now().compareTo(maximoTiempo) <= 0)) {
        // await esperar(200);
        iEspera += 1;
        resultadoProceso.mensaje = 'esperando...$iEspera Sesión NO Iniciada';
        await progresandoProceso(resultadoProceso);
        internalPrint(resultadoProceso.mensaje);
      }
      if (Sesion.usuarioFb == null) {
        internalPrint(
            'No se ha iniciado sesión interna... abortando leerInfoDeWebProducto');
        resultadoProceso.mensaje = 'Abortado leer Info de Web Producto. Sesión NO Iniciada';
        resultadoProceso.error = true;
        await errorEnProceso(resultadoProceso);
        return;
      }
    } else {
      internalPrint('Sesion.usuarioFb ${Sesion.usuarioFb.uid}');
    }

    if (tablaDelfinProducto.ocupado) {
      internalPrint('tablaDelfinProducto.ocupado, no podremos ni siquiera intentar leerInfoDeWebProducto');

      int intentos = DEM.ESPERA_SEGUNDOS_TABLA_OCUPADA * 2;   // * 2 porque esperamos 500 milisegundos
      while (tablaDelfinProducto.ocupado & (intentos > 0)) {
        await esperar(500);
        internalPrint('esperando leerInfoDeWebProducto...');
        intentos -= 1;
      }
      if (intentos == 0) {
        internalPrint(
          'SE ACABÓ EL TIEMPO DE ESPERA EN ${DEM.ESPERA_SEGUNDOS_TABLA_OCUPADA}... abortando leerInfoDeWebProducto');
        resultadoProceso.mensaje = 'Abortado Producto leer Info de Web';
        resultadoProceso.error = true;
        await errorEnProceso(resultadoProceso);
        return;
      }
    }

    //Proceso real Borrar Preferencias Producto
    DEM.datosLocales.leerDatosActualizadosEnWebDeTabla(tablaDelfinProducto, this);

    resultadoProceso.codigo = 1;
    resultadoProceso.mensaje = 'Productos leída Info de Web';

    internalPrint('PROCESO 4 leerInfoDeWeb: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);

  }

  descargarArchivoWebProducto() async {
    internalPrint('PROCESO 5 descargarArchivoWeb...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Proceso real Descargar Archivo Web Producto
    bool lOk;
    try {
      lOk = await DEM.datosLocales.descargarDatosDeWebDeTabla(tablaDelfinProducto);
      resultadoProceso.codigo = 1;
      resultadoProceso.mensaje = 'Descargados datos de Productos.';
    } catch(e) {
      // TODO: Verificar si hay internet y si hay un temporizador para volver a intentar el proceso
      resultadoProceso.mensaje = '*** ERROR *** Al intetentar descargar Archivo de Productos';
      resultadoProceso.objeto = e;
      resultadoProceso.error = true;
    }
    internalPrint('PROCESO 5 descargarArchivoWeb: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);
    if (lOk) {
      await guardarEnPreferenciasProducto();
      validarEdadDataProducto();
    }
  }

  guardarEnPreferenciasProducto() async {
    internalPrint('PROCESO 6 guardarEnPreferencias...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Proceso real Guardar En Preferenicas Producto
    bool lOk = await DEM.datosLocales.guardarLocalmenteTabla(tablaDelfinProducto);
    if (lOk) {
      resultadoProceso.codigo = 1;
      resultadoProceso.mensaje = 'Productos guardados en Preferencias';
    } else {
      resultadoProceso.mensaje = '*** ERROR *** Al intentar guardar datos de Productos en Preferencias';
      resultadoProceso.error = true;
    }
    internalPrint('PROCESO 6 guardarEnPreferencias: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);
  }

  borrarPreferenciasProducto() async {
    internalPrint('PROCESO 7 borrarPreferencias...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    //Proceso real Borrar Preferencias Producto
    DEM.datosLocales.eliminarLocalmenteTabla(tablaDelfinProducto);

    resultadoProceso.codigo = 1;
    resultadoProceso.mensaje = 'Productos borrados de Preferencias';

    internalPrint('PROCESO 7 borrarPreferencias: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);
  }

  @override
  inicializarProceso(ResultadoProceso resultadoProceso) async {
    await esperar(ESPERA);
    blocProducto.add(EventoProcesosIniciadosProducto(resultadoProceso));
  }

  @override
  progresandoProceso(ResultadoProceso resultadoProceso) async {
    await esperar(ESPERA);
    blocProducto.add(EventoProgresandoProducto(resultadoProceso));
    if (resultadoProceso.siguienteProceso == 'DESCARGAR') {
      descargarArchivoWebProducto();
    }
  }

  @override
  errorEnProceso(ResultadoProceso resultadoProceso) async {
    await esperar(ESPERA);
    blocProducto.add(EventoErroresEncontradosProducto(resultadoProceso));
  }

  @override
  terminadoProceso(ResultadoProceso resultadoProceso) async {
    await esperar(ESPERA);
    blocProducto.add(EventoProcesosTerminadosProducto(resultadoProceso));
  }

}
