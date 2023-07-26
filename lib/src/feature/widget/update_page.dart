import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/src/feature/models/contact.dart';

import '../bloc/home_bloc.dart';

class UpdatePage extends StatefulWidget {
  final Contact contact;

  const UpdatePage({super.key, required this.contact});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late final TextEditingController nameController;
  late final TextEditingController numberController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.contact.name);
    numberController = TextEditingController(text: widget.contact.number);
  }

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }

  void updateContact() {
    if (nameController.text.trim().isNotEmpty &&
        numberController.text.trim().isNotEmpty) {
      context.read<HomeBloc>().add(
            UpdateContactEvent(
              id: widget.contact.id!,
              name: nameController.text.trim(),
              number: numberController.text.trim(),
            ),
          );

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter text"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Update'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "Name",
              ),
            ),
            const SizedBox(height: 30,),
            TextField(
              controller: numberController,
              decoration: const InputDecoration(
                hintText: "Number",
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: updateContact, child: const Icon(Icons.edit),),
    );
  }
}
