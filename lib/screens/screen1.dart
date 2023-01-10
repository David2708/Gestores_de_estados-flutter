import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/usuario_controller.dart';

class Screen1 extends StatelessWidget {
   
  const Screen1({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final usuarioCtrl = Get.put( UsuarioController() );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1'),
      ),


      body: Obx( () => usuarioCtrl.existeUsuario.value
          ? _USerInformation(usuario: usuarioCtrl.usuario.value,)
          : const Center(child: Text('NO hay informacion del usuario'))
       ),


      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_right_sharp),
        // onPressed: () => Navigator.pushNamed(context, 'screen2'),
        // onPressed: () => Get.to( () => const Screen2() ),
        onPressed: () => Get.toNamed( 'screen2' ),
      ),
    );
  }
}

class _USerInformation extends StatelessWidget {

  const _USerInformation({
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

          Expanded(
            child: ListView.builder(
              itemCount: usuario.profesiones.length,
              itemBuilder: (context, index) 
                => ListTile( title: Text('Profesion: ${usuario.profesiones[index]} '), ),
            ),
          )
        ],
       )
    );
  }
}