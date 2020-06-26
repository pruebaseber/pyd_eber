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


class UIPublicidadItem extends StatefulWidget {
  UIPublicidadItem({
    this.registro,
    this.animation,
  });

  final Publicidad registro;
  final Animation animation;

  @override
  _UIPublicidadItemState createState() => _UIPublicidadItemState();
}

class _UIPublicidadItemState extends State<UIPublicidadItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => UIPublicidadesEdicion(
                        registro: widget.registro,
                  ),
              ),
          );
        },
        child: Container(
          // height: Co.ALTO_ITEMS_LISTADOS,
          width: CD.ancho,
          color: AppRes.appResMap[Co.COLOR_FONDO_ITEM_LISTA],
          margin: const EdgeInsets.symmetric(vertical: Co.MARGEN_ITEMS_LISTADOS_VERTICAL),
          padding: const EdgeInsets.all(Co.PADDING_ITEMS_LISTADOS_VERTICAL),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
//                  Text(widget.registro.nombreEmpresaquepagaPublicidad,
//                      style: estiloListados),
//                  Text(widget.registro.sitioweb,
//                      style: estiloListados),
//                  Text(widget.registro.nombreinterno,
//                      style: estiloListados),
//                  Text(widget.registro.fechaActivacion.toString(),
//                      style: estiloListados),
//                  Text(widget.registro.fechaDesactivacion.toString(),
//                      style: estiloListados),
//                  Text(widget.registro.repetir,
//                      style: estiloListados),
                  Text(widget.registro.repetircada.toString(),
                      style: estiloListados),
                  Text(widget.registro.imagen,
                      style: estiloListados),
                  Text(widget.registro.producto,
                      style: estiloListados),
                  Text(widget.registro.nivelPrioridad.toString(),
                      style: estiloListados),
                  Text(widget.registro.nota,
                      style: estiloListados),
                ],
              )
            ],
          )
        ),
    );
  }
}
