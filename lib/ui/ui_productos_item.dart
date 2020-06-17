/*
 Proyecto: Delfin API
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: Productos
 [API Delfín/Datos/Productos]
*/

import 'package:pyd_eber/all-exports.dart';
//import 'package:pyd_eber_clientes/pyd/artilugios/ui_opciones-item-producto.dart';

class UIRegProductoItem extends StatefulWidget {
  UIRegProductoItem({
    this.registro,
    this.animation,
  });

  final RegProducto registro;
  final Animation animation;

  @override
  _UIRegProductoItemState createState() => _UIRegProductoItemState();
}

String imgUrlCodigo(codigo) {
//  print('Buscando imagen por código...');
  final resultado =
      DEM.listaImagenCodigoProducto.where((x) => x.codigo == codigo).toList();
  if (resultado.length > 0) {
    return resultado[0].imagen;
  }
  return null;
}

class _UIRegProductoItemState extends State<UIRegProductoItem> {
  @override
  Widget build(BuildContext context) {
    //
    final img_url = imgUrlCodigo(widget.registro.codigoProducto);
    //
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(Responsive.anchoItemProd * .03),
          child: Container(
            width: Responsive.anchoItemProd,
            color: Colors.transparent,
//      color: AppRes.appResMap[Co.COLOR_FONDO_ITEM_LISTA],
            child: Stack(
              children: [
                Container(
                  width: Responsive.anchoItemProd,
                  margin: EdgeInsets.only(
                      top: 0,
                      left: Responsive.margenEntreItemsProd,
                      right: Responsive.margenEntreItemsProd),
//              height: DEM.anchoItemProd * .5,
                  color: Colors.transparent,
                  child: img_url == null
                      ? Center(
                          child: Text(
                            'Imagen\nPendiente',
                            textAlign: TextAlign.center,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(
                              Responsive.anchoItemProd * .02),
                          child: Image(
                            image: imagenLocalWeb(
                              widget.registro.codigoProducto,
                              DEM.carpetaImagenesLocalesProductos,
                              imgUrlCodigo(widget.registro.codigoProducto),
                            ),
                            fit: BoxFit.fitHeight,
                            width: Responsive.anchoItemProd * .8,
                            height: Responsive.anchoItemProd * .8,
                            errorBuilder: (context, object, stackTrace) {
                              // TODO: Reintentar cargar la imagen ???
                              return Center(
                                child: Text('Error\nde\nConexión'),
                              );
                            },
                          ),

//                          child: Image.network(
//                            img_url,
//                            fit: BoxFit.fitHeight,
//                            width: Responsive.anchoItemProd * .8,
//                            height: Responsive.anchoItemProd * .8,
//                            errorBuilder: (context, object, stackTrace) {
//                              // TODO: Reintentar cargar la imagen ???
//                              return Center(
//                                child: Text('Error\nde\nConexión'),
//                              );
//                            },
//                          ),
                        ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.registro.codigoProducto,
                                textScaleFactor: 1.35,
                                style: estiloProducto,
                              ),
                              Text(
                                Cantidad(widget.registro.existencia),
                                textScaleFactor: 1.35,
                                style: estiloProducto,
                              ),
                            ],
                          ),
                          Text(
                            widget.registro.nombre.split('*')[0],
                            textScaleFactor: 1.35,
                            style: estiloProducto,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.registro.nombre.split('*').length > 1
                                    ? widget.registro.nombre.split('*')[1]
                                    : '',
                                textScaleFactor: 1.25,
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                '\$ ' + widget.registro.venta1,
                                textScaleFactor: 1.8,
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        UIOpcionesItemProducto(
          Responsive.anchoItemProd,
          Responsive.anchoItemProd * .8,
          registro: widget.registro,
        ),
      ],
    );
  }
}
