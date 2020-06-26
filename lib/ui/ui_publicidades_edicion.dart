// Proyecto: P & D
// Version: 1.0.0
// Autor: Alse Developers
// Unidad: Edicion de Publicidades
// Edicion para [Pedidos & Domicilios/Pedidos & Domicilios/Publicidades]

import 'package:pyd_eber/all-exports.dart';
import 'package:pyd_eber/modelos/publicidades.dart';


class UIPublicidadesEdicion extends StatefulWidget {
  UIPublicidadesEdicion({Key key, this.registro}) : super(key: key);
  static const String ruta = '/publicidadesEdicion';


  final Publicidad registro;

  @override
  _EstadoPublicidadesEdicion createState() =>
      _EstadoPublicidadesEdicion();
}

class _EstadoPublicidadesEdicion extends State<UIPublicidadesEdicion> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _forma = GlobalKey<FormState>();

  bool _autovalidar = false;
  bool _formaEditada = false;

  void _guardar() async {
    final FormState forma = _forma.currentState;
    if (!forma.validate()) {
      _autovalidar = true; // Iniciar validación en cada cambio
      mensaje(_scaffoldKey.currentState, Co.MENSAJE_CORREGIR_ERRORES);
    } else {
      forma.save();

      // Asignar los datos del mapa en Edición en la Sesión
      // al registro de Publicidades en el widget
      widget.registro.fromMap(DEM.mapaPublicidad);

      // Guardar Publicidades
      PublicidadesFB.guardarPublicidad(publicidad: widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop();
    }
  }

  void _borrar() async {
    // Borrar Publicidades
    PublicidadesFB.borrarPublicidad(publicidad: widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop();
  }

  String _validarSitioweb(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(PUBLICIDADES.ETIQUETA_SITIOWEB);
    widget.registro.sitioweb = value;
    return null;
  }

  String _validarNombreinterno(String value) {
    _formaEditada = true;
    if (value.isEmpty)
      return campoObligatorio(PUBLICIDADES.ETIQUETA_NOMBREINTERNO);
    widget.registro.nombreinterno = value;
    return null;
  }



  @override
  Widget build(BuildContext context) {
    DEM.mapaPublicidad = widget.registro.toMap();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppRes.appResMap[Co.COLOR_FONDO_TITULO_LISTA],
        title: Text(
          PUBLICIDADES.ETIQUETA_REGISTRO + Co.TITULO_ABRE + (
              ((widget.registro.key == null) || (widget.registro.key == ''))
                  ? Co.VISTA_NUEVO_REGISTRO :
                  Co.TITULO_CIERRA ),
          style: estiloTituloPantalla,
        ),
        centerTitle: true,
        primary: true,
      ),
      body: PyDBase(
          contentChild: Form(
            key: _forma,
            autovalidate: _autovalidar,
            onWillPop: () async {
              return await advertirDatosInvalidos(
                  context, _forma.currentState, _formaEditada);
            },
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: <Widget>[
// Campo: Sitio web. Tipo de Componente: BDEdicion
                UICampo(
                  datos: DEM.mapaPublicidad,
                  tabla: PUBLICIDADES.ETIQUETA_ENTIDAD,
                  campo: PUBLICIDADES.SITIOWEB,
                  denominacion: PUBLICIDADES.ETIQUETA_SITIOWEB,
                  etiqueta: PUBLICIDADES.ETIQUETA_SITIOWEB,
                  componente: 'BDEdicion',
                  longitud: 512,
                  decimales: 0,
                  validatorTexto: _validarSitioweb,

                ),

// Campo: nombre Empresa que paga Publicidad. Tipo de Componente: BDEdicion
                UICampo(
                  datos: DEM.mapaPublicidad,
                  tabla: PUBLICIDADES.ETIQUETA_ENTIDAD,
                  campo: PUBLICIDADES.NOMBREEMPRESAQUEPAGAPUBLICIDAD,
                  denominacion: PUBLICIDADES.ETIQUETA_NOMBREEMPRESAQUEPAGAPUBLICIDAD,
                  etiqueta: PUBLICIDADES.ETIQUETA_NOMBREEMPRESAQUEPAGAPUBLICIDAD,
                  componente: 'BDEdicion',
                  longitud: 512,
                  decimales: 0,

                  validatorTexto: _validarSitioweb,

                ),


// Campo: Nombre interno. Tipo de Componente: BDEdicion
                UICampo(
                  datos: DEM.mapaPublicidad,
                  tabla: PUBLICIDADES.ETIQUETA_ENTIDAD,
                  campo: PUBLICIDADES.NOMBREINTERNO,
                  denominacion: PUBLICIDADES.ETIQUETA_NOMBREINTERNO,
                  etiqueta: PUBLICIDADES.ETIQUETA_NOMBREINTERNO,
                  componente: 'BDEdicion',
                  longitud: 200,
                  decimales: 0,

                  //validatorTexto: _validarNombreinterno,

                ),
// Campo: Fecha de Activación. Tipo de Componente: BDEdicionFecha
                UICampo(
                  datos: DEM.mapaPublicidad,
                  tabla: PUBLICIDADES.ETIQUETA_ENTIDAD,
                  campo: PUBLICIDADES.FECHAACTIVACION,
                  denominacion: PUBLICIDADES.ETIQUETA_FECHAACTIVACION,
                  etiqueta: PUBLICIDADES.ETIQUETA_FECHAACTIVACION,
                  componente: 'BDEdicionFecha',
                  longitud: 0,
                  decimales: 0,


                ),
// Campo: Fecha de Desactivación. Tipo de Componente: BDEdicionFecha
                UICampo(
                  datos: DEM.mapaPublicidad,
                  tabla: PUBLICIDADES.ETIQUETA_ENTIDAD,
                  campo: PUBLICIDADES.FECHADESACTIVACION,
                  denominacion: PUBLICIDADES.ETIQUETA_FECHADESACTIVACION,
                  etiqueta: PUBLICIDADES.ETIQUETA_FECHADESACTIVACION,
                  componente: 'BDEdicionFecha',
                  longitud: 0,
                  decimales: 0,


                ),
// Campo: Repetir. Tipo de Componente: BDEdicion
                UICampo(
                  datos: DEM.mapaPublicidad,
                  tabla: PUBLICIDADES.ETIQUETA_ENTIDAD,
                  campo: PUBLICIDADES.REPETIR,
                  denominacion: PUBLICIDADES.ETIQUETA_REPETIR,
                  etiqueta: PUBLICIDADES.ETIQUETA_REPETIR,
                  componente: 'BDEdicion',
                  longitud: 20,
                  decimales: 0,


                ),
// Campo: Repetir cada. Tipo de Componente: BDEdicion
                UICampo(
                  datos: DEM.mapaPublicidad,
                  tabla: PUBLICIDADES.ETIQUETA_ENTIDAD,
                  campo: PUBLICIDADES.REPETIRCADA,
                  denominacion: PUBLICIDADES.ETIQUETA_REPETIRCADA,
                  etiqueta: PUBLICIDADES.ETIQUETA_REPETIRCADA,
                  componente: Co.COMPONENTE_BD_NUMERO,
                  longitud: 0,
                  decimales: 0,


                ),
// Campo: Imagen. Tipo de Componente: BDEdicion
                UICampo(
                  datos: DEM.mapaPublicidad,
                  tabla: PUBLICIDADES.ETIQUETA_ENTIDAD,
                  campo: PUBLICIDADES.IMAGEN,
                  denominacion: PUBLICIDADES.ETIQUETA_IMAGEN,
                  etiqueta: PUBLICIDADES.ETIQUETA_IMAGEN,
                  componente: 'BDEdicion',
                  longitud: 20,
                  decimales: 0,


                ),
// Campo: Producto. Tipo de Componente: BDEdicion
                UICampo(
                  datos: DEM.mapaPublicidad,
                  tabla: PUBLICIDADES.ETIQUETA_ENTIDAD,
                  campo: PUBLICIDADES.PRODUCTO,
                  denominacion: PUBLICIDADES.ETIQUETA_PRODUCTO,
                  etiqueta: PUBLICIDADES.ETIQUETA_PRODUCTO,
                  componente: 'BDEdicion',
                  longitud: 30,
                  decimales: 0,


                ),
// Campo: Nivel de Prioridad. Tipo de Componente: BDEdicion
                UICampo(
                  datos: DEM.mapaPublicidad,
                  tabla: PUBLICIDADES.ETIQUETA_ENTIDAD,
                  campo: PUBLICIDADES.NIVELPRIORIDAD,
                  denominacion: PUBLICIDADES.ETIQUETA_NIVELPRIORIDAD,
                  etiqueta: PUBLICIDADES.ETIQUETA_NIVELPRIORIDAD,
                  componente: Co.COMPONENTE_BD_NUMERO,
                  longitud: 0,
                  decimales: 0,


                ),
// Campo: Nota. Tipo de Componente: BDEdicion
                UICampo(
                  datos: DEM.mapaPublicidad,
                  tabla: PUBLICIDADES.ETIQUETA_ENTIDAD,
                  campo: PUBLICIDADES.NOTA,
                  denominacion: PUBLICIDADES.ETIQUETA_NOTA,
                  etiqueta: PUBLICIDADES.ETIQUETA_NOTA,
                  componente: 'BDEdicion',
                  longitud: 200,
                  decimales: 0,


                ),
                // UICamposObligatorios(),
                //UIBotonesGuardarBorrar(guardar: _guardar, borrar: widget.registro.key == '' ? null : _borrar ),
              ],
            ),
          ),
          actionBtnsChild: UIBotonesGuardarBorrar(guardar: _guardar, borrar: widget.registro.key == '' ? null : _borrar ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppRes.appResMap[Co.COLOR_PRINCIPAL],
        child: Icon(Icons.add_a_photo),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) =>
                  UIEditorImagenes()
          ),
          );
        },
      ),
    );
  }
}
