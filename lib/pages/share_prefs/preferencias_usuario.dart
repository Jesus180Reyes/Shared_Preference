import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();
  factory PreferenciasUsuario() {
    return _instancia;
  }
  PreferenciasUsuario._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }
  //Ninguna de estas propiedades se usan
  // late bool _colorSecundario;
  // late int _genereo;
  // late String _nombre;

  //GET Y SET GENERO
  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set setgenero(int value) {
    _prefs.setInt('genero', value);
  }

  //GET Y SET _colorSecundario
  get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set setcolorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }

  //GET Y SET usuario
  get nombreUsuario {
    return _prefs.getString('nombreUsuario') ?? '';
  }

  set setnombreUsuario(String value) {
    _prefs.setString('nombreUsuario', value);
  }

  //GET Y SET ultima pagina
  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'home';
  }

  set setUltimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }
}
