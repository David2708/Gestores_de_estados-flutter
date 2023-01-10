import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Screen2 extends StatelessWidget {
   
  const Screen2({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final usuarioCubit = context.read<UsuarioCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue[400],
              child: const Text('Establecer usuario', style: TextStyle(color: Colors.white),),
              onPressed: (){
                final newUSer = Usuario(
                  nombre: 'David', 
                  edad: 24, 
                  profesiones: ['ingeniero', 'fullstack Developer']
                );
                usuarioCubit.seleccionaUSuario(newUSer);
              }
            ),
            MaterialButton(
              color: Colors.blue[400],
              child: const Text('Cambiar edad', style: TextStyle(color: Colors.white),),
              onPressed: (){
                usuarioCubit.cambiarEdad(30);
              }
            ),
            MaterialButton(
              color: Colors.blue[400],
              child: const Text('Añadir profesión', style: TextStyle(color: Colors.white),),
              onPressed: (){
                usuarioCubit.agregarProfesion('Mobile Developer');
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