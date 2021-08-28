import 'package:flutter/material.dart';
import 'package:materiales/pages/home_pages.dart';
import 'package:materiales/pages/settings.dart';
import 'package:materiales/pages/share_prefs/preferencias_usuario.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: prefs.ultimaPagina,
      routes: {
        'home': (_) => HomePage(),
        'settings': (_) => SettingsPage(),
      },
    );
  }
}
