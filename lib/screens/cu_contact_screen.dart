import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/cu_contact_cubit.dart';
import 'package:learn_bloc/bloc/cu_contact_state.dart';
import 'package:learn_bloc/models/contact.dart';

class CuContactScreen extends StatefulWidget {
  final Contact? contact;

  const CuContactScreen({super.key, this.contact});

  @override
  State<CuContactScreen> createState() => _CuContactScreenState();
}

class _CuContactScreenState extends State<CuContactScreen> {

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CuContactCubit>(context).updateOrCreate();
    return Scaffold(
      body: BlocBuilder<CuContactCubit, CuContactState>(
        builder: (context, state) {
          if (widget.contact != null && state is CuContactUpdate) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: state.nameController
                    ..text = widget.contact!.name.toString(),
                  decoration: const InputDecoration(
                    hintText: "Name",
                  ),
                ),
                TextField(
                  controller: state.nameController
                    ..text = widget.contact!.name.toString(),
                  decoration: const InputDecoration(
                    hintText: "Name",
                  ),
                ),
                TextButton(
                  onPressed: state.update,
                  child: const Text("Update"),
                ),
              ],
            );
          }

          if (state is CuContactCreate) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: state.nameController,
                  decoration: const InputDecoration(
                    hintText: "Name",
                  ),
                ),
                TextField(
                  controller: state.nameController,
                  decoration: const InputDecoration(
                    hintText: "Number",
                  ),
                ),
                TextButton(
                  onPressed: state.create,
                  child: const Text("Update"),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
