class ResultadoProceso {
  ResultadoProceso({
    this.codigo = 0,
    this.mensaje = '',
    this.objeto,
    this.error = false,
    this.siguienteProceso,
  });

  int codigo;
  String mensaje;
  dynamic objeto;
  bool error;
  String siguienteProceso;
}
