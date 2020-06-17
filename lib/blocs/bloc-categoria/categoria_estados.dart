// Delfin API
// Estados para el BLoC de Categorías

import 'package:pyd_eber/all-exports.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CategoriaEstado extends EstadosBLoCAbstractos {
  const CategoriaEstado(this.resultadoProceso);

  final ResultadoProceso resultadoProceso;

  @override
  List<Object> get props => [resultadoProceso];
}

class EstadoInicialCategoria extends CategoriaEstado {
  const EstadoInicialCategoria(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EstadoProcesosIniciadosCategoria extends CategoriaEstado {
  const EstadoProcesosIniciadosCategoria(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EstadoErrorEnProcesosCategoria extends CategoriaEstado {
  const EstadoErrorEnProcesosCategoria(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EstadoProgresandoCategoria extends CategoriaEstado {
  const EstadoProgresandoCategoria(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EstadoResultadoProcesosTerminadosCategoria extends CategoriaEstado {
  const EstadoResultadoProcesosTerminadosCategoria(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

