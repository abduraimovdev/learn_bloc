import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/list_contact_cubit.dart';
import 'package:learn_bloc/bloc/list_contact_state.dart';
import 'package:learn_bloc/screens/cu_contact_screen.dart';
import 'package:learn_bloc/views/error_widget.dart';
import 'package:learn_bloc/views/veiew_contact_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<ListContactCubit>(context).apiContactList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ListContactCubit, ListContactState>(
        builder: (BuildContext context, state) {
          if (state is ListContactError) {
            return ViewError(error: state.error);
          }

          if (state is ListContactLoaded) {
            var item = state.contacts;
            return ViewContacts(contacts: item!);
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CuContactScreen(),));
        },
        child: const Icon(Icons.add_call),
      ),
    );
  }
}
