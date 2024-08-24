class Car {
  String color;
  int year;

  Car({this.color = "Red",  this.year = 2025});

  void revCar() {
    print("Vroom Vroom");
  }
}

class Toyota extends Car {
  String model;

  Toyota({
    required this.model,
  });

  void revCarToyota() {
    print("Vroom Vroom Vroom Toyota");
  }
}


void main() {

  Toyota myToyota = Toyota(model: "Corolla");

  myToyota.revCar();
  myToyota.revCarToyota();
  print(myToyota.color);

}
