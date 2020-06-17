/*
 Proyecto: Delfin API
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: Productos
 [API Delfín/Datos/Productos]
*/

import 'dart:io';

import 'package:pyd_eber/all-exports.dart';

class UIProductos extends StatefulWidget {
  UIProductos({Key key}) : super(key: key) {
    if (DEM.regSubCategoria.nombre == null) {
      final cat =
          '{"key": "01", "CodigoCategoria": "01", "Nombre": "ABARROTES", "Imagen": "ABARROTES__0.jpg"}';
      final subcat =
          '{"key": "01002", "CodigoSubCategoria": "01002", "Nombre": "ACEITES", "Imagen": "ACEITES__0.jpg"}';
      DEM.regCategoria.fromMap(json.decode(cat));
      DEM.regSubCategoria.fromMap(json.decode(subcat));
      ProductoFB.filtrar(DEM.regSubCategoria.codigoSubCategoria);
      if (DEM.listaImagenCodigoProducto.length == 0) {
        DEM.inicializarConfiguracion();
      }
    }
  }

  static const String ruta = '/productos';

  @override
  State createState() => _EstadoProductos();
}

class _EstadoProductos extends State<UIProductos> {
  @override
  Widget build(BuildContext context) {
    if ((DEM.regSubCategoria.nombre == null) |
        (DEM.regSubCategoria.nombre == '')) {
      Navigator.pop(context);
      return Container();
    }
    Responsive.calcularResponsive(context);

    return BlocProvider(
      create: (context) => BlocPedido(),
      child: UIProductosScaffold(),
    );
  }
}

class UIProductosScaffold extends StatefulWidget {
  @override
  _UIProductosScaffoldState createState() => _UIProductosScaffoldState();
}

class _UIProductosScaffoldState extends State<UIProductosScaffold> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppRes.appResMap[Co.COLOR_FONDO_ITEM_LISTA],
      appBar: AppBar(
        title: Text(
          DEM.regSubCategoria.nombre.toLowerCase(),
          style: estiloTituloPantalla,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              showSearch<String>(
                context: context,
                delegate: BusquedaDelegate(),
              ).then((value) {
                context.bloc<BlocPedido>().add(EventoPedidoProductoEliminado());
              });
            },
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: AppRes.appResMap[Co.COLOR_FONDO_TITULO_LISTA],
        elevation: kIsWeb
            ? 0 // Web
            : Platform.isIOS
                ? 0 // iOS
                : 4,
      ),
      body: PyDBase(
        contentChild: Stack(
          children: [
            UIFondo(),
            Container(
              width: Responsive.ancho,
              height: Responsive.altoContenido,
              child: DEM.listaProductosFiltrados == null
                  ? SingleChildScrollView(
                      child: Container(
                        width: Responsive.anchoContenido,
                        child: Text(DEM.internalLog.toString()),
                      ),
                    )
                  : GridView.builder(
                      itemCount: DEM.listaProductosFiltrados == null
                          ? 0
                          : DEM.listaProductosFiltrados.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: Responsive.itemsProd,
                        crossAxisSpacing: Responsive.margenEntreItemsProd,
                        mainAxisSpacing: Responsive.margenEntreItemsProd,
                        childAspectRatio: Responsive.radioAspectoItemProd,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        RegProducto registro =
                            DEM.listaProductosFiltrados[index];
                        return UIRegProductoItem(
                          registro: registro,
                          animation: null,
                        );
                      }),
            ),
          ],
        ),
        actionBtnsChild: UIBarraEstado(),
      ),
    );
  }
}
