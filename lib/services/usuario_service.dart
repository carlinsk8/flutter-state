import 'dart:math';

import 'package:estados_app/models/usuario.dart';
import 'package:flutter/cupertino.dart';

class UsuarioService with ChangeNotifier {
  Usuario _usuario;

  Usuario get usuario => this._usuario;
  bool get existeUsuario => this._usuario != null ? true : false;

  set usuario(Usuario user) {
    this._usuario = user;
    notifyListeners();
  }

  void cambiarEdad(int edad) {
    this._usuario.edad = edad;
    notifyListeners();
  }

  void removeUsuario() {
    this._usuario = null;
    notifyListeners();
  }

  void agregarProferccion(String profecion) {
    this._usuario.profeciones.add(profecion);
    notifyListeners();
  }
}
