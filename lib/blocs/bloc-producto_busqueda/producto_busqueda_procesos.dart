// Delfin API
// ProductoBusquedas

import 'package:pyd_eber/all-exports.dart';

class ProcesosBlocProductoBusqueda extends ProcesosAbstractos {
  ProcesosBlocProductoBusqueda(this.blocProductoBusqueda);

  static const ESPERA = 160;
  final BlocProductoBusqueda blocProductoBusqueda;
  TablaDelfin tablaDelfinProductoBusqueda;

  void inicializarProductoBusqueda() async {
    internalPrint('PROCESO 0 inicializar...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Inicialización de Datos de ProductoBusquedas
    tablaDelfinProductoBusqueda = TablaDelfin(nombre: PRODUCTO.ENTIDAD + 'Busqueda');
    DEM.listaProductoBusqueda.clear();

    resultadoProceso.mensaje = 'ProductoBusquedas Inicializada';

    internalPrint('PROCESO 0 inicializar: ${resultadoProceso.mensaje}');
    await inicializarProceso(resultadoProceso);
    await esperar(50);
    leerPreferenciasProductoBusqueda();
  }

  leerPreferenciasProductoBusqueda() async {
    internalPrint('PROCESO 1 leerPreferencias...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Proceso real Leer Preferencias ProductoBusqueda
    bool lOk = DEM.datosLocales.leerPreferenciaLocalDeTabla(tablaDelfinProductoBusqueda);

    resultadoProceso.mensaje = 'ProductoBusquedas leída en Preferencias ';
    if (tablaDelfinProductoBusqueda.existe) {
      resultadoProceso.mensaje += 'existe';
    } else {
      resultadoProceso.mensaje += 'NO existe';
    }

    internalPrint('PROCESO 1 leerPreferencias: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);

    if (lOk) { 
      validarEdadDataProductoBusqueda();
    } else {
      leerInfoDeWebProductoBusqueda();
    }
  }

  validarEdadDataProductoBusqueda() async {
    internalPrint('PROCESO 2 validarDatosLocales...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Proceso real Validar Datos Locales ProductoBusqueda
    bool lOk = DEM.datosLocales.revisarEdadDeTabla(tablaDelfinProductoBusqueda, DEM.duracionTablaDelfinProducto);
    if (lOk) {
      if (tablaDelfinProductoBusqueda.data != null) {
        tablaDelfinProductoBusqueda.data = tablaDelfinProductoBusqueda.data.replaceAll('"8":', '"CodigoProducto":');
        tablaDelfinProductoBusqueda.data = tablaDelfinProductoBusqueda.data.replaceAll('"1":', '"Existencia":');
        tablaDelfinProductoBusqueda.data = tablaDelfinProductoBusqueda.data.replaceAll('"4":', '"Nombre":');
        tablaDelfinProductoBusqueda.data = tablaDelfinProductoBusqueda.data.replaceAll('"0":', '"Venta1":');
        tablaDelfinProductoBusqueda.data = tablaDelfinProductoBusqueda.data.replaceAll('"5":', '"CodigoSubCategoria":');
      }
      lOk = DEM.datosLocales.verificarDataDeTabla(tablaDelfinProductoBusqueda);
      if (lOk) {
        resultadoProceso.mensaje = 'ProductoBusquedas validados datos locales';
      } else {
        resultadoProceso.mensaje = '*** ERROR *** ProductoBusquedas datos locales NO SON VALIDOS';
        resultadoProceso.error = true;
      }
    }
    internalPrint('PROCESO 2 validarDatosLocales: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);
    if (lOk) {
      await cargarEnMemoriaProductoBusqueda();
    } else {
//      await errorEnProceso(resultadoProceso);
      await borrarPreferenciasProductoBusqueda();
    }
    leerInfoDeWebProductoBusqueda();
  }

  cargarEnMemoriaProductoBusqueda() async {
    internalPrint('PROCESO 3 cargarEnMemoria...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Proceso real Cargar en Memoria ProductoBusqueda
    tablaDelfinProductoBusqueda.ocupado = true;
    DEM.datosLocales.cargarTablaDelfinEnMemoria(tablaDelfinProductoBusqueda);
    tablaDelfinProductoBusqueda.ocupado = false;

    resultadoProceso.codigo = DEM.listaProductoBusqueda.length;
    resultadoProceso.mensaje = 'ProductoBusquedas datos cargados en memoria';
    resultadoProceso.objeto = DEM.listaProductoBusqueda;

    internalPrint('PROCESO 3 cargarEnMemoria: ${resultadoProceso.mensaje}');
    await terminadoProceso(resultadoProceso);
  }

  leerInfoDeWebProductoBusqueda() async {
    internalPrint('PROCESO 4 leerInfoDeWeb...');
    if (tablaDelfinProductoBusqueda.ultimaLecturaInfoWeb != null) {
      internalPrint('tablaDelfinCategoria.ultimaLecturaInfo ${tablaDelfinProductoBusqueda.ultimaLecturaInfoWeb.difference(DateTime.now()).inSeconds}');
      if (tablaDelfinProductoBusqueda.ultimaLecturaInfoWeb.difference(DateTime.now()).inSeconds < 30) {
        internalPrint('PROCESO 4 leerInfoDeWeb ProductoBusqueda: NO EJECUTADO.  Ya se ejecutó hace menos de 30 segundos.');
        return;
      }
    }
    ResultadoProceso resultadoProceso = ResultadoProceso();

    if (Sesion.usuarioFb == null) {
      final maximoTiempo = DateTime.now().add(Duration(seconds: DEM.ESPERA_SEGUNDOS_INICIO_SESION_INTERNA));
      internalPrint('No se ha iniciado Sesión, no podremos ni siquiera intentar leerInfoDeWebProductoBusqueda');
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
            'No se ha iniciado sesión interna... abortando leerInfoDeWebProductoBusqueda');
        resultadoProceso.mensaje = 'Abortado leer Info de Web ProductoBusqueda. Sesión NO Iniciada';
        resultadoProceso.error = true;
        await errorEnProceso(resultadoProceso);
        return;
      }
    } else {
      internalPrint('Sesion.usuarioFb ${Sesion.usuarioFb.uid}');
    }

    if (tablaDelfinProductoBusqueda.ocupado) {
      internalPrint('tablaDelfinProductoBusqueda.ocupado, no podremos ni siquiera intentar leerInfoDeWebProductoBusqueda');

      int intentos = DEM.ESPERA_SEGUNDOS_TABLA_OCUPADA * 2;   // * 2 porque esperamos 500 milisegundos
      while (tablaDelfinProductoBusqueda.ocupado & (intentos > 0)) {
        await esperar(500);
        internalPrint('esperando leerInfoDeWebProductoBusqueda...');
        intentos -= 1;
      }
      if (intentos == 0) {
        internalPrint(
          'SE ACABÓ EL TIEMPO DE ESPERA EN ${DEM.ESPERA_SEGUNDOS_TABLA_OCUPADA}... abortando leerInfoDeWebProductoBusqueda');
        resultadoProceso.mensaje = 'Abortado ProductoBusqueda leer Info de Web';
        resultadoProceso.error = true;
        await errorEnProceso(resultadoProceso);
        return;
      }
    }

    //Proceso real Borrar Preferencias ProductoBusqueda
    DEM.datosLocales.leerDatosActualizadosEnWebDeTabla(tablaDelfinProductoBusqueda, this);

    resultadoProceso.codigo = 1;
    resultadoProceso.mensaje = 'ProductoBusquedas leída Info de Web';

    internalPrint('PROCESO 4 leerInfoDeWeb: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);

  }

  descargarArchivoWebProductoBusqueda() async {
    internalPrint('PROCESO 5 descargarArchivoWeb...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Proceso real Descargar Archivo Web ProductoBusqueda
    bool lOk;
    try {
      lOk = await DEM.datosLocales.descargarDatosDeWebDeTabla(tablaDelfinProductoBusqueda);
      resultadoProceso.codigo = 1;
      resultadoProceso.mensaje = 'Descargados datos de ProductoBusquedas.';
    } catch(e) {
      // TODO: Verificar si hay internet y si hay un temporizador para volver a intentar el proceso
      resultadoProceso.mensaje = '*** ERROR *** Al intetentar descargar Archivo de ProductoBusquedas';
      resultadoProceso.objeto = e;
      resultadoProceso.error = true;
    }
    internalPrint('PROCESO 5 descargarArchivoWeb: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);
    if (lOk) {
      await guardarEnPreferenciasProductoBusqueda();
      validarEdadDataProductoBusqueda();
    }
  }

  guardarEnPreferenciasProductoBusqueda() async {
    internalPrint('PROCESO 6 guardarEnPreferencias...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Proceso real Guardar En Preferenicas ProductoBusqueda
    bool lOk = await DEM.datosLocales.guardarLocalmenteTabla(tablaDelfinProductoBusqueda);
    if (lOk) {
      resultadoProceso.codigo = 1;
      resultadoProceso.mensaje = 'ProductoBusquedas guardados en Preferencias';
    } else {
      resultadoProceso.mensaje = '*** ERROR *** Al intentar guardar datos de ProductoBusquedas en Preferencias';
      resultadoProceso.error = true;
    }
    internalPrint('PROCESO 6 guardarEnPreferencias: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);
  }

  borrarPreferenciasProductoBusqueda() async {
    internalPrint('PROCESO 7 borrarPreferencias...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    //Proceso real Borrar Preferencias ProductoBusqueda
    DEM.datosLocales.eliminarLocalmenteTabla(tablaDelfinProductoBusqueda);

    resultadoProceso.codigo = 1;
    resultadoProceso.mensaje = 'ProductoBusquedas borrados de Preferencias';

    internalPrint('PROCESO 7 borrarPreferencias: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);
  }

  @override
  inicializarProceso(ResultadoProceso resultadoProceso) async {
    await esperar(ESPERA);
    blocProductoBusqueda.add(EventoProcesosIniciadosProductoBusqueda(resultadoProceso));
  }

  @override
  progresandoProceso(ResultadoProceso resultadoProceso) async {
    await esperar(ESPERA);
    blocProductoBusqueda.add(EventoProgresandoProductoBusqueda(resultadoProceso));
    if (resultadoProceso.siguienteProceso == 'DESCARGAR') {
      descargarArchivoWebProductoBusqueda();
    }
  }

  @override
  errorEnProceso(ResultadoProceso resultadoProceso) async {
    await esperar(ESPERA);
    blocProductoBusqueda.add(EventoErroresEncontradosProductoBusqueda(resultadoProceso));
  }

  @override
  terminadoProceso(ResultadoProceso resultadoProceso) async {
    await esperar(ESPERA);
    blocProductoBusqueda.add(EventoProcesosTerminadosProductoBusqueda(resultadoProceso));
  }

}
