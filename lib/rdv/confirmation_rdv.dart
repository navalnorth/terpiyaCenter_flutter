import 'package:flutter/material.dart';

class ConfirmationRdv extends StatefulWidget {
  const ConfirmationRdv({super.key});

  @override
  State<ConfirmationRdv> createState() => _ConfirmationRdvState();
}

class _ConfirmationRdvState extends State<ConfirmationRdv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Confirmation RDV"),
      ),
    );
  }
}