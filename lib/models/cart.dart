import 'package:flutter_application_1/models/cat.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late CatModel cat;

  // Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => CatModel.getById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
