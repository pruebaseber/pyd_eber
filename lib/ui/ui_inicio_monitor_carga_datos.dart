import 'package:pyd_eber/all-exports.dart';

class UIInicioMonitorCargaDatos extends StatefulWidget {
  static final double fontSize = 10;
  static final Color color = (AppRes.appResMap[Co.COLOR_6] as Color).withAlpha(128);
  static final Color colorError = Colors.red.withAlpha(128);

  @override
  _UIInicioMonitorCargaDatosState createState() => _UIInicioMonitorCargaDatosState();
}

class _UIInicioMonitorCargaDatosState extends State<UIInicioMonitorCargaDatos> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.symmetric(horizontal: CD.ancho * .1),
      width: CD.ancho * .8,
      child: Column(
        children: [
          UIInicioMiPedido(),
          UIInicioControlCategorias(),
          UIInicioControlSubCategorias(),
          UIInicioControlProductos(),
          UIInicioControlProductoBusqueda(),
        ],
      ),
    );
  }
}

class UIInicioControlCategorias extends StatefulWidget {
  @override
  _UIInicioControlCategoriasState createState() =>
      _UIInicioControlCategoriasState();
}

class _UIInicioControlCategoriasState extends State<UIInicioControlCategorias> {
  BlocPedido blocPedido;
  bool lTerminado = false;

  @override
  Widget build(BuildContext context) {
    if (blocPedido == null)
      blocPedido = BlocProvider.of<BlocPedido>(context);

    return BlocBuilder<BlocCategoria, CategoriaEstado>(
      builder: (context, state) {

        if (state is EstadoResultadoProcesosTerminadosCategoria) {
          blocPedido.add(EventoPedidoDatosCategoriaProcesoTerminado());
          lTerminado = true;
        }
        if (lTerminado) return Container();

        if (state is EstadoErrorEnProcesosCategoria) {
          blocPedido.add(EventoPedidoDatosCategoriaProcesoError());
        }

        return UIInicioControlMensaje(state.resultadoProceso);

      },
    );
  }
}

class UIInicioControlSubCategorias extends StatefulWidget {
  @override
  _UIInicioControlSubCategoriasState createState() =>
      _UIInicioControlSubCategoriasState();
}

class _UIInicioControlSubCategoriasState
    extends State<UIInicioControlSubCategorias> {
  BlocPedido blocPedido;
  bool lTerminado = false;

  @override
  Widget build(BuildContext context) {
    if (blocPedido == null)
      blocPedido = BlocProvider.of<BlocPedido>(context);
    return BlocBuilder<BlocSubCategoria, SubCategoriaEstado>(
      builder: (context, state) {

        if (state is EstadoResultadoProcesosTerminadosSubCategoria) {
          blocPedido.add(EventoPedidoDatosSubCategoriaProcesoTerminado());
          lTerminado = true;
        }

        if (lTerminado) return Container();

        if (state is EstadoErrorEnProcesosSubCategoria) {
          blocPedido.add(EventoPedidoDatosSubCategoriaProcesoError());
        }

        return UIInicioControlMensaje(state.resultadoProceso);

      },
    );
  }
}

class UIInicioControlProductos extends StatefulWidget {
  @override
  _UIInicioControlProductosState createState() =>
      _UIInicioControlProductosState();
}

class _UIInicioControlProductosState extends State<UIInicioControlProductos> {
  BlocPedido blocPedido;
  bool lTerminado = false;

  @override
  Widget build(BuildContext context) {
    if (blocPedido == null)
      blocPedido = BlocProvider.of<BlocPedido>(context);
    return BlocBuilder<BlocProducto, ProductoEstado>(
      builder: (context, state) {
        if (state is EstadoResultadoProcesosTerminadosProducto) {
          blocPedido.add(EventoPedidoDatosProductoProcesoTerminado());
          lTerminado = true;
        }

        if (lTerminado) return Container();

        if (state is EstadoErrorEnProcesosProducto) {
          blocPedido.add(EventoPedidoDatosProductoProcesoError());
        }

        return UIInicioControlMensaje(state.resultadoProceso);
      },
    );
  }
}


class UIInicioControlProductoBusqueda extends StatefulWidget {
  @override
  _UIInicioControlProductoBusquedaState createState() =>
      _UIInicioControlProductoBusquedaState();
}

class _UIInicioControlProductoBusquedaState extends State<UIInicioControlProductoBusqueda> {
  BlocPedido blocPedido;
  bool lTerminado = false;

  @override
  Widget build(BuildContext context) {
    if (blocPedido == null)
      blocPedido = BlocProvider.of<BlocPedido>(context);
    return BlocBuilder<BlocProductoBusqueda, ProductoBusquedaEstado>(
      builder: (context, state) {
        if (state is EstadoResultadoProcesosTerminadosProductoBusqueda) {
          blocPedido.add(EventoPedidoDatosProductoBusquedaProcesoTerminado());
          lTerminado = true;
        }

        if (lTerminado) return Container();

        if (state is EstadoErrorEnProcesosProductoBusqueda) {
          blocPedido.add(EventoPedidoDatosProductoBusquedaProcesoError());
        }

        return UIInicioControlMensaje(state.resultadoProceso);
      },
    );
  }
}

class UIInicioControlMensaje extends StatelessWidget {
  UIInicioControlMensaje(this.resultadoProceso);
  final ResultadoProceso resultadoProceso;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: CD.ancho * .8,
      color: Colors.transparent,
      child: Text(
        '${resultadoProceso.error ? 'Error' : ''} ${resultadoProceso.mensaje} (${resultadoProceso.codigo})',
        style: TextStyle(
          color: resultadoProceso.error ? UIInicioMonitorCargaDatos.colorError : UIInicioMonitorCargaDatos.color,
          fontSize: UIInicioMonitorCargaDatos.fontSize,
        ),
      ),
    );
  }
}
