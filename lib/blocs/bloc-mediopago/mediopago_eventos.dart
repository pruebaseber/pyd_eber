// Delfin API
// Eventos para el BLoC de Medios de Pago

import 'package:pyd_eber/all-exports.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MedioPagoEvento {
  const MedioPagoEvento(this.resultadoProceso);

  final ResultadoProceso resultadoProceso;
}

class EventoInicializadoMedioPago extends MedioPagoEvento {
  const EventoInicializadoMedioPago(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EventoProcesosIniciadosMedioPago extends MedioPagoEvento {
  const EventoProcesosIniciadosMedioPago(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EventoProgresandoMedioPago extends MedioPagoEvento {
  const EventoProgresandoMedioPago(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EventoErroresEncontradosMedioPago extends MedioPagoEvento {
  const EventoErroresEncontradosMedioPago(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EventoProcesosTerminadosMedioPago extends MedioPagoEvento {
  const EventoProcesosTerminadosMedioPago(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}
