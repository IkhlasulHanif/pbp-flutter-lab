import 'package:flutter/material.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/drawer.dart';

class MyDataPage extends StatefulWidget {
  const MyDataPage({Key? key}) : super(key: key);

  @override
  State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Budget'),
      ),
      drawer: DrawerWidget(),
      body: Container(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: listOfCards,
        ),
      ),
    );
  }
}