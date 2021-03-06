// Proyecto: P & D
// Version: 1.0.0
// Autor: Alse Developers
// Unidad: Edicion de Clientes
// Edicion para [Pedidos & Domicilios/Pedidos & Domicilios/Clientes]

import 'package:pyd_eber/all-exports.dart';


class UIMisDatos extends StatefulWidget {
  UIMisDatos({Key key, this.registro}) : super(key: key);
  static const String ruta = '/misdatos';

  final Cliente registro;

  @override
  _EstadoClientesEdicion createState() => _EstadoClientesEdicion();
}

class _EstadoClientesEdicion extends State<UIMisDatos> {
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
      // al registro de Clientes en el widget
      widget.registro.fromMap(DEM.mapaCliente);

      // Guardar Clientes
      ClientesFB.guardarCliente(cliente: widget.registro);
      Navigator.of(_scaffoldKey.currentContext).pop();
    }
  }

  void _borrar() async {
    // Borrar Clientes
    ClientesFB.borrarCliente(cliente: widget.registro);
    Navigator.of(_scaffoldKey.currentContext).pop();
  }

  @override
  Widget build(BuildContext context) {
    DEM.mapaCliente = widget.registro.toMap();
    //DEM.calcularResponsive(context);
    Responsive.calcularResponsive(context);
    Responsive.altoContenido = Responsive.altoContenido + Responsive.altoBarraEstado;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.transparent,
      appBar: UIAppBar(
        context,
        recalcular: false,
        text: CLIENTES.ETIQUETA_REGISTRO +
            Co.TITULO_ABRE + (
            ((widget.registro.key == null) || (widget.registro.key == ''))
                ? Co.VISTA_NUEVO_REGISTRO
                : widget.registro.nombreCompleto) +
            Co.TITULO_CIERRA,
        // style: estiloTituloPantalla,
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
// Campo: Nombre Completo. Tipo de Componente: BDEdicion
            UIContenedorCampo(
              ancho: Responsive.anchoItemDatoGeneral,
               child: UICampo(
                datos: DEM.mapaCliente,
                tabla: CLIENTES.ETIQUETA_ENTIDAD,
                campo: CLIENTES.NOMBRECOMPLETO,
                denominacion: CLIENTES.ETIQUETA_NOMBRECOMPLETO,
                etiqueta: CLIENTES.ETIQUETA_NOMBRECOMPLETO,
                componente: 'BDEdicion',
                longitud: 80,
                decimales: 0,
                // ancho: DEM.modo == DEM.sm ? DEM.ancho * .8 : DEM.ancho * .5,
              ),
            ),

              UICampo(
                datos: DEM.mapaCliente,
                tabla: CLIENTES.ETIQUETA_ENTIDAD,
                campo: CLIENTES.NOMBRECOMPLETO,
                denominacion: CLIENTES.ETIQUETA_NOMBRECOMPLETO,
                etiqueta: CLIENTES.ETIQUETA_NOMBRECOMPLETO,
                componente: 'BDEdicion',
                longitud: 80,
                decimales: 0,
                // ancho: DEM.modo == DEM.sm ? DEM.ancho * .8 : DEM.ancho * .5,
              ),
              Wrap(
                children: [
// Campo: Tipo de Identificación. Tipo de Componente: BDEdicion
                  UICampo(
                    datos: DEM.mapaCliente,
                    tabla: CLIENTES.ETIQUETA_ENTIDAD,
                    campo: CLIENTES.TIPOIDENT,
                    denominacion: CLIENTES.ETIQUETA_TIPOIDENT,
                    etiqueta: CLIENTES.ETIQUETA_TIPOIDENT,
                    componente: 'BDEdicion',
                    longitud: 3,
                    decimales: 0,
                    ancho: Responsive.ancho < 800 ? Responsive.ancho : Responsive.ancho * .3,
                  ),
// Campo: Número de Identificación. Tipo de Componente: BDEdicion
                  UICampo(
                    datos: DEM.mapaCliente,
                    tabla: CLIENTES.ETIQUETA_ENTIDAD,
                    campo: CLIENTES.NUMEROIDENT,
                    denominacion: CLIENTES.ETIQUETA_NUMEROIDENT,
                    etiqueta: CLIENTES.ETIQUETA_NUMEROIDENT,
                    componente: 'BDEdicion',
                    longitud: 15,
                    decimales: 0,
                    ancho: Responsive.ancho < 800 ? Responsive.ancho : Responsive.ancho * .3,
                  ),
                ],
              ),

// Campo: Correo Electrónico. Tipo de Componente: BDEdicion
              UICampo(
                datos: DEM.mapaCliente,
                tabla: CLIENTES.ETIQUETA_ENTIDAD,
                campo: CLIENTES.CORREOELECTRONICO,
                denominacion: CLIENTES.ETIQUETA_CORREOELECTRONICO,
                etiqueta: CLIENTES.ETIQUETA_CORREOELECTRONICO,
                componente: 'BDEdicion',
                longitud: 50,
                decimales: 0,
              ),

              Wrap(
                children: [
// Campo: Celular. Tipo de Componente: BDEdicion
                  UICampo(
                    datos: DEM.mapaCliente,
                    tabla: CLIENTES.ETIQUETA_ENTIDAD,
                    campo: CLIENTES.CELULAR,
                    denominacion: CLIENTES.ETIQUETA_CELULAR,
                    etiqueta: CLIENTES.ETIQUETA_CELULAR,
                    componente: 'BDEdicion',
                    longitud: 11,
                    decimales: 0,
                    ancho: Responsive.ancho < 800 ? Responsive.ancho : Responsive.ancho * .3,
                  ),
// Campo: Teléfono. Tipo de Componente: BDEdicion
                  UICampo(
                    datos: DEM.mapaCliente,
                    tabla: CLIENTES.ETIQUETA_ENTIDAD,
                    campo: CLIENTES.TELEFONO,
                    denominacion: CLIENTES.ETIQUETA_TELEFONO,
                    etiqueta: CLIENTES.ETIQUETA_TELEFONO,
                    componente: 'BDEdicion',
                    longitud: 15,
                    decimales: 0,
                    ancho: Responsive.ancho < 800 ? Responsive.ancho : Responsive.ancho * .3,
                  ),
                ],
              ),

// Campo: Dirección Principal. Tipo de Componente: BDEdicion
              UICampo(
                datos: DEM.mapaCliente,
                tabla: CLIENTES.ETIQUETA_ENTIDAD,
                campo: CLIENTES.DIRECCIONPRINCIPAL,
                denominacion: CLIENTES.ETIQUETA_DIRECCIONPRINCIPAL,
                etiqueta: CLIENTES.ETIQUETA_DIRECCIONPRINCIPAL,
                componente: 'BDEdicion',
                longitud: 30,
                decimales: 0,
              ),
              UIBotonesGuardarBorrar(
                  guardar: _guardar,
                  borrar: widget.registro.key == '' ? null : _borrar),
            ],
          ),
        ), actionBtnsChild: null,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppRes.appResMap[Co.COLOR_PRINCIPAL],
        child: const Icon(
          Icons.add,
          size: 50,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => UIMisDatos(
                registro: Cliente(),
              ),
            ),
          );
        },
      ),
    );
  }
}


