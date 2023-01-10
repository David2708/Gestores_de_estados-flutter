import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados/bloc/usuario/usuario_cubit.dart';

class Screen1 extends StatelessWidget {
   
  const Screen1({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1'),
        actions: [
          IconButton(
            onPressed: () => context.read<UsuarioCubit>().borrarUsuario(), 
            icon: const Icon(Icons.exit_to_app)
          )
        ],
      ),
      
      body: const _BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_right_sharp),
        onPressed: () => Navigator.pushNamed(context, 'screen2'),
      ),
    );
  }
}

class _BodyScaffold extends StatelessWidget {
  const _BodyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: ( _ , state) {

        print(state);

        switch (state.runtimeType) {
          case UsuarioInitial:
            return const Center(child: Text('No hay información del usuario'));

          case UsuarioActivo:
            return _UserInformation(user: (state as UsuarioActivo).usuario,);
            
          default:
            return const Center(child: Text('Estado desconocido'));
        }

        // if(state is UsuarioInitial){
        //   return const Center(child: Text('No hay información del usuario'));
        // } else if (state is UsuarioActivo){
        //   return _UserInformation(user: state.usuario,);
        // } else {
        //   return const Center(child: Text('Estado desconocido'));
        // }

      },
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
              itemCount: user.profesiones.length,
              itemBuilder: ( _ , index) => ListTile( title: Text('Profesion 1: ${user.profesiones[index]}')) ,
            ),
          )

          ,
        ],
       )
    );
  }
}