import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/cu_contact_state.dart';
import 'package:learn_bloc/models/contact.dart';

class CuContactCubit extends Cubit<CuContactState> {
  CuContactCubit() : super(CuContactInit());

  Contact? contact;

  void updateOrCreate() {
    if(contact == null) {
      emit(CuContactCreate());
    }else {
      emit(CuContactUpdate());
    }
  }


  void create() {}

  void update() {}
}