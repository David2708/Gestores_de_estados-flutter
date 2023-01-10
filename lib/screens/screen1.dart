import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Screen1 extends StatelessWidget {
   
  const Screen1({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1'),
        actions: [
          IconButton(
            // onPressed: () => usuarioService.removeUsuario(),
            onPressed: usuarioService.removeUsuario,
            icon: const Icon(Icons.remove_circle)
          )
        ],
      ),
      body: usuarioService.existeUsuario
        ? _UserInformation(user: usuarioService.usuario!,)
        : const Center(child: Text('No hay usuario seleccionado'),),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_right_sharp),
        onPressed: () => Navigator.pushNamed(context, 'screen2'),
      ),
    );
  }
}

class _UserInformation extends StatelessWidget {

  const _UserInformation({
    Key? key, required this.user,
  }) : super(key: key);

  final Usuario user;

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

          ListTile( title: Text('Nombe: ${user.nombre}'), ),
          ListTile( title: Text('Edad: ${user.edad}'), ),

          const Text('Profesiones' , style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold ),),
          const Divider(),

          Expanded(
            child: ListView.builder(
              itemCount: user!.profesiones.length,
              itemBuilder: (BuildContext context, int index) { 
                return ListTile( title: Text('Profesion ${index + 1 }: ${user.profesiones[index]} '));
               },
            ),
          ),
          
        ],
       )
    );
  }
}