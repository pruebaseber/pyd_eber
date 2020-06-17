import 'package:pyd_eber/all-exports.dart';

abstract class ProcesosAbstractos {

  iniciadoProceso(ResultadoProceso resultadoProceso) {}

  progresandoProceso(ResultadoProceso resultadoProceso) {}

  errorEnProceso(ResultadoProceso resultadoProceso) {}

  terminadoProceso(ResultadoProceso resultadoProceso) {}

  esperar(int milisecs) {
    final duration = Duration(milliseconds: milisecs);
    return Future.delayed(duration).then((value) => null);
  }

}

abstract class EstadosBLoCAbstractos extends Equatable {
  const EstadosBLoCAbstractos();
}