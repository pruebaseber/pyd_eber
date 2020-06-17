/*
 Proyecto: Delfin API
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: Categorías
 [API Delfín/Datos/Categorías]
*/

import 'package:pyd_eber/all-exports.dart';

class UIRegCategoriaItem extends StatefulWidget {
  UIRegCategoriaItem({
    this.registro,
    this.animation,
  });

  final RegCategoria registro;
  final Animation animation;

  @override
  _UIRegCategoriaItemState createState() => _UIRegCategoriaItemState();
}

class _UIRegCategoriaItemState extends State<UIRegCategoriaItem> {
  @override
  Widget build(BuildContext context) {
//  https://firebasestorage.googleapis.com/v0/b/la2000-pyd.appspot.com/o/imagenes_categorias%2Fabarrotes__0.jpg?alt=media&token=9630e790-f88c-47ba-b56e-d84d9f680374
    return GestureDetector(
      onTap: () {
        DEM.regCategoria.assign(widget.registro);
        DEM.mapaRegCategoria = DEM.regCategoria.toMap();
        Navigator.pushNamed(context, UISubCategorias.ruta).then((value) {
          setState(() {
            context.bloc<BlocPedido>().add(EventoPedidoProductoEliminado());
          });
        });
      },
      child: Container(
        width: Responsive.anchoItemCatSubCat,
        color: Colors.transparent,  // AppRes.appResMap[Co.COLOR_FONDO_ITEM_LISTA],
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 25, left: 20, bottom: 0, right: 0),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(Responsive.anchoItemCatSubCat * .02),
                child: Image(
                  image: imagenLocalWeb(
                    widget.registro.imagen.toLowerCase(),
                    DEM.carpetaImagenesLocalesCategorias,
                    DEM.urlImagenesWebCategorias,
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
//                child: Image.network(
//                  'https://firebasestorage.googleapis.com/v0/b/la2000-pyd.appspot.com/o/imagenes_categorias%2F${widget.registro.imagen.toLowerCase()}?alt=media',
//                  fit: BoxFit.fitWidth,
//                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: PyDTextShadow(
                text: widget.registro.nombre
                    .toLowerCase()
                    .replaceFirst('alimentos para aves', 'alimento aves'),
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
