import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/src/feature/bloc/home_bloc.dart';

import 'create_page.dart';
import 'error_widget.dart';
import 'veiew_contact_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void openCreatePage(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreatePage(),
      ),
    );

    await Future.delayed(
      const Duration(milliseconds: 500),
      () => context.read<HomeBloc>().add(const LoadingEvent()),
    );
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => Scaffold(
          body: switch (state) {
            ErrorState error => ViewError(error: error.message),
            LoadedState loaded => ViewContacts(contacts: loaded.contacts),
            LoadingState _ => const Center(child: CircularProgressIndicator()),
          },
          floatingActionButton: FloatingActionButton(
            onPressed: () => openCreatePage(context),
            child: const Icon(Icons.add_call),
          ),
        ),
      );
}
