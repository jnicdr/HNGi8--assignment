import 'package:flutter/material.dart';
import 'package:hnhi8_project1/informationpage.dart';

void main() => runApp(const MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _name = new TextEditingController();
  TextEditingController _phonenumber = new TextEditingController();
  TextEditingController _email = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('Input Information'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/download.png'),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: TextField(
                  controller: _name,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Name'),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: TextField(
                  controller: _phonenumber,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Phone Number'),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: TextField(
                  controller: _email,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Email'),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => informationpage(
                            name: _name.text,
                            phonenumber: _phonenumber.text,
                            email: _email.text)));
                  },
                  child: Text('Submit Info' ))
            ],
          ),
        ),
      ),
    );
  }
}
