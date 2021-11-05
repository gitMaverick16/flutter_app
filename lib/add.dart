import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'database.dart';

class Add extends StatefulWidget {
  Add({Key? key, required this.db}) : super(key: key);
  Database db;
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController nombreController = new TextEditingController();
  TextEditingController apellidoController = new TextEditingController();
  TextEditingController anioController = new TextEditingController();
  TextEditingController mesController = new TextEditingController();
  TextEditingController diaController = new TextEditingController();
  TextEditingController estaturaController = new TextEditingController();
  TextEditingController direccionController = new TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(56, 75, 49, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(56, 75, 49, 1.0),
        title: Text("Agregar control del paciente pepe"),
        actions: [
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // widget.db.delete(widget.paciente["id"]);
                // Navigator.pop(context, true);
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
                decoration: inputDecoration("Nombre"),
                controller: nombreController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: inputDecoration("Año de nacimiento"),
                controller: apellidoController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: inputDecoration("Mes de nacimiento"),
                controller: anioController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: inputDecoration("Saturacion"),
                controller: mesController,
              ),
              SizedBox(
                height: 20,
              ),/*
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: inputDecoration("Dia nacimiento"),
                controller: diaController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: inputDecoration("Estatura"),
                keyboardType: TextInputType.number,
                controller: estaturaController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: inputDecoration("Direccion"),
                controller: direccionController,
              ),*/
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
                widget.db.create(nombreController.text, apellidoController.text, anioController.text, mesController.text, diaController.text, estaturaController.text, direccionController.text);
                Navigator.pop(context, true);
              },
              child: Text(
                "Guardar",
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