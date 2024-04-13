


class StudentRestModel {
    List<StudentMOdel>? lstStudents;

    StudentRestModel({
        this.lstStudents,
    });

    factory StudentRestModel.fromJson(Map<String, dynamic> json) => StudentRestModel(
        lstStudents: json["students"] == null ? [] : List<StudentMOdel>.from(json["students"]!.map((x) => StudentMOdel.fromJson(x))),
    );
}


class StudentMOdel {
  String? name;
  String? place;
  int? age;
  String? phone;
  String? batch;

  StudentMOdel({
    this.name,
    this.place,
    this.age,
    this.phone,
    this.batch,
  });

// factory StudentMOdel.fromJson(Map<String, dynamic> json) => StudentMOdel(
//         name: json["name"],
//         place: json["place"],
//         age: json["age"],
//         phone: json["phone"],
//         batch: json["batch"],
//     );


   factory StudentMOdel.fromJson(Map<String, dynamic> json) => StudentMOdel(
        name: json["name"],
        place: json["place"],
        age: json["age"],
        phone: json["ph"],
        batch: json["batch"],
    );
}
