import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'database.dart';

class View extends StatefulWidget {
  View({ Key? key, required this.control, required this.db}) : super(key: key);
  Map control;
  Database db;
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  TextEditingController pesoController = new TextEditingController();
  TextEditingController temperaturaController = new TextEditingController();
  TextEditingController presionController = new TextEditingController();
  TextEditingController saturacionController = new TextEditingController();
  @override
  void initState() {
    super.initState();
    print(widget.control);
    pesoController.text = widget.control['peso'];
    temperaturaController.text = widget.control['temperatura'];
    presionController.text = widget.control['presion'];
    saturacionController.text = widget.control['saturacion'];

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(56, 75, 49, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(56, 75, 49, 1.0),
        title: Text("Control View"),
        actions: [
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                widget.db.deleteControl(widget.control["id"]);
                Navigator.pop(context, true);
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: inputDecoration("Peso"),
                controller: pesoController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: inputDecoration("Temperatura"),
                controller: temperaturaController,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: inputDecoration("Presion"),
                controller: presionController,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: inputDecoration("Saturacion"),
                controller: saturacionController,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Colors.transparent,
        child: BottomAppBar(
          color: Colors.transparent,
          child: RaisedButton(
              color: Colors.black,
              onPressed: () {
                widget.db.updateControl(widget.control['id'], pesoController.text,
                    temperaturaController.text, presionController.text, saturacionController.text);
                Navigator.pop(context, true);
              },
              child: Text(
                "Save",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String labelText) {
    return InputDecoration(
      focusColor: Colors.white,
      labelStyle: TextStyle(color: Colors.white),
      labelText: labelText,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.black,
          width: 2.0,
        ),
      ),
    );
  }
}