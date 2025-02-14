import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';

class PrendreRdv extends StatefulWidget {
  const PrendreRdv({super.key});

  @override
  State<PrendreRdv> createState() => _PrendreRdvState();
}

class _PrendreRdvState extends State<PrendreRdv> {
  DateTime? selectedDateTime;

  Future<void> _selectDateTime() async {
    final result = await showBoardDateTimePicker(
      context: context, 
      pickerType: DateTimePickerType.datetime,
      initialDate: DateTime.now(),
      barrierColor: Colors.black,
      radius: 16,
    );

    if (result != null) {
      setState(() {
        selectedDateTime = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 53, 172, 177),
        title: const Text("Prise de RDV", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text(
                selectedDateTime != null ? "Date sélectionnée : ${selectedDateTime!.toLocal()}" : "Aucune date sélectionnée",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20,),

              ElevatedButton(
                onPressed: () {
                  _selectDateTime();
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 53, 172, 177),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  "Choisir une date",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )
          ],
        ),
      ),
    );
  }
}