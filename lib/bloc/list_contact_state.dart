 import 'package:equatable/equatable.dart';
import 'package:learn_bloc/models/contact.dart';

abstract class ListContactState extends Equatable {

 @override
 List<Object> get props => [];

}


class ListContactInit extends ListContactState {

}

class ListContactLoading extends ListContactState {}

class ListContactLoaded extends ListContactState {
 final List<Contact>? contacts;

 ListContactLoaded({this.contacts});
}

 class ListContactError extends ListContactState {
  final error;

  ListContactError({this.error});
 }

