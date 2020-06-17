// Delfin API
// Estados para el BLoC de ProductoBusquedas

import 'package:pyd_eber/all-exports.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductoBusquedaEstado extends EstadosBLoCAbstractos {
  const ProductoBusquedaEstado(this.resultadoProceso);

  final ResultadoProceso resultadoProceso;

  @override
  List<Object> get props => [resultadoProceso];
}

class EstadoInicialProductoBusqueda extends ProductoBusquedaEstado {
  const EstadoInicialProductoBusqueda(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EstadoProcesosIniciadosProductoBusqueda extends ProductoBusquedaEstado {
  const EstadoProcesosIniciadosProductoBusqueda(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EstadoErrorEnProcesosProductoBusqueda extends ProductoBusquedaEstado {
  const EstadoErrorEnProcesosProductoBusqueda(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EstadoProgresandoProductoBusqueda extends ProductoBusquedaEstado {
  const EstadoProgresandoProductoBusqueda(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EstadoResultadoProcesosTerminadosProductoBusqueda extends ProductoBusquedaEstado {
  const EstadoResultadoProcesosTerminadosProductoBusqueda(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

