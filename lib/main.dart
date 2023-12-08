import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedValue = "Option 1";
  bool isReadOnly = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Search Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isReadOnly == false
            // isReadOnly == true
                ? TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Select an option',
                      border: OutlineInputBorder(),
                    ),
                    controller: TextEditingController(text: selectedValue),
                    readOnly: true,
                    onTap: () {
                      // You can add any specific action when the text field is tapped.
                    },
                  )
                : DropdownButton<String>(
                    value: selectedValue,
                    onChanged: (String? value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                    items: [
                      "Option 1",
                      "Option 2",
                      "Option 3",
                      "Option 4",
                      "Option 5",
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
            SizedBox(height: 20),
            Text(
              'Selected Value: $selectedValue',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
