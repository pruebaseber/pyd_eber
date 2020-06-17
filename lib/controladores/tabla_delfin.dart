

class TablaDelfin {
  TablaDelfin({
    this.nombre,
    this.fecha = '',
    this.url = '',
    this.descargar = false,
    this.ocupado = false,
    this.existe = false,
    this.actualizados = false,
    this.objetoFinal,
    this.ultimaLecturaInfoWeb,
  });

  String nombre;
  String fecha;
  String data;
  bool existe;
  bool actualizados;
  bool verificado;
  bool descargar;
  String url;
  bool ocupado;
  Map<String, dynamic> mapa;
  dynamic objetoFinal;
  DateTime ultimaLecturaInfoWeb;
}
