import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyResultPage extends StatefulWidget {
  const MyResultPage({Key? key}) : super(key: key);

  @override
  State<MyResultPage> createState() => _MyResultPageState();
}

class _MyResultPageState extends State<MyResultPage> {
  List<dynamic> myListInfo = [];
  int listC = 0;

  String pinCode = '';

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    Uri url = Uri.parse('https://dummyjson.com/products');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);

      myListInfo = decode['products'];

      setState(() {
        listC = myListInfo.length;
      });

      print('Number of books about http: $listC.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: listC,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(top: 5, left: 5, right: 5),
              height: 350,
              child: Container(
                margin: EdgeInsets.all(5),
                child: Card(
                  color: Colors.white70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                          backgroundColor: Color(
                                  (math.Random().nextDouble() * 0xFFFFFF)
                                      .toInt())
                              .withOpacity(1.0),
                          child: Text(
                            myListInfo[index]['id'].toString(),
                            style: TextStyle(color: Colors.white),
                          )),
                      Text(
                        'Product: ${myListInfo[index]['title'].toString()}',
                        style: TextStyle(fontSize: 22),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Image.network(
                          myListInfo[index]['thumbnail'].toString(),
                          height: 200,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Container(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Price: \$ ${myListInfo[index]['price'].toString()}',
                            style: TextStyle(fontSize: 18),
                          )),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
