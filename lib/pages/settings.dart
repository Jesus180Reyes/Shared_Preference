import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:materiales/pages/share_prefs/preferencias_usuario.dart';
import 'package:materiales/widgets/drawer_widget.dart';

class SettingsPage extends StatefulWidget {
  static final routeName = 'settings';
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int? _genero;
  bool _colorSecundario = true;
  String nombre = 'Pedro';
  TextEditingController? _textEditingController;
  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    prefs.setUltimaPagina = SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _textEditingController =
        new TextEditingController(text: prefs.nombreUsuario);
  }

  setSelectedRadio(int? valor) {
    prefs.setgenero = valor ?? 1;
    _genero = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      body: ListView(
        children: [
          Container(
            // margin: EdgeInsets.all(5.0),
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Settings',
              style: TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            onChanged: (value) {
              setState(() {
                _colorSecundario = value;
                prefs.setcolorSecundario = value;
              });
            },
            title: Text(
              'Colors Secundario',
            ),
          ),
          RadioListTile(
            title: Text('Masculino'),
            value: 1,
            groupValue: _genero,
            onChanged: setSelectedRadio,
            activeColor: Colors.red,
            selected: true,
          ),
          RadioListTile(
            title: Text('Femenino'),
            value: 2,
            groupValue: _genero,
            onChanged: setSelectedRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el telefono',
              ),
              onChanged: (value) {
                prefs.setnombreUsuario = value;
              },
            ),
          ),
        ],
      ),
    );
  }
}
