import 'package:estados/models/usuario.dart';
import 'package:estados/sercices/usuario_services.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
   
  const Screen2({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioServices.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            return snapshot.hasData
              ? Text('nombre: ${snapshot.data!.nombre}')
              : Text('Pagina 2');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue[400],
              child: const Text('Establecer usuario', style: TextStyle(color: Colors.white),),
              onPressed: (){
                final Usuario usuario =Usuario(nombre: 'David', edad: 24, profesiones: ['ingeniero']);
                usuarioServices.cargarUsurio = usuario;
              }
            ),
            MaterialButton(
              color: Colors.blue[400],
              child: const Text('Cambiar edad', style: TextStyle(color: Colors.white),),
              onPressed: (){
                if (usuarioServices.existeUsuario) {
                  usuarioServices.cambiarEdad(30);
                }
              }
            ),
            MaterialButton(
              color: Colors.blue[400],
              child: const Text('Añadir profesión', style: TextStyle(color: Colors.white),),
              onPressed: (){}
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