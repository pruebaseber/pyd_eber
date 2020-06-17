import 'package:pyd_eber/all-exports.dart';

class UIInternalLogs extends StatefulWidget {
  @override
  _UIInternalLogsState createState() => _UIInternalLogsState();
}

class _UIInternalLogsState extends State<UIInternalLogs> {
    OverlayEntry _vistaMensajes;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
//                    this._vistaMensajes = this._crearVistaMensajes();
//                    Overlay.of(context).insert(this._vistaMensajes);
      },
      child: Container(
        height: Responsive.altoBarraEstado,
        width: Responsive.altoBarraEstado,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 3,
            color: (AppRes.appResMap[Co.FONDO_6] as Color)
                .withAlpha(128),
          ),
          color: AppRes.appResMap[Co.FONDO_6],
        ),

        child: Icon(
          Icons.question_answer,
          color: Colors.white,
        ),
      ),
    );
  }

//
//  OverlayEntry _crearVistaMensajes() {
//    RenderBox renderBox = context.findRenderObject();
//    var size = renderBox.size;
//    var offset = renderBox.localToGlobal(Offset.zero);
//
//    return OverlayEntry(
//      builder: (context) {
//        return Positioned(
//          left: 0, //offset.dx,
//          top: 0, // offset.dy + size.height + 5.0,
//          width: size.width,
//          child: Material(
//            elevation: 4.0,
//            child: ListView(
//              padding: EdgeInsets.zero,
//              shrinkWrap: true,
//              children: <Widget>[
//                ListTile(
//                  title: Text('Syria'),
//                ),
//                ListTile(
//                  title: Text('Lebanon'),
//                )
//              ],
//            ),
//          ),
//        );
//      },
//    );
//  }
}
