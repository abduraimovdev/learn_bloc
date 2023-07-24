
import 'package:flutter/material.dart';

class ViewError extends StatelessWidget {
  final String error;

  const ViewError({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error.toString(),
        style: const TextStyle(
          color: Colors.red,
          fontSize: 25,
        ),
      ),
    );
  }
}
