import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'database.dart';

class View extends StatefulWidget {
  View({ Key? key, required this.paciente, required this.db}) : super(key: key);
  Map paciente;
  Database db;
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
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
    print(widget.paciente);
    nombreController.text = widget.paciente['nombre'];
    apellidoController.text = widget.paciente['apellido'];
    anioController.text = widget.paciente['anio'];
    mesController.text = widget.paciente['mes'];
    diaController.text = widget.paciente['dia'];
    estaturaController.text = widget.paciente['estatura'];
    direccionController.text = widget.paciente['direccion'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(56, 75, 49, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(56, 75, 49, 1.0),
        title: Text("Paciente View"),
        actions: [
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                widget.db.delete(widget.paciente["id"]);
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
                decoration: inputDecoration("Nombre"),
                controller: nombreController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: inputDecoration("Apellido"),
                controller: apellidoController,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: inputDecoration("Año nacimiento"),
                controller: anioController,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: inputDecoration("Mes nacimiento"),
                controller: mesController,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: inputDecoration("Dia nacimiento"),
                controller: diaController,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: inputDecoration("Estatura"),
                controller: estaturaController,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: inputDecoration("Direccion"),
                controller: direccionController,
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
                widget.db.update(widget.paciente['id'], nombreController.text,
                    apellidoController.text, anioController.text, mesController.text,
                    diaController.text, estaturaController.text, direccionController.text);
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