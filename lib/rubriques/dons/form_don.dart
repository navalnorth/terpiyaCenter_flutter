import 'package:flutter/material.dart';

class FormDon extends StatefulWidget {
  const FormDon({super.key});

  @override
  State<FormDon> createState() => _FormDonState();
}

class _FormDonState extends State<FormDon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FAIRE UN DON',
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
      ),

      body: const SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20)
            )
          ],
        ),
      ),
    );
  }
}