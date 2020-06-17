// Delfin API
// Sub Categorías

import 'package:pyd_eber/all-exports.dart';

class ProcesosBlocSubCategoria extends ProcesosAbstractos {
  ProcesosBlocSubCategoria(this.blocSubCategoria);

  static const ESPERA = 160;
  final BlocSubCategoria blocSubCategoria;
  TablaDelfin tablaDelfinSubCategoria;

  void inicializarSubCategoria() async {
    internalPrint('PROCESO 0 inicializar...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Inicialización de Datos de Sub Categorías
    tablaDelfinSubCategoria = TablaDelfin(nombre: SUBCATEGORIA.ENTIDAD);
    DEM.listaSubCategoria.clear();

    resultadoProceso.mensaje = 'Sub Categorías Inicializada';

    internalPrint('PROCESO 0 inicializar: ${resultadoProceso.mensaje}');
    await inicializarProceso(resultadoProceso);
    await esperar(25);

    leerPreferenciasSubCategoria();
  }

  leerPreferenciasSubCategoria() async {
    internalPrint('PROCESO 1 leerPreferencias...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Proceso real Leer Preferencias SubCategoria
    bool lOk = DEM.datosLocales.leerPreferenciaLocalDeTabla(tablaDelfinSubCategoria);

    resultadoProceso.mensaje = 'Sub Categorías leída en Preferencias ';
    if (tablaDelfinSubCategoria.existe) {
      resultadoProceso.mensaje += 'existe';
    } else {
      resultadoProceso.mensaje += 'NO existe';
    }

    internalPrint('PROCESO 1 leerPreferencias: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);

    if (lOk) { 
      validarEdadDataSubCategoria();
    } else {
      leerInfoDeWebSubCategoria();
    }
  }

  validarEdadDataSubCategoria() async {
    internalPrint('PROCESO 2 validarDatosLocales...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Proceso real Validar Datos Locales SubCategoria
    bool lOk = DEM.datosLocales.revisarEdadDeTabla(tablaDelfinSubCategoria, DEM.duracionTablaDelfinSubCategoria);
    if (lOk) {
      lOk = DEM.datosLocales.verificarDataDeTabla(tablaDelfinSubCategoria);
      if (lOk) {
        resultadoProceso.mensaje = 'Sub Categorías validados datos locales';
      } else {
        resultadoProceso.mensaje = '*** ERROR *** Sub Categorías datos locales NO SON VALIDOS';
        resultadoProceso.error = true;
      }
    }
    internalPrint('PROCESO 2 validarDatosLocales: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);
    if (lOk) {
      await cargarEnMemoriaSubCategoria();
    } else {
//      await errorEnProceso(resultadoProceso);
      await borrarPreferenciasSubCategoria();
    }
    leerInfoDeWebSubCategoria();
  }

  cargarEnMemoriaSubCategoria() async {
    internalPrint('PROCESO 3 cargarEnMemoria...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Proceso real Cargar en Memoria SubCategoria
    tablaDelfinSubCategoria.ocupado = true;
    DEM.datosLocales.cargarTablaDelfinEnMemoria(tablaDelfinSubCategoria);
    tablaDelfinSubCategoria.ocupado = false;

    resultadoProceso.codigo = DEM.listaSubCategoria.length;
    resultadoProceso.mensaje = 'Sub Categorías datos cargados en memoria';
    resultadoProceso.objeto = DEM.listaSubCategoria;

    internalPrint('PROCESO 3 cargarEnMemoria: ${resultadoProceso.mensaje}');
    await terminadoProceso(resultadoProceso);
  }

  leerInfoDeWebSubCategoria() async {
    internalPrint('PROCESO 4 leerInfoDeWeb...');
    if (tablaDelfinSubCategoria.ultimaLecturaInfoWeb != null) {
      internalPrint('tablaDelfinCategoria.ultimaLecturaInfo ${tablaDelfinSubCategoria.ultimaLecturaInfoWeb.difference(DateTime.now()).inSeconds}');
      if (tablaDelfinSubCategoria.ultimaLecturaInfoWeb.difference(DateTime.now()).inSeconds < 30) {
        internalPrint('PROCESO 4 leerInfoDeWeb: SubCategoria NO EJECUTADO.  Ya se ejecutó hace menos de 30 segundos.');
        return;
      }
    }
    ResultadoProceso resultadoProceso = ResultadoProceso();

    if (Sesion.usuarioFb == null) {
      final maximoTiempo = DateTime.now().add(Duration(seconds: DEM.ESPERA_SEGUNDOS_INICIO_SESION_INTERNA));
      internalPrint('No se ha iniciado Sesión, no podremos ni siquiera intentar leerInfoDeWebSubCategoria');
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
        resultadoProceso.mensaje = 'Abortado leer Info de Web SubCategoria. Sesión NO Iniciada';
        resultadoProceso.error = true;
        await errorEnProceso(resultadoProceso);
        return;
      }
    } else {
      internalPrint('Sesion.usuarioFb ${Sesion.usuarioFb.uid}');
    }

    if (tablaDelfinSubCategoria.ocupado) {
      internalPrint('tablaDelfinSubCategoria.ocupado, no podremos ni siquiera intentar leerInfoDeWebSubCategoria');

      int intentos = DEM.ESPERA_SEGUNDOS_TABLA_OCUPADA * 2;   // * 2 porque esperamos 500 milisegundos
      while (tablaDelfinSubCategoria.ocupado & (intentos > 0)) {
        await esperar(500);
        internalPrint('esperando leerInfoDeWebSubCategoria...');
        intentos -= 1;
      }
      if (intentos == 0) {
        internalPrint(
          'SE ACABÓ EL TIEMPO DE ESPERA EN ${DEM.ESPERA_SEGUNDOS_TABLA_OCUPADA}... abortando leerInfoDeWebSubCategoria');
        resultadoProceso.mensaje = 'Abortado SubCategoria leer Info de Web';
        resultadoProceso.error = true;
        await errorEnProceso(resultadoProceso);
        return;
      }
    }

    //Proceso real Borrar Preferencias SubCategoria
    DEM.datosLocales.leerDatosActualizadosEnWebDeTabla(tablaDelfinSubCategoria, this);

    resultadoProceso.codigo = 1;
    resultadoProceso.mensaje = 'Sub Categorías leída Info de Web';

    internalPrint('PROCESO 4 leerInfoDeWeb: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);

  }

  descargarArchivoWebSubCategoria() async {
    internalPrint('PROCESO 5 descargarArchivoWeb...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Proceso real Descargar Archivo Web SubCategoria
    bool lOk;
    try {
      lOk = await DEM.datosLocales.descargarDatosDeWebDeTabla(tablaDelfinSubCategoria);
      resultadoProceso.codigo = 1;
      resultadoProceso.mensaje = 'Descargados datos de Sub Categorías.';
    } catch(e) {
      // TODO: Verificar si hay internet y si hay un temporizador para volver a intentar el proceso
      resultadoProceso.mensaje = '*** ERROR *** Al intetentar descargar Archivo de Sub Categorías';
      resultadoProceso.objeto = e;
      resultadoProceso.error = true;
    }
    internalPrint('PROCESO 5 descargarArchivoWeb: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);
    if (lOk) {
      await guardarEnPreferenciasSubCategoria();
      validarEdadDataSubCategoria();
    }
  }

  guardarEnPreferenciasSubCategoria() async {
    internalPrint('PROCESO 6 guardarEnPreferencias...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Proceso real Guardar En Preferenicas SubCategoria
    bool lOk = await DEM.datosLocales.guardarLocalmenteTabla(tablaDelfinSubCategoria);
    if (lOk) {
      resultadoProceso.codigo = 1;
      resultadoProceso.mensaje = 'Sub Categorías guardados en Preferencias';
    } else {
      resultadoProceso.mensaje = '*** ERROR *** Al intentar guardar datos de Sub Categorías en Preferencias';
      resultadoProceso.error = true;
    }
    internalPrint('PROCESO 6 guardarEnPreferencias: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);
  }

  borrarPreferenciasSubCategoria() async {
    internalPrint('PROCESO 7 borrarPreferencias...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    //Proceso real Borrar Preferencias SubCategoria
    DEM.datosLocales.eliminarLocalmenteTabla(tablaDelfinSubCategoria);

    resultadoProceso.codigo = 1;
    resultadoProceso.mensaje = 'Sub Categorías borrados de Preferencias';

    internalPrint('PROCESO 7 borrarPreferencias: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);
  }

  @override
  inicializarProceso(ResultadoProceso resultadoProceso) async {
    await esperar(ESPERA);
    blocSubCategoria.add(EventoProcesosIniciadosSubCategoria(resultadoProceso));
  }

  @override
  progresandoProceso(ResultadoProceso resultadoProceso) async {
    await esperar(ESPERA);
    blocSubCategoria.add(EventoProgresandoSubCategoria(resultadoProceso));
    if (resultadoProceso.siguienteProceso == 'DESCARGAR') {
      descargarArchivoWebSubCategoria();
    }
  }

  @override
  errorEnProceso(ResultadoProceso resultadoProceso) async {
    await esperar(ESPERA);
    blocSubCategoria.add(EventoErroresEncontradosSubCategoria(resultadoProceso));
  }

  @override
  terminadoProceso(ResultadoProceso resultadoProceso) async {
    await esperar(ESPERA);
    blocSubCategoria.add(EventoProcesosTerminadosSubCategoria(resultadoProceso));
  }

}
