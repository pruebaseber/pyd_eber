import 'package:pyd_eber/all-exports.dart';

class BusquedaDelegate extends SearchDelegate<String> {
  RegProducto productoSeleccionado = RegProducto();
  List<RegProducto> mostrarLista = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
//    throw UnimplementedError();
    return [
      IconButton(
        icon: Icon(
          Icons.cancel,
//          color: Colors.white,
        ),
        onPressed: () {
          query = '';
//          DEM.modoBusqueda = !DEM.modoBusqueda;
          // TODO: lo demás y refrescar
//          parentState.setState(() {});
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
//    throw UnimplementedError();
    return IconButton(
      icon: Icon(Icons.arrow_back),
//      icon: AnimatedIcon(
//        icon: AnimatedIcons.menu_arrow,
//        progress: transitionAnimation,
//        color: Colors.white,
//      ),
      onPressed: () {
        close(context, query);
//        DEM.modoBusqueda = !DEM.modoBusqueda;
        // TODO: lo demás y refrescar
//        parentState.setState(() {});
      },
    );
  }

//  @override
//  Animation<double> get transitionAnimation {
//    return AnimationController(duration: Duration(milliseconds: 500), vsync: null);
//  }

  @override
  Widget buildResults(BuildContext context) {
    if ((productoSeleccionado.codigoProducto == null) | (productoSeleccionado.codigoProducto == '')) {
      if (mostrarLista.length == 0) {
        return Container(
          width: CD.ancho,
          height: CD.alto,
          child: Stack(
            children: [
              UIFondo(),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    UILogo(),
                    Container(
                      width: 350,
//              height: 150,
                      child: Text(
                        query.isEmpty
                            ? 'Escriba una palabra para buscarla en los Productos'
                            : '"$query" No encontrado.',
                        softWrap: true,
                        style: estiloTituloPantalla.copyWith(
                          color: query.isEmpty
                              ? AppRes.appResMap[Co.COLOR_6]
                              : Colors.red,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
      productoSeleccionado.assign(mostrarLista[0]);
    }
    return BlocProvider(
      create: (context) => BlocPedido(),
      child: Container(
        width: CD.ancho,
        height: CD.alto,
        child: Center(
          child: Container(
            width: Responsive.anchoItemProd,
            height: Responsive.anchoItemProd,
            child: UIRegProductoItem(
              registro: productoSeleccionado,
              animation: null,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    mostrarLista = query.isEmpty
        ? []
        : DEM.listaProductoBusqueda
            .where((producto) =>
                producto.nombre.toLowerCase().contains(query.toLowerCase()) &
                (producto.existencia > 0))
            .toList();
    print(
        'Query: $query Total Productos ${DEM.listaProductoBusqueda.length} Filtrado ${mostrarLista.length}');
    if (mostrarLista.length == 0) {
      return Container(
        width: CD.ancho,
        height: CD.alto,
        child: Stack(
          children: [
            UIFondo(),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UILogo(),
                  Container(
                    width: 350,
//              height: 150,
                    child: Text(
                      query.isEmpty
                          ? 'Escriba una palabra para buscarla en los Productos'
                          : '"$query" No encontrado.',
                      softWrap: true,
                      style: estiloTituloPantalla.copyWith(
                        color: query.isEmpty
                            ? AppRes.appResMap[Co.COLOR_6]
                            : Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    return Container(
      width: CD.ancho,
      height: Responsive.altoContenido,
      child: Stack(
        children: [
          UIFondo(),
          Column(
            children: [
              Flexible(
                child: ListView.builder(
                  itemCount: mostrarLista.length,
                  itemBuilder: (context, index) {
//
//        print('Para Mostrar...');
//        print(mostrarLista[index].codigoProducto);
//        print(mostrarLista[index].nombre);
//        print(mostrarLista[index].venta1);
//        print(mostrarLista[index].existencia);
                    return GestureDetector(
                      onTap: () {
                        productoSeleccionado.assign(mostrarLista[index]);
                        showResults(context);
                      },
                      child: ListTile(
                        leading: Image(
                          image: imagenLocalWeb(
                            mostrarLista[index].codigoProducto,
                            DEM.carpetaImagenesLocalesProductos,
                            imgUrlCodigo(mostrarLista[index].codigoProducto),
                          ),
                          fit: BoxFit.fitHeight,
                          width: 50,
                          height: 50,
                          errorBuilder: (context, object, stackTrace) {
                            return Container(
                              width: 50,
                              height: 50,
                              child: Icon(
                                Icons.not_interested,
                                size: 40,
                              ),
                            );
                          },
                        ),
                        title: Text(
                          mostrarLista[index].nombre.split('*')[0],
                          style: estiloProductoBusqueda.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          mostrarLista[index].nombre.split('*').length > 1
                              ? mostrarLista[index].nombre.split('*')[1]
                              : '',
                          style: estiloProductoBusqueda,
                        ),
                        trailing: Text(
                          '\$ ' + mostrarLista[index].venta1,
                          style: estiloProductoBusqueda.copyWith(fontSize: 16),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
