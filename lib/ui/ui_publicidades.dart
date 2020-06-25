/*
 Proyecto: P & D
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: Publicidades
 [Pedidos & Domicilios/Pedidos & Domicilios/Publicidades]
*/

import 'package:pyd_eber/all-exports.dart';
import 'package:pyd_eber/modelos/publicidades.dart';
import 'package:pyd_eber/ui/ui_publicidades_edicion.dart';
import 'package:pyd_eber/ui/ui_publicidades_item.dart';


class UIPublicidades extends StatefulWidget {
  UIPublicidades({Key key}) : super(key: key);
  static const String ruta = '/publicidades';
  final v = Vidget();

  @override
  State createState() => _EstadoPublicidades();
}

class _EstadoPublicidades extends State<UIPublicidades> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Publicidad> lista = List<Publicidad>();

  @override
  Widget build(BuildContext context) {
    widget.v.titulo = PUBLICIDADES.ETIQUETA_ENTIDAD;

    Responsive.calcularResponsive(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppRes.appResMap[Co.COLOR_FONDO_TITULO_LISTA],
        title: Text(
            widget.v.titulo,
            style: estiloTituloPantalla,
        ),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: PyDBase(
        //screenTitle: 'Publicidades',
        contentChild: StreamBuilder(
          stream: PublicidadesFB.onValue(),
          builder: (context, snap) {
            List items = dataWebMobile(snap);
            if (items != null) {
//              items.sort((a, b) =>
//                  a[PUBLICIDADES.NOMBREEMPRESAQUEPAGAPUBLICIDAD]
//                      .compareTo(b[PUBLICIDADES.NOMBREEMPRESAQUEPAGAPUBLICIDAD]));
              return GridView.builder(
                  itemCount: items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: Responsive.itemsGrid,
                    crossAxisSpacing: Responsive.margenEntreItemsGrid,
                    mainAxisSpacing: Responsive.margenEntreItemsGrid,
                    childAspectRatio: Responsive.radioAspectoItemGrid,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    Publicidad registro = Publicidad();
                    registro.fromMap(items[index]);
                    return UIPublicidadItem(
                      registro: registro,
                      animation: null,
                    );
                  });
            } else
              return Center(
                  child: Text(
                "Leyendo datos",
                style: estiloListados.copyWith(fontSize: 40),
              ));
          },
        ),
        actionBtnsChild: Container(
          color: AppRes.appResMap[Co.COLOR_PRINCIPAL],
          padding: EdgeInsets.symmetric(
              vertical: Responsive.paddingVerticalContenido,
              horizontal: Responsive.paddingHorizontalContenido),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppRes.appResMap[Co.COLOR_PRINCIPAL],
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) =>
                UIPublicidadesEdicion(
                  registro: Publicidad(

                  ),
                )
          ));
        },
      ),
    );
  }
}
