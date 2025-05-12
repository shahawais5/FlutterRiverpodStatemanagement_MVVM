class CarModel {
  final int id;
  final String make;
  final String model;
  final int year;
  final String vin;
  final String price;
  final bool available;

  CarModel({
    required this.id,
    required this.make,
    required this.model,
    required this.year,
    required this.vin,
    required this.price,
    required this.available,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      make: json['car'],
      model: json['car_model'],
      year: json['car_model_year'],
      vin: json['car_vin'],
      price: json['price'],
      available: json['availability'],
    );
  }
}
