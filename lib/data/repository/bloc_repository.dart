
import 'package:sisterslabsecond/data/model/UserModel.dart';

class BlocRepository {


  List<UserModel> UserList = [
    UserModel(name: 'User1', email: "blablabla@gmailcom", password: "123123"),
    UserModel(name: 'User2', email: "asdf@gmailcom", password: "123123"),
    UserModel(name: 'User3', email: "eqwerqwer@gmailcom", password: "123123"),
    UserModel(name: 'User4', email: "vbnmvbnm@gmailcom", password: "123123"),
    UserModel(name: 'User5', email: "dfgh@gmailcom", password: "123123"),
    UserModel(name: 'User6', email: "bdddsfgsfdg@gmailcom", password: "123123"),
  ];

  List<UserModel> getUserList() {
    return UserList;
  }

  int _counter = 0;

  int get counter => _counter;
  set counter(int value) {
    _counter = value;
  }



}