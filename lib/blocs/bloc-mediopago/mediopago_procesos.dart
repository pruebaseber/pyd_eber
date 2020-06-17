// Delfin API
// Medios de Pago

import 'package:pyd_eber/all-exports.dart';

class ProcesosBlocMedioPago extends ProcesosAbstractos {
  ProcesosBlocMedioPago(this.blocMedioPago);

  static const ESPERA = 160;
  final BlocMedioPago blocMedioPago;
  TablaDelfin tablaDelfinMedioPago;

  void inicializarMedioPago() async {
    internalPrint('PROCESO 0 inicializar...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Inicialización de Datos de Medios de Pago
    tablaDelfinMedioPago = TablaDelfin(nombre: MEDIOPAGO.ENTIDAD);
    DEM.listaMedioPago.clear();

    resultadoProceso.mensaje = 'Medios de Pago Inicializada';

    internalPrint('PROCESO 0 inicializar: ${resultadoProceso.mensaje}');
    await inicializarProceso(resultadoProceso);

    leerPreferenciasMedioPago();
  }

  leerPreferenciasMedioPago() async {
    internalPrint('PROCESO 1 leerPreferencias...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Proceso real Leer Preferencias MedioPago
    bool lOk = DEM.datosLocales.leerPreferenciaLocalDeTabla(tablaDelfinMedioPago);

    resultadoProceso.mensaje = 'Medios de Pago leída en Preferencias ';
    if (tablaDelfinMedioPago.existe) {
      resultadoProceso.mensaje += 'existe';
    } else {
      resultadoProceso.mensaje += 'NO existe';
    }

    internalPrint('PROCESO 1 leerPreferencias: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);

    if (lOk) { 
      validarEdadDataMedioPago();
    } else {
      leerInfoDeWebMedioPago();
    }
  }

  validarEdadDataMedioPago() async {
    internalPrint('PROCESO 2 validarDatosLocales...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Proceso real Validar Datos Locales MedioPago
    // No se valida la edad para esta tabla.
    bool lOk = true; //DEM.datosLocales.revisarEdadDeTabla(tablaDelfinMedioPago, DEM.duracionTablaDelfinMedioPago);
    if (lOk) {
      lOk = DEM.datosLocales.verificarDataDeTabla(tablaDelfinMedioPago);
      if (lOk) {
        resultadoProceso.mensaje = 'Medios de Pago validados datos locales';
      } else {
        resultadoProceso.mensaje = '*** ERROR *** Medios de Pago datos locales NO SON VALIDOS';
        resultadoProceso.error = true;
      }
    } else {
      resultadoProceso.mensaje = '*** ERROR *** Medios de Pago datos locales OBSOLETOS';
      resultadoProceso.error = true;
    }
    internalPrint('PROCESO 2 validarDatosLocales: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);
    if (lOk) {
      await cargarEnMemoriaMedioPago();
    } else {
//      await errorEnProceso(resultadoProceso);
      await borrarPreferenciasMedioPago();
    }
    leerInfoDeWebMedioPago();
  }

  cargarEnMemoriaMedioPago() async {
    internalPrint('PROCESO 3 cargarEnMemoria...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Proceso real Cargar en Memoria MedioPago
    tablaDelfinMedioPago.ocupado = true;
    DEM.datosLocales.cargarTablaDelfinEnMemoria(tablaDelfinMedioPago);
    tablaDelfinMedioPago.ocupado = false;

    resultadoProceso.codigo = DEM.listaMedioPago.length;
    resultadoProceso.mensaje = 'Medios de Pago datos cargados en memoria';
    resultadoProceso.objeto = DEM.listaMedioPago;

    internalPrint('PROCESO 3 cargarEnMemoria: ${resultadoProceso.mensaje}');
    await terminadoProceso(resultadoProceso);
  }

  leerInfoDeWebMedioPago() async {
    internalPrint('PROCESO 4 leerInfoDeWeb...');
    if (tablaDelfinMedioPago.ultimaLecturaInfoWeb != null) {
      internalPrint('tablaDelfinCategoria.ultimaLecturaInfo ${tablaDelfinMedioPago.ultimaLecturaInfoWeb.difference(DateTime.now()).inSeconds}');
      if (tablaDelfinMedioPago.ultimaLecturaInfoWeb.difference(DateTime.now()).inSeconds < 30) {
        internalPrint('PROCESO 4 leerInfoDeWeb MedioPago: NO EJECUTADO.  Ya se ejecutó hace menos de 30 segundos.');
        return;
      }
    }
    ResultadoProceso resultadoProceso = ResultadoProceso();

    if (Sesion.usuarioFb == null) {
      final maximoTiempo = DateTime.now().add(Duration(seconds: DEM.ESPERA_SEGUNDOS_INICIO_SESION_INTERNA));
      internalPrint('No se ha iniciado Sesión, no podremos ni siquiera intentar leerInfoDeWebMedioPago');
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
        resultadoProceso.mensaje = 'Abortado leer Info de Web MedioPago. Sesión NO Iniciada';
        resultadoProceso.error = true;
        await errorEnProceso(resultadoProceso);
        return;
      }
    } else {
      internalPrint('Sesion.usuarioFb ${Sesion.usuarioFb.uid}');
    }

    if (tablaDelfinMedioPago.ocupado) {
      internalPrint('tablaDelfinMedioPago.ocupado, no podremos ni siquiera intentar leerInfoDeWebMedioPago');

      int intentos = DEM.ESPERA_SEGUNDOS_TABLA_OCUPADA * 2;   // * 2 porque esperamos 500 milisegundos
      while (tablaDelfinMedioPago.ocupado & (intentos > 0)) {
        await esperar(500);
        internalPrint('esperando leerInfoDeWebMedioPago...');
        intentos -= 1;
      }
      if (intentos == 0) {
        internalPrint(
          'SE ACABÓ EL TIEMPO DE ESPERA EN ${DEM.ESPERA_SEGUNDOS_TABLA_OCUPADA}... abortando leerInfoDeWebMedioPago');
        resultadoProceso.mensaje = 'Abortado MedioPago leer Info de Web';
        resultadoProceso.error = true;
        await errorEnProceso(resultadoProceso);
        return;
      }
    }

    //Proceso real Borrar Preferencias MedioPago
    DEM.datosLocales.leerDatosActualizadosEnWebDeTabla(tablaDelfinMedioPago, this);

    resultadoProceso.codigo = 1;
    resultadoProceso.mensaje = 'Medios de Pago leída Info de Web';

    internalPrint('PROCESO 4 leerInfoDeWeb: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);

  }

  descargarArchivoWebMedioPago() async {
    internalPrint('PROCESO 5 descargarArchivoWeb...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Proceso real Descargar Archivo Web MedioPago
    bool lOk;
    try {
      lOk = await DEM.datosLocales.descargarDatosDeWebDeTabla(tablaDelfinMedioPago);
      resultadoProceso.codigo = 1;
      resultadoProceso.mensaje = 'Descargados datos de Medios de Pago.';
    } catch(e) {
      // TODO: Verificar si hay internet y si hay un temporizador para volver a intentar el proceso
      resultadoProceso.mensaje = '*** ERROR *** Al intetentar descargar Archivo de Medios de Pago';
      resultadoProceso.objeto = e;
      resultadoProceso.error = true;
    }
    internalPrint('PROCESO 5 descargarArchivoWeb: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);
    if (lOk) {
      await guardarEnPreferenciasMedioPago();
      validarEdadDataMedioPago();
    }
  }

  guardarEnPreferenciasMedioPago() async {
    internalPrint('PROCESO 6 guardarEnPreferencias...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Proceso real Guardar En Preferenicas MedioPago
    bool lOk = await DEM.datosLocales.guardarLocalmenteTabla(tablaDelfinMedioPago);
    if (lOk) {
      resultadoProceso.codigo = 1;
      resultadoProceso.mensaje = 'Medios de Pago guardados en Preferencias';
    } else {
      resultadoProceso.mensaje = '*** ERROR *** Al intentar guardar datos de Medios de Pago en Preferencias';
      resultadoProceso.error = true;
    }
    internalPrint('PROCESO 6 guardarEnPreferencias: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);
  }

  borrarPreferenciasMedioPago() async {
    internalPrint('PROCESO 7 borrarPreferencias...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    //Proceso real Borrar Preferencias MedioPago
    DEM.datosLocales.eliminarLocalmenteTabla(tablaDelfinMedioPago);

    resultadoProceso.codigo = 1;
    resultadoProceso.mensaje = 'Medios de Pago borrados de Preferencias';

    internalPrint('PROCESO 7 borrarPreferencias: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);
  }

  @override
  inicializarProceso(ResultadoProceso resultadoProceso) async {
    await esperar(ESPERA);
    blocMedioPago.add(EventoProcesosIniciadosMedioPago(resultadoProceso));
  }

  @override
  progresandoProceso(ResultadoProceso resultadoProceso) async {
    await esperar(ESPERA);
    blocMedioPago.add(EventoProgresandoMedioPago(resultadoProceso));
    if (resultadoProceso.siguienteProceso == 'DESCARGAR') {
      descargarArchivoWebMedioPago();
    }
  }

  @override
  errorEnProceso(ResultadoProceso resultadoProceso) async {
    await esperar(ESPERA);
    blocMedioPago.add(EventoErroresEncontradosMedioPago(resultadoProceso));
  }

  @override
  terminadoProceso(ResultadoProceso resultadoProceso) async {
    await esperar(ESPERA);
    blocMedioPago.add(EventoProcesosTerminadosMedioPago(resultadoProceso));
  }

}
