import 'package:flutter/material.dart';
import 'package:materiales/pages/share_prefs/preferencias_usuario.dart';
import 'package:materiales/widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prefs = PreferenciasUsuario();
    prefs.setUltimaPagina = 'home';
    prefs.genero;
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color Secundario: ${prefs.colorSecundario}'),
          Divider(),
          Text('Genero ${prefs.genero}'),
          Divider(),
          Text('Nombre de Usuario ${prefs.nombreUsuario}'),
          Divider(),
        ],
      ),
    );
  }
}
