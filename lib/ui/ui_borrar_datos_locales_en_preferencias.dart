import 'package:pyd_eber/all-exports.dart';

class UIBorrarDatosLocalesEnPreferencias extends StatefulWidget {
  @override
  _UIBorrarDatosLocalesEnPreferenciasState createState() =>
      _UIBorrarDatosLocalesEnPreferenciasState();
}

class _UIBorrarDatosLocalesEnPreferenciasState
    extends State<UIBorrarDatosLocalesEnPreferencias> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 100,
        child: GestureDetector(
          onTap: () {
            BlocCategoria categoriaBloc =
                BlocProvider.of<BlocCategoria>(context);
            categoriaBloc.categoriaProcesosBloc.borrarPreferenciasCategoria();

//            BlocMedioPago medioPagoBloc =
//            BlocProvider.of<BlocMedioPago>(context);
//            medioPagoBloc.medioPagoProcesosBloc.borrarPreferenciasMedioPago();

            BlocSubCategoria subCategoriaBloc =
            BlocProvider.of<BlocSubCategoria>(context);
            subCategoriaBloc.subCategoriaProcesosBloc.borrarPreferenciasSubCategoria();

            BlocProducto productoBloc =
            BlocProvider.of<BlocProducto>(context);
            productoBloc.productoProcesosBloc.borrarPreferenciasProducto();
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Borrar Preferencias'),],
          ),
        ));
  }
}
