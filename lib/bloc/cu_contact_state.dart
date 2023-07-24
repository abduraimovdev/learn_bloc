import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class CuContactState extends Equatable {

  @override
  List<Object?> get props => [];
}

class CuContactInit extends CuContactState {}
class CuContactUpdate extends CuContactState {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  void update() {}
}

class CuContactCreate extends CuContactState {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  void create() {}
}