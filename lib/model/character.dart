class Character {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  String origin;
  String location;
  String image;
  //String episode;

  Character.fromMap(Map<String, dynamic> map)
      : id = map["id"] ?? 0,
        name = map["name"] ?? "",
        status = map["status"] ?? "",
        species = map["species"] ?? "",
        type = map["type"] ?? "",
        gender = map["gender"] ?? "",
        origin = map["name"] ?? "",
        location = map["name"] ?? "",
        image = map["image"] ?? "";
  //episode = (map["episode"] as List<dynamic>).isNotEmpty
  //? map["episode"][0]
  //: "";
}
