// Delfin API
// Categorías

import 'package:pyd_eber/all-exports.dart';

class ProcesosBlocCategoria extends ProcesosAbstractos {
  ProcesosBlocCategoria(this.blocCategoria);

  static const ESPERA = 160;
  final BlocCategoria blocCategoria;
  TablaDelfin tablaDelfinCategoria;

  void inicializarCategoria() async {
    internalPrint('PROCESO 0 inicializar...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Inicialización de Datos de Categorías
    tablaDelfinCategoria = TablaDelfin(nombre: CATEGORIA.ENTIDAD);
    DEM.listaCategoria.clear();

    resultadoProceso.mensaje = 'Categorías Inicializada';

    internalPrint('PROCESO 0 inicializar: ${resultadoProceso.mensaje}');
    await inicializarProceso(resultadoProceso);

    leerPreferenciasCategoria();
  }

  leerPreferenciasCategoria() async {
    internalPrint('PROCESO 1 leerPreferencias...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Proceso real Leer Preferencias Categoria
    bool lOk =
        DEM.datosLocales.leerPreferenciaLocalDeTabla(tablaDelfinCategoria);

    resultadoProceso.mensaje = 'Categorías leída en Preferencias ';
    if (tablaDelfinCategoria.existe) {
      resultadoProceso.mensaje += 'existe';
    } else {
      resultadoProceso.mensaje += 'NO existe';
    }

    internalPrint('PROCESO 1 leerPreferencias: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);

    if (lOk) {
      validarEdadDataCategoria();
    } else {
      leerInfoDeWebCategoria();
    }
  }

  validarEdadDataCategoria() async {
    internalPrint('PROCESO 2 validarDatosLocales...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Proceso real Validar Datos Locales Categoria
    bool lOk = DEM.datosLocales.revisarEdadDeTabla(
        tablaDelfinCategoria, DEM.duracionTablaDelfinCategoria);
    if (lOk) {
      lOk = DEM.datosLocales.verificarDataDeTabla(tablaDelfinCategoria);
      if (lOk) {
        resultadoProceso.mensaje = 'Categorías validados datos locales';
      } else {
        resultadoProceso.mensaje =
            '*** ERROR *** Categorías datos locales NO SON VALIDOS';
//        resultadoProceso.error = true;
      }
    }
    internalPrint('PROCESO 2 validarDatosLocales: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);
    if (lOk) {
      await cargarEnMemoriaCategoria();
    } else {
//      await errorEnProceso(resultadoProceso);
      await borrarPreferenciasCategoria();
    }
    leerInfoDeWebCategoria();
  }

  cargarEnMemoriaCategoria() async {
    internalPrint('PROCESO 3 cargarEnMemoria...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Proceso real Cargar en Memoria Categoria
    tablaDelfinCategoria.ocupado = true;
    DEM.datosLocales.cargarTablaDelfinEnMemoria(tablaDelfinCategoria);
    tablaDelfinCategoria.ocupado = false;

    resultadoProceso.codigo = DEM.listaCategoria.length;
    resultadoProceso.mensaje = 'Categorías datos cargados en memoria';
    resultadoProceso.objeto = DEM.listaCategoria;

    internalPrint('PROCESO 3 cargarEnMemoria: ${resultadoProceso.mensaje}');
    await terminadoProceso(resultadoProceso);
  }

  leerInfoDeWebCategoria() async {
    internalPrint('PROCESO 4 leerInfoDeWeb...');
    ResultadoProceso resultadoProceso = ResultadoProceso();
    if (tablaDelfinCategoria.ultimaLecturaInfoWeb != null) {
      internalPrint(
          'tablaDelfinCategoria.ultimaLecturaInfo ${tablaDelfinCategoria.ultimaLecturaInfoWeb.difference(DateTime.now()).inSeconds}');
      if (tablaDelfinCategoria.ultimaLecturaInfoWeb
              .difference(DateTime.now())
              .inSeconds <
          30) {
        internalPrint(
            'PROCESO 4 leerInfoDeWeb Categoria: NO EJECUTADO.  Ya se ejecutó hace menos de 30 segundos.');
        return;
      }
    }

    if (Sesion.usuarioFb == null) {
      final maximoTiempo = DateTime.now()
          .add(Duration(seconds: DEM.ESPERA_SEGUNDOS_INICIO_SESION_INTERNA));
      internalPrint(
          'No se ha iniciado Sesión, no podremos ni siquiera intentar leerInfoDeWebCategoria');
      internalPrint((DateTime.now().compareTo(maximoTiempo) <= 0));
      int iEspera = 0;
      while ((Sesion.usuarioFb == null) &
          (DateTime.now().compareTo(maximoTiempo) <= 0)) {
        // await esperar(200);
        iEspera += 1;
        resultadoProceso.mensaje = 'esperando...$iEspera Sesión NO Iniciada';
        await progresandoProceso(resultadoProceso);
        internalPrint(resultadoProceso.mensaje);
      }
      if (Sesion.usuarioFb == null) {
        internalPrint(
            'No se ha iniciado sesión interna... abortando leerInfoDeWebProducto');
        resultadoProceso.mensaje =
            'Abortado leer Info de Web Categoria. Sesión NO Iniciada';
        resultadoProceso.error = true;
        await errorEnProceso(resultadoProceso);
        return;
      }
    } else {
      internalPrint('Sesion.usuarioFb ${Sesion.usuarioFb.uid}');
    }

    if (tablaDelfinCategoria.ocupado) {
      internalPrint(
          'tablaDelfinCategoria.ocupado, no podremos ni siquiera intentar leerInfoDeWebCategoria');

      int intentos = DEM.ESPERA_SEGUNDOS_TABLA_OCUPADA *
          2; // * 2 porque esperamos 500 milisegundos
      while (tablaDelfinCategoria.ocupado & (intentos > 0)) {
        await esperar(500);
        internalPrint('esperando leerInfoDeWebCategoria...');
        intentos -= 1;
      }
      if (intentos == 0) {
        internalPrint(
            'SE ACABÓ EL TIEMPO DE ESPERA EN ${DEM.ESPERA_SEGUNDOS_TABLA_OCUPADA}... abortando leerInfoDeWebCategoria');
        resultadoProceso.mensaje = 'Abortado Categoria leer Info de Web';
        resultadoProceso.error = true;
        await errorEnProceso(resultadoProceso);
        return;
      }
    }

    //Proceso real Borrar Preferencias Categoria
    DEM.datosLocales
        .leerDatosActualizadosEnWebDeTabla(tablaDelfinCategoria, this);

    resultadoProceso.codigo = 1;
    resultadoProceso.mensaje = 'Categorías leída Info de Web';

    internalPrint('PROCESO 4 leerInfoDeWeb: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);
  }

  descargarArchivoWebCategoria() async {
    internalPrint('PROCESO 5 descargarArchivoWeb...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Proceso real Descargar Archivo Web Categoria
    bool lOk;
    try {
      lOk = await DEM.datosLocales
          .descargarDatosDeWebDeTabla(tablaDelfinCategoria);
      resultadoProceso.codigo = 1;
      resultadoProceso.mensaje = 'Descargados datos de Categorías.';
    } catch (e) {
      // TODO: Verificar si hay internet y si hay un temporizador para volver a intentar el proceso
      resultadoProceso.mensaje =
          '*** ERROR *** Al intetentar descargar Archivo de Categorías';
      if (tablaDelfinCategoria.objetoFinal == null) {
        resultadoProceso.objeto = e;
        resultadoProceso.error = true;
      }
    }
    internalPrint('PROCESO 5 descargarArchivoWeb: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);
    if (lOk) {
      await guardarEnPreferenciasCategoria();
      validarEdadDataCategoria();
    }
  }

  guardarEnPreferenciasCategoria() async {
    internalPrint('PROCESO 6 guardarEnPreferencias...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    // Proceso real Guardar En Preferenicas Categoria
    bool lOk =
        await DEM.datosLocales.guardarLocalmenteTabla(tablaDelfinCategoria);
    if (lOk) {
      resultadoProceso.codigo = 1;
      resultadoProceso.mensaje = 'Categorías guardados en Preferencias';
    } else {
      resultadoProceso.mensaje =
          '*** ERROR *** Al intentar guardar datos de Categorías en Preferencias';
//      resultadoProceso.error = true;
    }
    internalPrint('PROCESO 6 guardarEnPreferencias: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);
  }

  borrarPreferenciasCategoria() async {
    internalPrint('PROCESO 7 borrarPreferencias...');
    ResultadoProceso resultadoProceso = ResultadoProceso();

    //Proceso real Borrar Preferencias Categoria
    DEM.datosLocales.eliminarLocalmenteTabla(tablaDelfinCategoria);

    resultadoProceso.codigo = 1;
    resultadoProceso.mensaje = 'Categorías borrados de Preferencias';

    internalPrint('PROCESO 7 borrarPreferencias: ${resultadoProceso.mensaje}');
    await progresandoProceso(resultadoProceso);
  }

  @override
  inicializarProceso(ResultadoProceso resultadoProceso) async {
    await esperar(ESPERA);
    blocCategoria.add(EventoProcesosIniciadosCategoria(resultadoProceso));
  }

  @override
  progresandoProceso(ResultadoProceso resultadoProceso) async {
    await esperar(ESPERA);
    blocCategoria.add(EventoProgresandoCategoria(resultadoProceso));
    if (resultadoProceso.siguienteProceso == 'DESCARGAR') {
      descargarArchivoWebCategoria();
    }
  }

  @override
  errorEnProceso(ResultadoProceso resultadoProceso) async {
    await esperar(ESPERA);
    blocCategoria.add(EventoErroresEncontradosCategoria(resultadoProceso));
  }

  @override
  terminadoProceso(ResultadoProceso resultadoProceso) async {
    await esperar(ESPERA);
    blocCategoria.add(EventoProcesosTerminadosCategoria(resultadoProceso));
  }
}
