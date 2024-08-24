

abstract class Animal {
  int age = 0;
  String name = "";

  void setAge(int age) {
    this.age = age;
  }

  void setName(String name) {
    this.name = name;
  }

  void getAge() {
    print("Age: $age");
  }

  void getName() {
    print("Name: $name");
  }

  void breathe() {
    print("Animal breathes");
  }
  void makeNoise();
}

class Dog extends Animal {

  @override
  void makeNoise() {
    print("Dog barks");
  }

}

class Cat extends Animal {

  @override
  void breathe() {
    print("Cat breathes");
  }

  @override
  void makeNoise() {
    print("Cat meows");
  }
}

void main() {

  Animal myAnimal = Dog();
  myAnimal.makeNoise();
  myAnimal.breathe();

  myAnimal = Cat();
  myAnimal.makeNoise();
  myAnimal.breathe();
}