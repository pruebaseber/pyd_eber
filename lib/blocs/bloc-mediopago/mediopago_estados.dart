// Delfin API
// Estados para el BLoC de Medios de Pago

import 'package:pyd_eber/all-exports.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MedioPagoEstado extends EstadosBLoCAbstractos {
  const MedioPagoEstado(this.resultadoProceso);

  final ResultadoProceso resultadoProceso;

  @override
  List<Object> get props => [resultadoProceso];
}

class EstadoInicialMedioPago extends MedioPagoEstado {
  const EstadoInicialMedioPago(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EstadoProcesosIniciadosMedioPago extends MedioPagoEstado {
  const EstadoProcesosIniciadosMedioPago(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EstadoErrorEnProcesosMedioPago extends MedioPagoEstado {
  const EstadoErrorEnProcesosMedioPago(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EstadoProgresandoMedioPago extends MedioPagoEstado {
  const EstadoProgresandoMedioPago(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EstadoResultadoProcesosTerminadosMedioPago extends MedioPagoEstado {
  const EstadoResultadoProcesosTerminadosMedioPago(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

