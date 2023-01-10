

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../models/usuario.dart';

part 'user_event.dart';
part 'user_state.dart';


class UserBloc extends Bloc<UserEvent, UserState>{

  UserBloc() : super( const UserInitialState() ){
    on<ActivateUser>( (event, emit) => emit( UserSetState(event.user) ) );

    on<ChangeUserAge>((event, emit) {
      if( !state.existeUsuario ) return;
      emit( UserSetState( state.usuario!.copyWith(edad: event.age) ) );
    });

    on<AddUserProfesion>((event, emit) {
      if( !state.existeUsuario ) return;
      final newProfesions = [...state.usuario!.profesiones, event.profesion];
      emit( UserSetState( state.usuario!.copyWith(profesiones: newProfesions) ) );
    });

    on<BorrarUser>((event, emit) {
      if( !state.existeUsuario ) return;
      emit( const UserInitialState() );
    });
  }



}
