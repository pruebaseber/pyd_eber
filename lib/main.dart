/*
 Proyecto: La 2000 Pedidos y Domicilios *P&D*
 Version: 1.0.0
 Autor: Alse Developers
 Unidad: main.dart
 Inicio de la aplicacion
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pyd_eber/blocs/pyd-bloc-delegate.dart';
import 'package:pyd_eber/dem.dart';
import 'package:pyd_eber/temas/themeList.dart';
import 'package:theme_provider/theme_provider.dart';

import 'all-exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = PyDBlocDelegate();
  runApp(PyDApp());
}

class PyDApp extends StatefulWidget {
  @override
  _PyDAppState createState() => _PyDAppState();
}

class _PyDAppState extends State<PyDApp> {
  Map<String, WidgetBuilder> rutas;

  @override
  void initState() {
    initializeDateFormatting();

    DEM.iniciar();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: true,
      themes: listaTemas,
      child: MaterialApp(
        title: 'La 2000 - Pedidos & Domicilios',
        debugShowCheckedModeBanner: false,
        home: ThemeConsumer(
          child: Material(
            type: MaterialType.transparency,
            child: UITester(),
          ),
        ),

        onGenerateRoute: DEM.navegacion.generarRuta,
        onUnknownRoute: DEM.navegacion.rutaDesconocida,
      ),
    );
  }
}