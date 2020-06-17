// Delfin API
// Estados para el BLoC de Productos

import 'package:pyd_eber/all-exports.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductoEstado extends EstadosBLoCAbstractos {
  const ProductoEstado(this.resultadoProceso);

  final ResultadoProceso resultadoProceso;

  @override
  List<Object> get props => [resultadoProceso];
}

class EstadoInicialProducto extends ProductoEstado {
  const EstadoInicialProducto(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EstadoProcesosIniciadosProducto extends ProductoEstado {
  const EstadoProcesosIniciadosProducto(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EstadoErrorEnProcesosProducto extends ProductoEstado {
  const EstadoErrorEnProcesosProducto(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EstadoProgresandoProducto extends ProductoEstado {
  const EstadoProgresandoProducto(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

class EstadoResultadoProcesosTerminadosProducto extends ProductoEstado {
  const EstadoResultadoProcesosTerminadosProducto(ResultadoProceso resultadoProceso) : super(resultadoProceso);
}

