/*
 Proyecto: Delfin API
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: Sub Categorías
 [API Delfín/Datos/Sub Categorías]
*/

import 'package:pyd_eber/all-exports.dart';

class UIRegSubCategoriaItem extends StatefulWidget {
  UIRegSubCategoriaItem({
    this.registro,
    this.animation,
  });

  final RegSubCategoria registro;
  final Animation animation;

  @override
  _UIRegSubCategoriaItemState createState() => _UIRegSubCategoriaItemState();
}

class _UIRegSubCategoriaItemState extends State<UIRegSubCategoriaItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DEM.regSubCategoria.assign(widget.registro);
        DEM.mapaRegSubCategoria = DEM.regSubCategoria.toMap();
        DEM.listaProductosFiltrados.clear();
        DEM.listaProductosFiltrados.addAll(DEM
            .listaProducto[DEM.regSubCategoria.codigoSubCategoria]
            .where((element) => element.existencia > 0));
        print(
            'Productos Filtrados Existencia > 0 => Registros: ${DEM.listaProductosFiltrados.length}');
        Navigator.pushNamed(context, UIProductos.ruta).then((value) {
          setState(() {
            context.bloc<BlocPedido>().add(EventoPedidoProductoEliminado());
          });
        });
      },
      child: Container(
        width: Responsive.anchoItemCatSubCat,
        color: Colors.transparent,
        // AppRes.appResMap[Co.COLOR_FONDO_ITEM_LISTA],
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 25, bottom: 0, left: 20, right: 0),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(Responsive.anchoItemCatSubCat * .02),
                child: Image(
                  image: imagenLocalWeb(
                    widget.registro.imagen
                        .toLowerCase()
                        .replaceAll('é', 'e')
                        .replaceAll('ñ', 'n'),
                    DEM.carpetaImagenesLocalesSubCategorias,
                    DEM.urlImagenesWebSubCategorias,
                  ),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topLeft,
                  width: Responsive.anchoItemProd * .8,
                  height: Responsive.anchoItemProd * .8,
                  errorBuilder: (context, object, stackTrace) {
                    // TODO: Reintentar cargar la imagen ???
                    return Center(
                      child: Text('Error\nde\nConexión'),
                    );
                  },
                ),
//  https://firebasestorage.googleapis.com/v0/b/la2000-pyd.appspot.com/o/imagenes_subcategorias%2Falimentos_gatos__0.jpg?alt=media&token=ccbdfdc1-77f9-4f8b-acee-4a23ce162e1d
//                child: Image.network(
//                  'https://firebasestorage.googleapis.com/v0/b/la2000-pyd.appspot.com/o/imagenes_subcategorias%2F${widget.registro.imagen.toLowerCase().replaceAll('é', 'e')}?alt=media',
//                  fit: BoxFit.fitWidth,
//                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: PyDTextShadow(
                text: widget.registro.nombre.toLowerCase(),
                scale: 3,
                xShadow: 2,
                yShadow: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
