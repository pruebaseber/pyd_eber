// Delfin API
// Eventos para el BLoC de Productos

import 'package:pyd_eber/all-exports.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductoEvento {
  const ProductoEvento(this.resultadoProceso);

  final ResultadoProceso resultadoProceso;
}

class EventoInicializadoProducto extends ProductoEvento {
  const EventoInicializadoProducto(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EventoProcesosIniciadosProducto extends ProductoEvento {
  const EventoProcesosIniciadosProducto(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EventoProgresandoProducto extends ProductoEvento {
  const EventoProgresandoProducto(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EventoErroresEncontradosProducto extends ProductoEvento {
  const EventoErroresEncontradosProducto(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EventoProcesosTerminadosProducto extends ProductoEvento {
  const EventoProcesosTerminadosProducto(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}
