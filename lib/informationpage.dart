import 'package:flutter/material.dart';

class informationpage extends StatelessWidget {

  String name, phonenumber, email;

  informationpage({required this.name, required this.phonenumber, required this.email});


  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.deepOrange[50],
      appBar: AppBar( backgroundColor: Colors.deepOrange,
        title: const Text('Your Information'),
        centerTitle: true,
      ),
    body: Center(
      child: Column( mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('NAME', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
          Text('$name', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                Text('PHONE NUMBER',style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                Text('$phonenumber',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ],
            ),

          ),

          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                Text('EMAIL',style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                Text('$email',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ],
            ),
          ),

        ],
      ),
    ),
    );

  }
}

