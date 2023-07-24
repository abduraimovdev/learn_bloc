import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/list_contact_state.dart';
import 'package:learn_bloc/core/service_locator.dart';
import 'package:learn_bloc/models/contact.dart';
import 'package:learn_bloc/models/contact_parser.dart';
import 'package:learn_bloc/services/network_service.dart';

class ListContactCubit extends Cubit<ListContactState> {
  ListContactCubit() : super(ListContactInit());


  void apiContactList() async {
    emit(ListContactLoading());
    final data = await locator.get<Network>().get(api: Api.contacts);
    if(data != null) {
      emit(ListContactLoaded(contacts: Parser.parseContacts(data)));

    }else {
      emit(ListContactError(error: "Could Not fetch Contact"));
    }
  }


  void apiContactDelete(Contact contact) async{
    emit(ListContactLoading());
    final response = await locator.get<Network>().delete(api: Api.contacts, id: contact.id.toString());
    if(response != null) {
      apiContactList();
    }else {
      emit(ListContactError(error: "Could Not fetch Contact"));
    }
  }
}