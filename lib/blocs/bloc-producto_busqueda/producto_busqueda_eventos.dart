// Delfin API
// Eventos para el BLoC de ProductoBusquedas

import 'package:pyd_eber/all-exports.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductoBusquedaEvento {
  const ProductoBusquedaEvento(this.resultadoProceso);

  final ResultadoProceso resultadoProceso;
}

class EventoInicializadoProductoBusqueda extends ProductoBusquedaEvento {
  const EventoInicializadoProductoBusqueda(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EventoProcesosIniciadosProductoBusqueda extends ProductoBusquedaEvento {
  const EventoProcesosIniciadosProductoBusqueda(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EventoProgresandoProductoBusqueda extends ProductoBusquedaEvento {
  const EventoProgresandoProductoBusqueda(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EventoErroresEncontradosProductoBusqueda extends ProductoBusquedaEvento {
  const EventoErroresEncontradosProductoBusqueda(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EventoProcesosTerminadosProductoBusqueda extends ProductoBusquedaEvento {
  const EventoProcesosTerminadosProductoBusqueda(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}
