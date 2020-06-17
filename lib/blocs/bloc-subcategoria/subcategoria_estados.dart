// Delfin API
// Estados para el BLoC de Sub Categorías

import 'package:pyd_eber/all-exports.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SubCategoriaEstado extends EstadosBLoCAbstractos {
  const SubCategoriaEstado(this.resultadoProceso);

  final ResultadoProceso resultadoProceso;

  @override
  List<Object> get props => [resultadoProceso];
}

class EstadoInicialSubCategoria extends SubCategoriaEstado {
  const EstadoInicialSubCategoria(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EstadoProcesosIniciadosSubCategoria extends SubCategoriaEstado {
  const EstadoProcesosIniciadosSubCategoria(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EstadoErrorEnProcesosSubCategoria extends SubCategoriaEstado {
  const EstadoErrorEnProcesosSubCategoria(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EstadoProgresandoSubCategoria extends SubCategoriaEstado {
  const EstadoProgresandoSubCategoria(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EstadoResultadoProcesosTerminadosSubCategoria extends SubCategoriaEstado {
  const EstadoResultadoProcesosTerminadosSubCategoria(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

