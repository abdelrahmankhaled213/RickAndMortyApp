 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/Home/Data/Model/getData.dart';
import 'package:ecommerce_app/features/Home/Data/webservices/services.dart';
import 'package:flutter/material.dart';

class MensRepo implements Services{
  @override
  Future<List<Mens>> getMensCategory() async{
    var menslist=<Mens>[];
 await FirebaseFirestore.instance.collection('Mens').
    get().
    then(
            (value) =>
                value.docs.forEach(
                    (element) {
      menslist.add(
          Mens.
      fromJson(element.data()
      )
      );
    }
    )
    );
    return menslist;
  }

}