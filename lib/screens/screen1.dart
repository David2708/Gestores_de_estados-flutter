import 'package:estados/models/usuario.dart';
import 'package:estados/sercices/usuario_services.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
   
  const Screen1({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1'),
      ),
      body: usuarioServices.existeUsuario
        ? _UserInformation(usuario: usuarioServices.usuario,)
        : const Center(child: Text('No hay informacion del usuario'),),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_right_sharp),
        onPressed: () => Navigator.pushNamed(context, 'screen2'),
      ),
    );
  }
}

class _UserInformation extends StatelessWidget {
  const _UserInformation({
    Key? key, required this.usuario,
  }) : super(key: key);

  final Usuario usuario;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('General' , style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold ),),
          const Divider(), 

          ListTile( title: Text('Nombe: ${usuario.nombre}'), ),
          ListTile( title: Text('Edad: ${usuario.edad}'), ),

          const Text('Profesiones' , style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold ),),
          const Divider(),

          ListTile( title: Text('Profesion 1: '), )
        ],
       )
    );
  }
}