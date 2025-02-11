import 'package:flutter/material.dart';

InputDecoration textInputDecoration(String hintText) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,

    hintText: hintText,

    // Bordure par défaut (quand l'input est inactif)
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color.fromARGB(255, 53, 172, 177), width: 2), 
    ),

    // Bordure quand l'input est activé
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color.fromARGB(255, 53, 172, 177), width: 2),
    ),

    // Bordure quand l'input est désactivé mais encore visible
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color.fromARGB(255, 53, 172, 177), width: 2),
    ),
  );
}
