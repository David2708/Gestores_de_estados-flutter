import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
   
  const Screen1({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1'),
      ),
      body: const _USerInformation(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_right_sharp),
        onPressed: () => Navigator.pushNamed(context, 'screen2'),
      ),
    );
  }
}

class _USerInformation extends StatelessWidget {
  const _USerInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('General' , style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold ),),
          Divider(), 

          ListTile( title: Text('Nombe: '), ),
          ListTile( title: Text('Edad: '), ),

          Text('Profesiones' , style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold ),),
          Divider(),

          ListTile( title: Text('Profesion 1: '), ),
          ListTile( title: Text('Profesion 2: '), ),
          ListTile( title: Text('Profesion 3: '), ),
        ],
       )
    );
  }
}