import 'package:flutter/material.dart';

class ChoixTherapiesFemme extends StatefulWidget {
  final Function(List<String>) onSelectionChanged;

  const ChoixTherapiesFemme({
    super.key, 
    required this.onSelectionChanged
  });
  
  @override
  ChoixTherapiesFemmeState createState() => ChoixTherapiesFemmeState();
}

class ChoixTherapiesFemmeState extends State<ChoixTherapiesFemme> {
  List<String> selectedTherapies = [];

  final Map<String, int> _therapieDurations = {
    "Hijama (30€)": 30,
    "Hijama + bas du corps (35€)": 30,
    "Hijama + avant du corps (35€)": 30,
    "Hijama + massage (50€)": 60,
    "Hijama totale (60€)": 60,
    "Auriculothérapie - Troubles Psychiques (50€)": 30,
    "Auriculothérapie - Addictions (180€)": 30,
    "Détatouage - Small (60€)": 30,
    "Détatouage - Medium (80€)": 30,
    "Détatouage - Large (100€)": 30,
    "Microneedling (70€)": 30,
    "Hydrafacial (65€)": 30,
    "Korean Facial (55€)": 30,
  };

  void _toggleSelection(String therapie) {
    setState(() {
      if (selectedTherapies.contains(therapie)) {
        selectedTherapies.remove(therapie);
      } else {
        selectedTherapies.add(therapie);
      }
    });
    widget.onSelectionChanged(selectedTherapies);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Sélectionnez une ou plusieurs thérapies :", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: _therapieDurations.keys.map((therapie) {
            final isSelected = selectedTherapies.contains(therapie);

            return GestureDetector(
              onTap: () => _toggleSelection(therapie),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(color: isSelected ? Colors.teal : Colors.grey[300], borderRadius: BorderRadius.circular(20)),
                
                child: Text(
                  therapie,
                  style: TextStyle( color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.bold ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
