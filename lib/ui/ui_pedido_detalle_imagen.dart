import 'package:pyd_eber/all-exports.dart';

class UIPedidoDetalleImagen extends StatelessWidget {
  UIPedidoDetalleImagen(this.detPedido);

  final DetPedido detPedido;

  @override
  Widget build(BuildContext context) {
    double ancho = Responsive.anchoItemProd / 3;
    return ClipRRect(
      borderRadius: BorderRadius.circular(ancho * .15),
      child: Image(
        image: imagenLocalWeb(
          detPedido.producto,
          DEM.carpetaImagenesLocalesProductos,
          detPedido.imagen,
        ),
        fit: BoxFit.fitHeight,
        width: ancho * .8,
        height: ancho * .8,
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
    );
  }
}
