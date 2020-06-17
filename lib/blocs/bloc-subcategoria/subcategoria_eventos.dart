// Delfin API
// Eventos para el BLoC de Sub Categorías

import 'package:pyd_eber/all-exports.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SubCategoriaEvento {
  const SubCategoriaEvento(this.resultadoProceso);

  final ResultadoProceso resultadoProceso;
}

class EventoInicializadoSubCategoria extends SubCategoriaEvento {
  const EventoInicializadoSubCategoria(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EventoProcesosIniciadosSubCategoria extends SubCategoriaEvento {
  const EventoProcesosIniciadosSubCategoria(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EventoProgresandoSubCategoria extends SubCategoriaEvento {
  const EventoProgresandoSubCategoria(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EventoErroresEncontradosSubCategoria extends SubCategoriaEvento {
  const EventoErroresEncontradosSubCategoria(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EventoProcesosTerminadosSubCategoria extends SubCategoriaEvento {
  const EventoProcesosTerminadosSubCategoria(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}
