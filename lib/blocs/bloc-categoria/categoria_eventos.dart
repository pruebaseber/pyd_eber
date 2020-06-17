// Delfin API
// Eventos para el BLoC de Categorías

import 'package:pyd_eber/all-exports.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CategoriaEvento {
  const CategoriaEvento(this.resultadoProceso);

  final ResultadoProceso resultadoProceso;
}

class EventoInicializadoCategoria extends CategoriaEvento {
  const EventoInicializadoCategoria(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EventoProcesosIniciadosCategoria extends CategoriaEvento {
  const EventoProcesosIniciadosCategoria(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EventoProgresandoCategoria extends CategoriaEvento {
  const EventoProgresandoCategoria(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EventoErroresEncontradosCategoria extends CategoriaEvento {
  const EventoErroresEncontradosCategoria(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EventoProcesosTerminadosCategoria extends CategoriaEvento {
  const EventoProcesosTerminadosCategoria(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}
