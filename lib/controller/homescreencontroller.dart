import 'dart:convert';
import 'dart:developer';

import 'package:api_sample/model/api_res_model.dart';
import 'package:api_sample/model/homescreenmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeController with ChangeNotifier {
  var myData;
  RestModel? restModel;
  // Map<String, dynamic> students = {
  //   'name': 'Thejal',
  //   'place': 'Kannur',
  //   'age': 23,
  //   'phone': '8281531024',
  //   'batch': 'CSE'
  // };

  var studentMap = {
    "students": [
      {
        "name": "asdfgh",
        "place": "123456789",
        "age": 3,
        "ph": "23456789",
        "batch": "cvbnm"
      },
      {
        "name": "John Doe",
        "place": "987654321",
        "age": 20,
        "ph": "9876543210",
        "batch": "xyz"
      },
      {
        "name": "Jane Smith",
        "place": "456789123",
        "age": 25,
        "ph": "1234567890",
        "batch": "abc"
      }
    ]
  };

  List<StudentMOdel>? lstStudent;
  void getData() {
    // student = StudentMOdel.fromJson(students);
//  student= StudentMOdel(name: students['name'], place: students['place'], age: students['age'], batch: students['batch'], phone: students['phone']);}
    // notifyListeners();

    // lstStudent = studentMap
    //     .map((e) => StudentMOdel(
    //         name: e["name"],
    //         place: e["place"],
    //         age: e["age"],
    //         batch: e["batch"],
    //         phone: e["phone"]))
    //     .toList();

    // lstStudent = studentMap.map((e) => StudentMOdel.fromJson(e)).toList();

    StudentRestModel restModel = StudentRestModel.fromJson(studentMap);
    lstStudent = restModel.lstStudents ?? [];
  }

// get data from api
  Future apiGetData() async {
//  Url
    Uri url = Uri.parse("https://reqres.in/api/users?page=2");
// calling api get method
    var res = await http.get(url);

// checking status code

    if (res.statusCode == 200) {
      print(res.body);

      var convertedData = jsonDecode(res.body);
      myData = convertedData;
      restModel = RestModel.fromJson(myData);
      print(restModel?.page ?? "HI");
      log(restModel?.page.toString()??"hj");
    } else {
      print("Failed");
    }
  }
}
