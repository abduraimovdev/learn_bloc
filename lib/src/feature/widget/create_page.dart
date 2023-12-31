import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  late final TextEditingController nameController;
  late final TextEditingController numberController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    numberController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }

  void createContact() {
    if (nameController.text.trim().isNotEmpty && numberController.text.trim().isNotEmpty) {
      context.read<HomeBloc>().add(
            CreateContactEvent(
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
        title: const Text('Contact Create'),
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
      floatingActionButton: FloatingActionButton(onPressed: createContact, child: const Icon(Icons.add),),
    );
  }
}
