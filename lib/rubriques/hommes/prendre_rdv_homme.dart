import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:terapiya_center/composants/button_decoration.dart';
import 'package:terapiya_center/composants/input_decoration.dart';
import 'package:terapiya_center/rdv/confirmation_rdv.dart';

class PrendreRdvHomme extends StatefulWidget {
  const PrendreRdvHomme({super.key});

  @override
  State<PrendreRdvHomme> createState() => _PrendreRdvHommeState();
}

class _PrendreRdvHommeState extends State<PrendreRdvHomme> {
  DateTime _selectedDate = DateTime.now();
  final String _selectedGender = "Homme";
  String? _selectedTherapie;
  String? _selectedTime;
  List<String> _availableTimes = [];

  final TextEditingController _tel = TextEditingController();
  final TextEditingController _prenom = TextEditingController();

  final Map<String, int> _therapieDurations = {
    "Hijama (30€)": 30,
    "Hijama + bas du corps (35€)": 30,
    "Hijama + avant du corps (35€)": 30,
    "Hijama totale (40€)": 30,
    "Auriculothérapie - Troubles Psychiques (50€)": 60,
    "Auriculothérapie - Addictions (180€)": 60,
    "Détatouage - Small (60€)": 30,
    "Détatouage - Medium (80€)": 30,
    "Détatouage - Large (100€)": 30,
  };

  final Map<String, List<String>> _timeSlots = {
    "mercredi": ["11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00"],
    "jeudi": ["11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00"],
    "samedi": ["11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00"],
  };

  String? _getNextTimeSlot(String time) {
    String dayName = DateFormat('EEEE', 'fr_FR').format(_selectedDate).toLowerCase();
    List<String> slots = _timeSlots[dayName] ?? [];

    int index = slots.indexOf(time);
    if (index != -1 && index + 1 < slots.length) {
      return slots[index + 1];
    }
    return null;
  }

  Future<void> _updateAvailableTimes() async {
    String dayName = DateFormat('EEEE', 'fr_FR').format(_selectedDate).toLowerCase();
    if (!_timeSlots.containsKey(dayName)) {
      setState(() => _availableTimes = []);
      return;
    }
    
    List<String> bookedTimes = await _fetchBookedTimes();
    List<String> possibleTimes = List.from(_timeSlots[dayName]!);

    possibleTimes.removeWhere((time) => bookedTimes.contains(time));

    setState(() {
      _availableTimes = possibleTimes;
      _selectedTime = _availableTimes.isNotEmpty ? _availableTimes.first : null;
    });
  }



  Future<List<String>> _fetchBookedTimes() async {
    final snapshot = await FirebaseFirestore.instance.collection('rendezvous').where('date', isEqualTo: DateFormat('yyyy-MM-dd').format(_selectedDate)).get();
    
    List<String> blockedTimes = [];
    for (var doc in snapshot.docs) {
      blockedTimes.add(doc['time']);
      if (doc['blockedTimes'] != null) {
        blockedTimes.addAll(List<String>.from(doc['blockedTimes']));
      }
    }
    
    return blockedTimes.toSet().toList();
  }



  Future<void> _saveAppointment() async {
    if (_selectedTherapie == null || _selectedTime == null || _prenom.text.isEmpty || _tel.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Veuillez remplir tous les champs.")),
      );
      return;
    }
    final user = FirebaseAuth.instance.currentUser;
    String formattedDate = DateFormat('yyyy-MM-dd').format(_selectedDate);
    int duration = _therapieDurations[_selectedTherapie] ?? 30;

    await FirebaseFirestore.instance.collection('rendezvous').add({
      'userId': user!.uid,
      'date': formattedDate,
      'time': _selectedTime,
      'gender': _selectedGender,
      'therapie': _selectedTherapie,
      'prenom': _prenom.text.trim(),
      'telephone': _tel.text.trim(),
      'duration': duration,
      'blockedTimes': duration == 60 ? [_selectedTime, _getNextTimeSlot(_selectedTime!)] : [_selectedTime],
      'timestamp': FieldValue.serverTimestamp(),
    });

    if (!mounted) return;
    Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmationRdv(
      date: formattedDate,
      time: _selectedTime!,
      gender: _selectedGender,
      therapie: _selectedTherapie!,
      prenom: _prenom.text.trim(),
      tel: _tel.text.trim(),
      duree: duration,
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prise de RDV", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 53, 172, 177),
        foregroundColor: Colors.white,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TableCalendar(
                focusedDay: _selectedDate,
                firstDay: DateTime(2020, 1, 1),
                lastDay: DateTime(2030, 12, 31),
                locale: 'fr_FR',
                headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true),
                startingDayOfWeek: StartingDayOfWeek.monday,
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() => _selectedDate = selectedDay);
                  _updateAvailableTimes();
                },
                selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
              ),
              const SizedBox(height: 20),
        
              const Text(
                "⚠️ Pour réserver plusieurs RDV pour vous-même ou votre groupe, consultez les créneaux libres, réservez le premier, puis répétez l'opération pour les RDV suivants. 😊",
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
        
              DropdownButtonFormField<String>(
                value: _selectedTherapie,
                hint: const Text("Sélectionnez une thérapie"),
                items: [
                  "Hijama (30€)", 
                  "Hijama + bas du corps (35€)",
                  "Hijama + avant du corps (35€)",
                  "Hijama totale (40€)",
                  "Auriculothérapie - Troubles Psychiques (50€)", 
                  "Auriculothérapie - Addictions (180€)",
                  "Détatouage - Small (60€)",
                  "Détatouage - Medium (80€)",
                  "Détatouage - Large (100€)",
                ].map((value) => DropdownMenuItem(
                  value: value, 
                  child: Text(
                    value,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                )).toList(),
                onChanged: (newValue) => setState(() => _selectedTherapie = newValue),
              ),
              const SizedBox(height: 20),
        
              DropdownButtonFormField<String>(
                value: _selectedTime,
                hint: const Text("Sélectionnez un horaire"),
                items: _availableTimes.map((time) => DropdownMenuItem(value: time, child: Text(time))).toList(),
                onChanged: (newValue) => setState(() => _selectedTime = newValue),
              ),
              const SizedBox(height: 30),

              TextFormField(
                controller: _tel,
                decoration: textInputDecoration("0648573848", label: "Téléphone"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Veuillez entrer un numéro de téléphone.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _prenom,
                decoration: textInputDecoration("Mohamed", label: "Prénom"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Veuillez entrer un Prénom.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
        
        
              if (_selectedTherapie != null) 
                Text(
                  "Durée de la Thérapie : ${_therapieDurations[_selectedTherapie]} min",
                  style: const TextStyle(fontSize: 18),
              ),
        
              const SizedBox(height: 50),
              CustomButton(
                text: "Confirmer le RDV",
                borderColor: const Color.fromARGB(255, 53, 172, 177),
                bgColor: const Color.fromARGB(255, 53, 172, 177),
                txtColor: Colors.white,
                onPressed: _saveAppointment,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
