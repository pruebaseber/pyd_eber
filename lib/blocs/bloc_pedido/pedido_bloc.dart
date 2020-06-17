import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pyd_eber/blocs/bloc_pedido/pedido_procesos.dart';
import './bloc.dart';
import 'package:rxdart/rxdart.dart';

class BlocPedido extends Bloc<BlocPedidoEvent, BlocPedidoEstado> {

  ProcesosPedidos pedidoProcesosBloc;

  @override
  BlocPedidoEstado get initialState {
    pedidoProcesosBloc = ProcesosPedidos(this);
    return InitialBlocPedidoState(DateTime.now());
  }

///*
//  @override
//  Stream<Transition<BlocPedidoEvent, BlocPedidoState>> transformEvents(
//      Stream<BlocPedidoEvent> events,
//      TransitionFunction<BlocPedidoEvent, BlocPedidoState> transitionFn,
//      ) {
//    return super.transformEvents(
//      events.debounceTime(const Duration(milliseconds: 150)),
//      transitionFn,
//    );
//  }
//*/

  @override
  Stream<BlocPedidoEstado> mapEventToState(
    BlocPedidoEvent event,
  ) async* {

    if (event is EventoPedidoDatosCategoriaProcesoTerminado) {
      yield EstadoPedidoProcesoDatosCategiasTerminado(DateTime.now());
    }
    if (event is EventoPedidoDatosSubCategoriaProcesoTerminado) {
      yield EstadoPedidoProcesoDatosSubCategiasTerminado(DateTime.now());
    }
    if (event is EventoPedidoDatosProductoProcesoTerminado) {
      yield EstadoPedidoProcesoDatosProductosTerminado(DateTime.now());
    }
    if (event is EventoPedidoDatosCategoriaProcesoError) {
      yield EstadoPedidoProcesoDatosCategiasError(DateTime.now());
    }
    if (event is EventoPedidoDatosSubCategoriaProcesoError) {
      yield EstadoPedidoProcesoDatosSubCategiasError(DateTime.now());
    }
    if (event is EventoPedidoDatosProductoProcesoError) {
      yield EstadoPedidoProcesoDatosProductosError(DateTime.now());
    }

    if (event is EventoPedidoProductoSumado) {
      yield EstadoPedidoActualizado(DateTime.now());
    }

    if (event is EventoPedidoProductoRestado) {
      yield EstadoPedidoActualizado(DateTime.now());
    }

    if (event is EventoPedidoProductoEliminado) {
      yield EstadoPedidoActualizado(DateTime.now());
    }

    if (event is EventoPedidoEliminado) {
      yield EstadoPedidoEliminado(DateTime.now());
    }

  }

}
