import 'package:flutter/material.dart';

import 'HabitTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _newHabitNameController = TextEditingController();
  List todayHabitList = [
    ["Morning Run", false],
    ["Reading NewsPaper", false],
  ];

  // open habit settings to edit
  void openHabitSettings(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: TextField(
            controller: _newHabitNameController,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: 'Enter new Habit....',
              hintStyle: TextStyle(color: Colors.grey[600]),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                saveExistingHabit(index);
              },
              child: Text(
                "Update",
                style: TextStyle(color: Colors.white),
              ),
              color: const Color.fromARGB(255, 18, 64, 20),
            ),
            MaterialButton(
              onPressed: () {
                cancelDialogBox();
              },
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
              color: const Color.fromARGB(255, 18, 64, 20),
            ),
          ],
        );
      },
    );
  }

  // save existing habit with a new name
  void saveExistingHabit(int index) {
    setState(() {
      todayHabitList[index][0] = _newHabitNameController.text;
    });
    _newHabitNameController.clear();
    Navigator.pop(context);
  }

  // delete habit
  void deleteHabit(int index) {
    setState(() {
      todayHabitList.removeAt(index);
    });
  }

  void saveNewHabit() {
    // add new habit to todays habit list
    setState(() {
      todayHabitList.add([_newHabitNameController.text, false]);
    });

    // clear textfield
    _newHabitNameController.clear();
    // pop dialog box
    Navigator.of(context).pop();
  }

  // cancel new habit
  void cancelDialogBox() {
    // clear textfield
    _newHabitNameController.clear();
    // pop dialog box
    Navigator.of(context).pop();
  }

  void createnewhabit() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: TextField(
            controller: _newHabitNameController,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: 'Enter new Habit....',
              hintStyle: TextStyle(color: Colors.grey[600]),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                saveNewHabit();
              },
              child: Text(
                "Save",
                style: TextStyle(color: Colors.white),
              ),
              color: const Color.fromARGB(255, 18, 64, 20),
            ),
            MaterialButton(
              onPressed: () {
                cancelDialogBox();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
              color: const Color.fromARGB(255, 18, 64, 20),
            ),
          ],
        );
      },
    );
  }

  void checkBoxtapped(bool? value, int index) {
    setState(() {
      todayHabitList[index][1] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 15, 42, 16),
            title: Text('My Habits')),
        backgroundColor: Colors.grey[300],
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              createnewhabit();
            },
            child: Icon(Icons.add)),
        body: ListView.builder(
            itemCount: todayHabitList.length,
            itemBuilder: (context, index) {
              return HabitTile(
                habitName: todayHabitList[index][0],
                habitCompleted: todayHabitList[index][1],
                onChanged: (value) {
                  checkBoxtapped(value, index);
                },
                settingsTapped: (context) {
                  openHabitSettings(index);
                },
                deleteTapped: (context) {
                  deleteHabit(index);
                },
              );
            }));
  }
}
