/*
 Proyecto: Delfin API
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: Sub Categorías
 [API Delfín/Datos/Sub Categorías]
*/

import 'dart:io';

import 'package:pyd_eber/all-exports.dart';

class UISubCategorias extends StatefulWidget {
  UISubCategorias({Key key}) : super(key: key);
  static const String ruta = '/subcategorias';

  @override
  State createState() => _EstadoSubCategorias();
}

class _EstadoSubCategorias extends State<UISubCategorias> {
  @override
  Widget build(BuildContext context) {
    if ((DEM.regCategoria.nombre == null) | (DEM.regCategoria.nombre == '')) {
      Navigator.pop(context);
      return Container();
    }
    Responsive.calcularResponsive(context);
    return BlocProvider(
      create: (context) => BlocPedido(),
      child: UISubCategoriasScafold(),
    );
  }
}

class UISubCategoriasScafold extends StatefulWidget {
  @override
  _UISubCategoriasScafoldState createState() => _UISubCategoriasScafoldState();
}

class _UISubCategoriasScafoldState extends State<UISubCategoriasScafold> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    //
    final listaSubCategoriasFiltradas =
        DEM.listaSubCategoria[DEM.regCategoria.codigoCategoria];
    //
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          DEM.regCategoria.nombre.toLowerCase(),
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
              width: Responsive.anchoContenido,
              height: Responsive.altoContenido,
              child: GridView.builder(
                  itemCount: listaSubCategoriasFiltradas.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: Responsive.itemsCatSubCat,
                    crossAxisSpacing: Responsive.margenEntreItemsCatSubCat,
                    mainAxisSpacing: Responsive.margenEntreItemsCatSubCat,
                    childAspectRatio: Responsive.radioAspectoItemCatSubCat,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    RegSubCategoria registro =
                        listaSubCategoriasFiltradas[index];
                    if (registro.imagen == null) {
                      registro.imagen =
                          registro.nombre.toLowerCase().replaceAll(' ', '_') +
                              '__0.jpg';
                    }
                    return UIRegSubCategoriaItem(
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
