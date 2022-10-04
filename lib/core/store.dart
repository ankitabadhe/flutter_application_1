import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/cat.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatModel cat;
  late CartModel cart;

  MyStore() {
    cat = CatModel();
    cart = CartModel();
    cart.cat = cat;
  }
}
