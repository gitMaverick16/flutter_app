import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Database {
  late FirebaseFirestore firestore;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  Future<void> create(String nombre, String apellido, String anio, String mes, String dia, String estatura, String direccion) async {
    try {
      await firestore.collection("pacientes").add({
        'nombre': nombre,
        'apellido': apellido,
        'anio': anio,
        'mes': mes,
        'dia': dia,
        'estatura': estatura,
        'direccion': direccion
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(String id) async {
    try {
      await firestore.collection("pacientes").doc(id).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot =
      await firestore.collection('pacientes').orderBy('nombre').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {"id": doc.id, "nombre": doc['nombre'], "apellido": doc["apellido"],
            "anio": doc["anio"], "mes": doc["mes"], "dia": doc["dia"], "estatura": doc["estatura"],
            "direccion": doc["direccion"]};
          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
    return docs;
  }

  Future<void> update(String id, String nombre, String apellido, String anio, String mes, String dia, String estatura, String direccion) async {
    try {
      await firestore
          .collection("pacientes")
          .doc(id)
          .update({'nombre': nombre, 'apellido': apellido, 'anio':anio, 'mes':mes, 'dia':dia, 'estatura':estatura, 'direccion':direccion});
    } catch (e) {
      print(e);
    }
  }


  ///////
  Future<void> createControl(String peso, String temperatura, String presion, String saturacion) async {
    try {
      await firestore.collection("controles").add({
        'peso': peso,
        'temperatura': temperatura,
        'presion': presion,
        'saturacion': saturacion
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteControl(String id) async {
    try {
      await firestore.collection("controles").doc(id).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<List> readControl() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot =
      await firestore.collection('controles').orderBy('peso').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {"id": doc.id, "peso": doc['peso'], "temperatura": doc["temperatura"],
            "presion": doc["presion"], "saturacion": doc["saturacion"]};
          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
    return docs;
  }

  Future<void> updateControl(String id, String peso, String temperatura, String presion, String saturacion) async {
    try {
      await firestore
          .collection("controles")
          .doc(id)
          .update({'peso': peso, 'temperatura': temperatura, 'presion':presion, 'saturacion':saturacion});
    } catch (e) {
      print(e);
    }
  }
}