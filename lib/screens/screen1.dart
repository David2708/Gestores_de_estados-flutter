import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user/user_bloc.dart';

class Screen1 extends StatelessWidget {
   
  const Screen1({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1'),
        actions: [
          IconButton(
            onPressed: (){
              BlocProvider.of<UserBloc>(context, listen: false).add(BorrarUser());
            }, 
            icon: const Icon(Icons.delete_forever_outlined)
          )
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: ( _ , state) {

          return state.existeUsuario
           ? _USerInformation( usuario: state.usuario!, )
           : const Center(
            child: Text('No hay usuario seleccionado'),
           );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_right_sharp),
        onPressed: () => Navigator.pushNamed(context, 'screen2'),
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
                => ListTile( title: Text('Profesion ${index + 1}: ${usuario.profesiones[index]}')),
            ),
          )
        ],
       )
    );
  }
}