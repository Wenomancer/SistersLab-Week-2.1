
class Animal {
  void makeSound() {
    print('Animal makes sound');
  }
}


class Dog extends Animal {

  @override
  void makeSound() {
    print('Dog barks');
  }
}

class Cat extends Animal {

  @override
  void makeSound() {
    print('Cat meows');
  }
}

void main() {
  Animal myAnimal = Dog();
  myAnimal.makeSound();

  myAnimal = Cat();
  myAnimal.makeSound();
}
