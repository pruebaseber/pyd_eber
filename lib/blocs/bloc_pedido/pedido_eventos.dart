import 'package:pyd_eber/all-exports.dart';


@immutable
abstract class BlocPedidoEvent {
  const BlocPedidoEvent();
}

class EventoPedidoDatosCategoriaProcesoTerminado extends BlocPedidoEvent {
  const EventoPedidoDatosCategoriaProcesoTerminado();
}

class EventoPedidoDatosSubCategoriaProcesoTerminado extends BlocPedidoEvent {
  const EventoPedidoDatosSubCategoriaProcesoTerminado();
}

class EventoPedidoDatosProductoProcesoTerminado extends BlocPedidoEvent {
  const EventoPedidoDatosProductoProcesoTerminado();
}

class EventoPedidoDatosProductoBusquedaProcesoTerminado extends BlocPedidoEvent {
  const EventoPedidoDatosProductoBusquedaProcesoTerminado();
}

class EventoPedidoDatosCategoriaProcesoError extends BlocPedidoEvent {
  const EventoPedidoDatosCategoriaProcesoError();
}

class EventoPedidoDatosSubCategoriaProcesoError extends BlocPedidoEvent {
  const EventoPedidoDatosSubCategoriaProcesoError();
}

class EventoPedidoDatosProductoProcesoError extends BlocPedidoEvent {
  const EventoPedidoDatosProductoProcesoError();
}

class EventoPedidoDatosProductoBusquedaProcesoError extends BlocPedidoEvent {
  const EventoPedidoDatosProductoBusquedaProcesoError();
}

class EventoPedidoProductoSumado extends BlocPedidoEvent {
  const EventoPedidoProductoSumado();
}

class EventoPedidoProductoRestado extends BlocPedidoEvent {
  const EventoPedidoProductoRestado();
}

class EventoPedidoProductoEliminado extends BlocPedidoEvent {
  const EventoPedidoProductoEliminado();
}
class EventoPedidoEliminado extends BlocPedidoEvent {
  const EventoPedidoEliminado();
}
