import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:terapiya_center/composants/button_decoration.dart';
import 'package:terapiya_center/rdv/confirmation_rdv.dart';

class PrendreRdv extends StatefulWidget {
  const PrendreRdv({super.key});

  @override
  State<PrendreRdv> createState() => _PrendreRdvState();
}

class _PrendreRdvState extends State<PrendreRdv> {
  DateTime _selectedDate = DateTime.now();
  String? _selectedGender;
  String? _selectedTherapie;
  String? _selectedTime;
  List<String> _availableTimes = [];

  final Map<String, List<String>> _jours = {
    "Femme": ["lundi", "mardi", "vendredi"],
    "Homme": ["mercredi", "jeudi", "samedi"],
  };

  final Map<String, List<String>> _timeSlots = {
    "lundi": ["10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30"],
    "mardi": ["10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30"],
    "vendredi": ["10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30"],
    "mercredi": ["11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00"],
    "jeudi": ["11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00"],
    "samedi": ["11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00"],
  };


  Future<void> _updateAvailableTimes() async {
    if (_selectedGender == null) return;

    String dayName = DateFormat('EEEE', 'fr_FR').format(_selectedDate).toLowerCase();

    if (!_jours[_selectedGender]!.contains(dayName)) {
      setState(() {
        _availableTimes = [];
      });
      return;
    }

    List<String> allTimes = _timeSlots[dayName] ?? [];
    List<String> bookedTimes = await _fetchBookedTimes();

    setState(() {
      _availableTimes = allTimes.where((time) => !bookedTimes.contains(time)).toList();
      _selectedTime = _availableTimes.isNotEmpty ? _availableTimes.first : null;
    });
  }



  Future<List<String>> _fetchBookedTimes() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('rendezvous')
        .where('date', isGreaterThanOrEqualTo: DateFormat('yyyy-MM-dd').format(_selectedDate))
        .where('date', isLessThan: DateFormat('yyyy-MM-dd').format(_selectedDate.add(const Duration(days: 1))))
        .get();

    return snapshot.docs.map((doc) => doc['time'] as String).toList();
  }


  Future<void> _saveAppointment() async {
    if (_selectedGender == null || _selectedTherapie == null || _selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Veuillez remplir tous les champs.")),
      );
      return;
    }

    final user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance.collection('rendezvous').add({
      'userId': user!.uid,
      'date': DateFormat('yyyy-MM-dd').format(_selectedDate),
      'time': _selectedTime,
      'gender': _selectedGender,
      'therapie': _selectedTherapie,
      'timestamp': FieldValue.serverTimestamp(),
    });

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Rendez-vous enregistré !")),
    );

    setState(() {
      _selectedTime = null;
      _updateAvailableTimes();
    });

    Navigator.push(context, MaterialPageRoute(builder: (context) => const ConfirmationRdv()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prise de RDV", style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 53, 172, 177),
        foregroundColor: Colors.white,
      ),

      body: Padding(
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
                setState(() {
                  _selectedDate = selectedDay;
                });
                _updateAvailableTimes();
              },
              selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
            ),
            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              value: _selectedGender,
              hint: const Text("Sélectionnez un genre"),
              items: ["Homme", "Femme"].map((value) => DropdownMenuItem(value: value, child: Text(value))).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedGender = newValue;
                  _updateAvailableTimes();
                });
                
              },
            ),
            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              value: _selectedTherapie,
              hint: const Text("Sélectionnez une thérapie"),
              items: ["Hijama", "Auriculothérapie", "Détatouage"]
                  .map((value) => DropdownMenuItem(value: value, child: Text(value)))
                  .toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedTherapie = newValue;
                });
              },
            ),
            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              value: _selectedTime,
              hint: const Text("Sélectionnez un horaire"),
              items: _availableTimes.map((time) => DropdownMenuItem(value: time, child: Text(time))).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedTime = newValue;
                });
              },
            ),
            const SizedBox(height: 50),

            CustomButton(
                text: "Confirmer le RDV",
                borderColor: const Color.fromARGB(255, 53, 172, 177),
                bgColor: const Color.fromARGB(255, 53, 172, 177),
                txtColor: Colors.white,
                onPressed: _saveAppointment
              ),
          ],
        ),
      ),
    );
  }
}
