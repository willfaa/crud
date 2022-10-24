import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class TaskScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController dialController = TextEditingController();
  DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  TaskScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(
        //   Icons.arrow_back_ios,
        //   color: Colors.green.shade900,
        // ),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        title: RichText(
            text: TextSpan(
                text: "PAGARNUSA SEDATI",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.green.shade900))),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.green.shade900,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Name",
                    floatingLabelStyle: const TextStyle(
                        height: 4, color: Color.fromARGB(255, 15, 191, 204)),
                    filled: true,
                    fillColor: Colors.grey[200],
                    prefixIcon: const Icon(Icons.person),
                  ),
                ),
                TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Age",
                    floatingLabelStyle: const TextStyle(
                        height: 4, color: Color.fromARGB(255, 15, 191, 204)),
                    filled: true,
                    fillColor: Colors.grey[200],
                    prefixIcon: const Icon(Icons.format_list_numbered_outlined),
                  ),
                ),
                TextFormField(
                  controller: dialController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Dial",
                    floatingLabelStyle: const TextStyle(
                        height: 4, color: Color.fromARGB(255, 15, 191, 204)),
                    filled: true,
                    fillColor: Colors.grey[200],
                    prefixIcon: const Icon(Icons.dialer_sip),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: (() {
              Map<dynamic, dynamic> data = {
                "name": nameController.text.toString(),
                "age": ageController.text.toString(),
                "dial": dialController.text.toString()
              };
              dbRef
                  .push()
                  .set(data)
                  .then((value) => {Navigator.of(context).pop()});
            }),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade900,
            ),
            child: const Text(
              "SUBMIT",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
