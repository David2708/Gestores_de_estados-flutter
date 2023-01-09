import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
   
  const Screen2({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
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
              onPressed: (){}
            ),
            MaterialButton(
              color: Colors.blue[400],
              child: const Text('Cambiar edad', style: TextStyle(color: Colors.white),),
              onPressed: (){}
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