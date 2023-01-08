// ignore_for_file: public_member_api_docs, sort_constructors_first
class Checkout {
  int? total;
  int? point;
  List<Item>? item;
  Vendor? vendor;
  String? payment;

  Checkout({this.total, this.point, this.item, this.vendor, this.payment});

  Checkout.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    point = json['point'];
    if (json['item'] != null) {
      item = <Item>[];
      json['item'].forEach((v) {
        item!.add(Item.fromJson(v));
      });
    }
    vendor = json['vendor'] != null ? Vendor.fromJson(json['vendor']) : null;
    payment = json['payment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['point'] = point;
    if (item != null) {
      data['item'] = item!.map((v) => v.toJson()).toList();
    }
    if (vendor != null) {
      data['vendor'] = vendor!.toJson();
    }
    data['payment'] = payment;
    return data;
  }
}

class Item {
  String? id;
  String? name;
  String? price;
  String? imageUrl;
  int? qty;

  Item({this.id, this.name, this.price, this.imageUrl, this.qty});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    imageUrl = json['imageUrl'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['imageUrl'] = imageUrl;
    data['qty'] = qty;
    return data;
  }

  @override
  String toString() {
    return 'Item(id: $id, name: $name, price: $price, imageUrl: $imageUrl, qty: $qty)';
  }
}

class Vendor {
  String? id;
  String? email;
  String? name;

  Vendor({this.id, this.email, this.name});

  Vendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    return data;
  }
}
