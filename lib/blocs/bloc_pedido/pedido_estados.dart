import 'package:pyd_eber/all-exports.dart';

@immutable
abstract class BlocPedidoEstado extends EstadosBLoCAbstractos {
  const BlocPedidoEstado(this.momento);

  final DateTime momento;

  @override
  List<Object> get props => [momento];
}

class InitialBlocPedidoState extends BlocPedidoEstado {
  const InitialBlocPedidoState(DateTime momento) : super(momento);
}

class EstadoPedidoProcesoDatosCategiasTerminado extends BlocPedidoEstado {
  const EstadoPedidoProcesoDatosCategiasTerminado(DateTime momento) : super(momento);
}

class EstadoPedidoProcesoDatosSubCategiasTerminado extends BlocPedidoEstado {
  const EstadoPedidoProcesoDatosSubCategiasTerminado(DateTime momento) : super(momento);
}

class EstadoPedidoProcesoDatosProductosTerminado extends BlocPedidoEstado {
  const EstadoPedidoProcesoDatosProductosTerminado(DateTime momento) : super(momento);
}

class EstadoPedidoProcesoDatosCategiasError extends BlocPedidoEstado {
  const EstadoPedidoProcesoDatosCategiasError(DateTime momento) : super(momento);
}

class EstadoPedidoProcesoDatosSubCategiasError extends BlocPedidoEstado {
  const EstadoPedidoProcesoDatosSubCategiasError(DateTime momento) : super(momento);
}

class EstadoPedidoProcesoDatosProductosError extends BlocPedidoEstado {
  const EstadoPedidoProcesoDatosProductosError(DateTime momento) : super(momento);
}

class EstadoPedidoActualizado extends BlocPedidoEstado {
  const EstadoPedidoActualizado(DateTime momento) : super(momento);
}

class EstadoPedidoEliminado extends BlocPedidoEstado {
  const EstadoPedidoEliminado(DateTime momento) : super(momento);
}