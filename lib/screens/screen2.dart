import 'package:estados/controllers/usuario_controller.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screen2 extends StatelessWidget {
   
  const Screen2({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final usuarioCtrol = Get.find<UsuarioController>();

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
                usuarioCtrol.cargarUsuario( Usuario(nombre: 'David', edad: 24) );
                Get.snackbar(
                  'USuario establecido', 
                  'David es el nombre dle usuario',
                  backgroundColor: Colors.white,
                  duration: const Duration(seconds: 1) ,
                  boxShadows: [
                    const BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10
                    )
                  ]
                  );
              }
            ),
            MaterialButton(
              color: Colors.blue[400],
              child: const Text('Cambiar edad', style: TextStyle(color: Colors.white),),
              onPressed: (){
                usuarioCtrol.cambiarEdad(30);
              }
            ),
            MaterialButton(
              color: Colors.blue[400],
              child: const Text('Añadir profesión', style: TextStyle(color: Colors.white),),
              onPressed: (){
                print('cambio');
                usuarioCtrol
                  .agregarProfesion('profesiones # ${usuarioCtrol.profesionesCount + 1}');
              }
            ),
            MaterialButton(
              color: Colors.blue[400],
              child: const Text('Cambiar tema', style: TextStyle(color: Colors.white),),
              onPressed: (){
                Get.changeTheme(ThemeData.dark());
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