// To parse this JSON data, do
//
//     final addresses = addressesFromJson(jsonString);

class Addresses {
  Addresses({
    required this.name,
    required this.streets,
    required this.number,
    required this.road,
    required this.neighborhood,
    required this.latitud,
    required this.longitud,
  });

  String name;
  String streets;
  int number;
  String road;
  String neighborhood;
  double latitud;
  double longitud;

  factory Addresses.fromJson(Map<String, dynamic> json) => Addresses(
        name: json["name"],
        streets: json["streets"],
        number: json["number"],
        road: json["road"],
        neighborhood: json["neighborhood"],
        latitud: json["latitud"],
        longitud: json["longitud"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "streets": streets,
        "number": number,
        "road": road,
        "neighborhood": neighborhood,
        "latitud": latitud,
        "longitud": longitud,
      };

  Addresses copyWith({
    required String name,
    required String streets,
    required int number,
    required String entreCalles,
    required String neighborhood,
    required double latitud,
    required double longitud,
  }) =>
      Addresses(
        name: name,
        streets: streets,
        number: number,
        road: road,
        neighborhood: neighborhood,
        latitud: latitud,
        longitud: longitud,
      );
}
