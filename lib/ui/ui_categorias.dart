/*
 Proyecto: Delfin API
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: Categorías
 [API Delfín/Datos/Categorías]
*/

import 'dart:io';

import 'package:pyd_eber/all-exports.dart';

class UICategorias extends StatefulWidget {
  UICategorias({Key key}) : super(key: key);
  static const String ruta = '/categorias';

  @override
  _UICategoriasState createState() => _UICategoriasState();
}

class _UICategoriasState extends State<UICategorias> {

  @override
  Widget build(BuildContext context) {
    Responsive.calcularResponsive(context);
    return BlocProvider(
      create: (context) => BlocPedido(),
      child: UICategoriaScafold(),
    );
  }
}

class UICategoriaScafold extends StatefulWidget {
  @override
  _UICategoriaScafoldState createState() => _UICategoriaScafoldState();
}

class _UICategoriaScafoldState extends State<UICategoriaScafold> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Categorías',
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
                itemCount: DEM.listaCategoria.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Responsive.itemsCatSubCat,
                  crossAxisSpacing: Responsive.margenEntreItemsCatSubCat,
                  mainAxisSpacing: Responsive.margenEntreItemsCatSubCat,
                  childAspectRatio: Responsive.radioAspectoItemCatSubCat,
                ),
                itemBuilder: (BuildContext context, int index) {
                  RegCategoria registro = DEM.listaCategoria[index];
                  return UIRegCategoriaItem(
                    registro: registro,
                    animation: null,
                  );
                },
              ),
            ),
          ],
        ),
        actionBtnsChild: UIBarraEstado(),
      ),
    );
  }
}
