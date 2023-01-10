

class Usuario {

  final String? nombre;
  int? edad;
  List<String> profesiones;

  Usuario({
    this.nombre,
    this.edad,
    this.profesiones = const [],
  });

}