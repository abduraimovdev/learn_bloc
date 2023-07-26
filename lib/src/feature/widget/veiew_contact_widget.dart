import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:learn_bloc/src/feature/widget/update_page.dart';

import '../bloc/home_bloc.dart';
import '../models/contact.dart';

class ViewContacts extends StatelessWidget {
  const ViewContacts({super.key, required this.contacts});

  final List<Contact> contacts;

  void deleteContact(String id) {}

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) => Slidable(
        key: ValueKey(index),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                context
                    .read<HomeBloc>()
                    .add(DeleteContactEvent(id: contacts[index].id!));

                context.read<HomeBloc>().add(const LoadingEvent());
              },
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: ListTile(
          leading: CircleAvatar(
            foregroundImage: NetworkImage(contacts[index].avatar.toString()),
          ),
          title: Text(contacts[index].name.toString()),
          subtitle: Text(contacts[index].number.toString()),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UpdatePage(contact: contacts[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
