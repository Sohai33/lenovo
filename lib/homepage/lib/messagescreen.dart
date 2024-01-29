import 'package:flutter/material.dart';

class messagescreen extends StatefulWidget {
  const messagescreen({super.key});

  @override
  State<messagescreen> createState() => _messagescreenState();
}

class _messagescreenState extends State<messagescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MESSAGESCREEN'),
      ),
      body:Center( child:Text('DOCTOR')),
    );
  }
}
