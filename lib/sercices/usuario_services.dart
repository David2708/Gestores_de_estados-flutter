import 'dart:async';

import 'package:estados/models/usuario.dart';

class _UsuarioServices {
  Usuario? _usuario;

 final StreamController<Usuario> _usuarioStreanController = StreamController.broadcast();

  Usuario get usuario => _usuario!;
  bool get existeUsuario => _usuario != null ;

  Stream<Usuario> get usuarioStream => _usuarioStreanController.stream;

  set cargarUsurio(Usuario user) {
    _usuario = user;
    _usuarioStreanController.add(user);
  }

  void cambiarEdad(int edad){
    _usuario?.edad = edad;
    _usuarioStreanController.add(_usuario!);
  }

  dispose(){
    _usuarioStreanController.close();
  }
}

final usuarioServices = _UsuarioServices();
