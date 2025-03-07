import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:terapiya_center/composants/button_decoration.dart';
import 'package:terapiya_center/rdv/confirmation_rdv.dart';

class PrendreRdvFemme extends StatefulWidget {
  const PrendreRdvFemme({super.key});

  @override
  State<PrendreRdvFemme> createState() => _PrendreRdvFemmeState();
}

class _PrendreRdvFemmeState extends State<PrendreRdvFemme> {
  DateTime _selectedDate = DateTime.now();
  final String _selectedGender = "Femme";
  String? _selectedTherapie;
  String? _selectedTime;
  List<String> _availableTimes = [];



  final Map<String, int> _therapieDurations = {
    "Hijama (30€)": 30,
    "Hijama + bas du corps (35€)": 30,
    "Hijama + avant du corps (35€)": 30,
    "Hijama + massage (50€)": 60,
    "Hijama totale (60€)": 60,
    "Auriculothérapie - Troubles Psychiques (50€)": 60,
    "Auriculothérapie - Addictions (180€)": 60,
    "Détatouage - Small (60€)": 30,
    "Détatouage - Medium (80€)": 30,
    "Détatouage - Large (100€)": 30,
    "Microneedling (70€)": 30,
    "Hydrafacial (65€)": 30,
    "Korean Facial (55€)": 30,
  };



  final Map<String, List<String>> _timeSlots = {
    "lundi": ["10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30"],
    "mardi": ["10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30"],
    "vendredi": ["10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30"]
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
    if (_selectedTherapie == null || _selectedTime == null) {
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
      body: SingleChildScrollView(
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
              '⚠️ Pour réserver plusieurs thérapies pour vous-même ou pour votre groupe, voyez les créneaux libres consécutifs, réservez le premier créneau puis revenez pour réserver les suivants. 😊',
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
                "Hijama + massage (50€)",
                "Hijama totale (60€)",
                "Auriculothérapie - Troubles Psychiques (50€)",
                "Auriculothérapie - Addictions (180€)",
                "Détatouage - Small (60€)",
                "Détatouage - Medium (80€)",
                "Détatouage - Large (100€)",
                "Microneedling (70€)",
                "Hydrafacial (65€)",
                "Korean Facial (55€)",
              ].map((value) => DropdownMenuItem(
                value: value,
                child: Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              )).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedTherapie = newValue;
                  _updateAvailableTimes();
                });
              },
            ),
            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              value: _selectedTime,
              hint: const Text("Sélectionnez un horaire"),
              items: _availableTimes.map((time) => DropdownMenuItem(value: time, child: Text(time))).toList(),
              onChanged: (newValue) => setState(() => _selectedTime = newValue),
            ),
            const SizedBox(height: 30),

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
    );
  }
}
