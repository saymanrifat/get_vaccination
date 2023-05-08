import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  static String brand = '';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccine'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: 'Pincode',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              onChanged: (data) {
                MyHomePage.brand = data;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Material(
              elevation: 5,
              color: Colors.teal,
              borderRadius: BorderRadius.circular(10),
              child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'result');
                  },
                  child: const Text(
                    'Search',
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
