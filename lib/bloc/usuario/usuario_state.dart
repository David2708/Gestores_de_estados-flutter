
part of 'usuario_cubit.dart';

@immutable
abstract class UsuarioState{}

class UsuarioInitial extends UsuarioState {
  final existeUSuario = false;
}

class UsuarioActivo extends UsuarioState {
  final existeUsuario = true;
  final Usuario usuario;

  UsuarioActivo(this.usuario);
}