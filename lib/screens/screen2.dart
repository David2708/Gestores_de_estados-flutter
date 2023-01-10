import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/usuario_service.dart';

class Screen2 extends StatelessWidget {
   
  const Screen2({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    final usuarioService = Provider.of<UsuarioService>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario
          ? Text('Nombre: ${usuarioService.usuario!.nombre}')
          : const Text('Screen 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue[400],
              child: const Text('Establecer usuario', style: TextStyle(color: Colors.white),),
              onPressed: (){
                usuarioService.usuario = Usuario(
                  nombre: 'David', 
                  edad: 24, 
                  profesiones: ['Fullstack Developer', 'Video Jugador Experto']
                );
              }
            ),
            MaterialButton(
              color: Colors.blue[400],
              child: const Text('Cambiar edad', style: TextStyle(color: Colors.white),),
              onPressed: (){
                if (usuarioService.existeUsuario) {
                  usuarioService.cambiarEdad(30);
                }
              }
            ),
            MaterialButton(
              color: Colors.blue[400],
              child: const Text('Añadir profesión', style: TextStyle(color: Colors.white),),
              onPressed: (){
                usuarioService.addProfesion('Ingeniero');
              }
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_left_outlined),
        onPressed: () => Navigator.pushNamed(context, 'screen1'),
      ),
    );
  }
}