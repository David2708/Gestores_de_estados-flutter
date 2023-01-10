

import 'package:flutter/material.dart';

import 'package:estados/models/usuario.dart';

class UsuarioService extends ChangeNotifier{
  Usuario? _usuario;

  Usuario? get usuario => _usuario;
  bool get existeUsuario => _usuario != null;

  set usuario( Usuario? user ){
    _usuario = user;
    notifyListeners();
  }

  void cambiarEdad(int edad){
    _usuario!.edad = edad;
    notifyListeners();
  }

  void removeUsuario(){
    _usuario = null;
    notifyListeners();
  }

  void addProfesion(String profesion){
    _usuario!.profesiones.add(profesion);
  }

}