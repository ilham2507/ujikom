// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class AuthProvider extends ChangeNotifier {
//   signup(String email, String password) async {
//     Uri url = Uri.parse(
//         "https://identitytoolkit.googleapis.com/v1/accounts:signInWithCustomToken?key=[API_KEY]");

//     var response = await http.post(
//       url,
//       body: jsonEncode({
//         "email": email,
//         "password": password,
//         "returnSecureToken": true,
//       }),
//     );

//     print(json.decode(response.body));
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/hive_flutter.dart';

class firebaseDBservice {
  var db = FirebaseFirestore.instance;

  Future addcatatan({
    String? judulcatatan,
    String? isicatatan,
  }) async {
    var box = await Hive.openBox('userBox');
    var uid = box.get('uid');
    var email = box.get('email');
    var catatan = {
      "judul": judulcatatan,
      "isi": isicatatan,
      "createdBy": email,
      "uidUser": uid,
    };

    var hasil =
        await db.collection('catatan').where('uidUser', isEqualTo: uid).get();
    return hasil;
  }

  Future editcatatan({
    required String uidCatatan,
    String? judulCatatan,
    String? isiCatatn,
  }) async {
    var catatan = {
      "judul": judulCatatan,
      "isi": isiCatatn,
    };
    var hasil = await db
        .collection('catatan')
        .doc(uidCatatan)
        .update(catatan)
        .then((value) {
      print('$judulCatatan berhasil diupdate');
    });
  }

  deletecatatan(uiCatatan) async {
    var hasil = await db.collection('catatan').doc(uiCatatan).delete();
  }
}
