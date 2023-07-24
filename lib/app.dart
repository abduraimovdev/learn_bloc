import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/cu_contact_cubit.dart';
import 'package:learn_bloc/bloc/list_contact_cubit.dart';
import 'package:learn_bloc/screens/home_screen.dart';

class ContactApp extends StatelessWidget {
  const ContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ListContactCubit()),
          BlocProvider(create: (context) => CuContactCubit()),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}
