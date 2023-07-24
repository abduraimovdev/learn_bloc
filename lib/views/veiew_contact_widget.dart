import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:learn_bloc/bloc/list_contact_cubit.dart';
import 'package:learn_bloc/models/contact.dart';

class ViewContacts extends StatelessWidget {
  final List<Contact> contacts;

  const ViewContacts({super.key, required this.contacts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) => Slidable(
        key: ValueKey(index),
        endActionPane:  ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) => BlocProvider.of<ListContactCubit>(context).apiContactDelete(contacts[index]),
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
        ),
      ),




    );
  }
}
