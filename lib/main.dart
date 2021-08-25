
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hnhi8_project1/informationpage.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

void main() => runApp(const MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  final TextEditingController _name = TextEditingController();
  final TextEditingController _phonenumber = TextEditingController();
  final TextEditingController _email = TextEditingController();

  String imagePath = "";
  final picker = ImagePicker();


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
              Stack(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.deepOrange,
                    child: CircleAvatar(
                        radius: 63,
                        backgroundColor: Colors.grey,

                        child: Stack(

                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 20, 20, 0),
                              child: Column( crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Ink(
                                    decoration: ShapeDecoration(
                                        shape: CircleBorder(),
                                        color: Colors.deepOrange),
                                    child: IconButton(
                                        onPressed: () async {
                                          final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                                          if (pickedFile != null) {
                                            File? croppedFile = await ImageCropper.cropImage(
                                                sourcePath: pic​
2
import 'dart:io';
3
​
4
import 'package:flutter/material.dart';
5
import 'package:hnhi8_project1/informationpage.dart';
6
import 'package:flutter/services.dart';
7
import 'package:intl_phone_field/intl_phone_field.dart';
8
​
9
void main() => runApp(const MaterialApp(
10
      home: Home(),
11
    ));
12
​
13
class Home extends StatefulWidget {
14
  const Home({Key? key}) : super(key: key);
15
​
16
  @override
17
  _HomeState createState() => _HomeState();
18
}
19
20
class _HomeState extends State<Home> {
21

23
  final TextEditingController _name = TextEditingController();
24
  final TextEditingController _phonenumber = TextEditingController();
25
  final TextEditingController _email = TextEditingController();

28
  @override
29
  Widget build(BuildContext context) {
30
    return Scaffold(
31
      backgroundColor: Colors.deepOrange[50],
32
      appBar: AppBar(
33
        backgroundColor: Colors.deepOrange,
34
        title: const Text('Input Information'),
35
        centerTitle: true,
36
      ),
37
      body: SingleChildScrollView(
38
        child: Padding(
39
          padding: const EdgeInsets.only(top: 40),
40
          child: Column(
41
            mainAxisAlignment: MainAxisAlignment.center,
42
            children: [
43
              Image.asset('images/download.png'),
44
              Container(
45
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
46
                child: TextField(
47
                  controller: _name,
48
                  decoration: const InputDecoration(
49
                      border: OutlineInputBorder(), labelText: 'Name'),
50
                ),
51
              ),
52
              Container(
53
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
54
                  child: IntlPhoneField(
55
                    controller: _phonenumber,
56
                    decoration: const InputDecoration(
57
                        border: OutlineInputBorder(),
58
                        labelText: 'Phone Number'),
59
                    keyboardType: TextInputType.number,
60
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
61
                    initialCountryCode: 'IN',
62
                    onChanged: (phone) {
63
                      print(phone.countryCode);
64
                    },
65
                  )),
66
              Container(
67
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
68
                child: TextField(
69
                  controller: _email,
70
                  decoration: const InputDecoration(
71
                      border: OutlineInputBorder(), labelText: 'Email'),
72
                ),
73
              ),
74

78
              ElevatedButton(
79
                  style: ButtonStyle(
80
                      backgroundColor:
81
                      MaterialStateProperty.all(Colors.deepOrange)),
82
                  onPressed: () {
83
                    Navigator.of(context).push(MaterialPageRoute(
84
                        builder: (context) => informationpage(
85
​
86
                            name: _name.text,
87
                            phonenumber: _phonenumber.text,
88
                            email: _email.text)));
89
                  },
90
                  child: Text('Submit'))
91
            ],
92
          ),
93
        ),
94
      ),
95
    );
96
  }
97
}
98
kedFile.path,
                                                aspectRatioPresets: [
                                                  CropAspectRatioPreset.square,

                                                ],
                                                androidUiSettings: AndroidUiSettings(
                                                    toolbarTitle: 'Cropper',
                                                    toolbarColor: Colors.deepOrange,
                                                    toolbarWidgetColor: Colors.white,
                                                    initAspectRatio: CropAspectRatioPreset.original,
                                                    lockAspectRatio: false),
                                                iosUiSettings: IOSUiSettings(
                                                  minimumAspectRatio: 1.0,
                                                )
                                            );
                                            if (croppedFile != null) {
                                              setState(() {
                                                imagePath = croppedFile.path;
                                              });
                                            }
                                          }
                                        },
                                        icon: Icon(Icons.camera_alt_rounded, size: 30,
                                            color: Colors.white)),
                                  ),


                                  const Text(
                                    'Click icon to \n add picture',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold, fontSize: 12),
                                  ),

                                ],
                              ),
                            ),
                            imagePath != ""
                                ? CircleAvatar( radius: 150,
                              child: ClipRRect( borderRadius: BorderRadius.circular(1000),
                                child: Image.file(File(imagePath)),
                              ),
                            )
                                : ClipRRect(),
                          ],
                        )),
                  ),

                ],
              ),

              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: TextField(
                  controller: _name,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Name'),
                ),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: IntlPhoneField(
                    controller: _phonenumber,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone Number'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    initialCountryCode: 'IN',
                    onChanged: (phone) {
                      print(phone.countryCode);
                    },
                  )),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: TextField(
                  controller: _email,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Email'),
                ),
              ),




              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.deepOrange)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => informationpage(
                            imagePath: imagePath,
                            name: _name.text,
                            phonenumber: _phonenumber.text,
                            email: _email.text)));
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
