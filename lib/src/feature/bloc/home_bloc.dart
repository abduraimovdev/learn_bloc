import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/core/service_locator.dart';
import '../../common/services/network_service.dart';
import '../models/contact.dart';
import '../models/contact_parser.dart';

/// Event
sealed class HomeEvent {
  const HomeEvent();
}

class LoadingEvent extends HomeEvent {
  const LoadingEvent();
}

class LoadedEvent extends HomeEvent {
  const LoadedEvent();
}

class ErrorEvent extends HomeEvent {
  const ErrorEvent();
}

class CreateContactEvent extends HomeEvent {
  final String name;
  final String number;

  const CreateContactEvent({
    required this.name,
    required this.number,
  });
}

class DeleteContactEvent extends HomeEvent {
  final String id;
  const DeleteContactEvent({required this.id});
}

class UpdateContactEvent extends HomeEvent {
  final String id;
  final String name;
  final String number;

  const UpdateContactEvent({
    required this.name,
    required this.number,
    required this.id,
  });
}

/// State
sealed class HomeState {
  const HomeState();
}

class LoadingState extends HomeState {
  const LoadingState();
}

class LoadedState extends HomeState {
  final List<Contact> contacts;

  const LoadedState({required this.contacts});
}

class ErrorState extends HomeState {
  final String message;

  const ErrorState({required this.message});
}

/// Bloc
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const LoadingState()) {
    on<HomeEvent>(
      (event, emit) => switch (event) {
        LoadingEvent e => _loading(e, emit),
        LoadedEvent _ => () {},
        ErrorEvent _ => () {},
        CreateContactEvent e => _create(e, emit),
        DeleteContactEvent e => _delete(e, emit),
        UpdateContactEvent e => _update(e, emit),
      },
    );
  }

  void _loading(LoadingEvent event, Emitter<HomeState> emit) async {
    emit(const LoadingState());

    try {
      Object? result = await locator.get<Network>().get(api: Api.contacts);
      List<Contact> contacts = Parser.parseContacts(result);

      emit(LoadedState(contacts: contacts));
    } catch (e) {
      emit(ErrorState(message: "$e"));
    }
  }

  void _create(CreateContactEvent event, Emitter<HomeState> emit) async {
    try {
      await locator.get<Network>().post(
        api: Api.contacts,
        data: {
          "name": event.name,
          "number": event.number,
        },
      );
    } catch (e) {
      emit(ErrorState(message: "$e"));
    }
  }
  void _delete(DeleteContactEvent event, Emitter<HomeState> emit) async {
    try {
      await locator.get<Network>().delete(api: Api.contacts, id: event.id);
    }catch(e) {
      emit(ErrorState(message: "$e"));
    }
  }
  void _update(UpdateContactEvent event, Emitter<HomeState> emit) async {
    try {
      await locator.get<Network>().patch(
            api: Api.contacts,
            data: {
              "name" : event.name,
              "number" : event.number,
            },
            id: event.id,
          );
    } catch (e) {
      emit(ErrorState(message: "$e"));
    }
  }
}
