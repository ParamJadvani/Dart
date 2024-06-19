import 'dart:ffi';

import 'CategoryData.dart';
import 'dart:io';

class CustomerData {
  static int _counter_Id = 1000;
  final int id;
  late String name;
  late int contact;
  late double billAmount = 0;
  late double discountAmount = 0;
  late String discount;
  List<Map> CustomerBuyList = [];

  CustomerData({
    required this.name,
    required this.contact,
  }) : id = ++_counter_Id;

  String getCustomer() =>
      'Customer ID: ${this.id}, Name: ${this.name}, Contact: ${this.contact}, Cart: ${this.CustomerBuyList}';
  get getList => CustomerBuyList;

  void totalBill() {
    for (int i = 0; i < this.CustomerBuyList.length; i++) {
      this.billAmount += this.CustomerBuyList[i]['totalPrice'];
    }
    this.getDiscountAmount();
  }

  void getDiscountAmount() {
    if (this.billAmount > 500 && this.billAmount < 1500) {
      this.discountAmount = this.billAmount - (this.billAmount * 0.10);
      this.discount = '10%';
    } else if (this.billAmount > 1500 && this.billAmount < 3500) {
      this.discountAmount = this.billAmount - (this.billAmount * 0.20);
      this.discount = '20%';
    } else if (this.billAmount > 3500 && this.billAmount < 6500) {
      this.discountAmount = this.billAmount - (this.billAmount * 0.25);
      this.discount = '25%';
    } else {
      this.discountAmount = this.billAmount - (this.billAmount * 0.30);
      this.discount = '30%';
    }
  }
}

class Category {
  List<Map> BuyList = [];

  void _clearScreen() => print('\x1B[2J\x1B[0;0H');

  void _headerofCategory({bool qty = false}) {
    (qty)
        ? print(
            '\n\tID\tName\t\t=>\tPrice\t\tQuantity\t\tTotal Price\n\t==\t====\t\t\t=====\t\t========\t\t===========\n')
        : print('\n\tID\tName\t\t=>\tPrice\n\t==\t====\t\t\t=====\n');
  }

  void _getCategoryDesign() => print('\t ID\tCategory\n\t ==\t=========\n');

  Category() {
    int type;
    do {
      this._getCategoryDesign();
      print("\t 1)\tGroceries");
      print("\t 2)\tWepons");
      print("\t 3)\tSnacks");
      print("\t 0)\tExit Shop");

      stdout.write('\n\tEnter Given id for Category : ');
      type = getInt();

      switch (type) {
        case 1:
          print(
              '================================================================');
          this._getCategoryDesign();
          print("\t 1)\tVegetables");
          print("\t 2)\tFruits");
          print("\t 3)\tDrinks");
          stdout.write('\n\tEnter Given id for Category : ');
          int Gtype = getInt();

          this._selectProduct(type: Gtype);
          break;
        case 2:
          this._selectProduct(type: 4);
          break;
        case 3:
          this._selectProduct(type: 5);
          break;
        case 0:
          print(
              '\t===================================\n\n\t\tThank you for Coming !!\n\n\t===================================');
          return;
        default:
          print("Invalid Type");
          break;
      }
    } while (type != 0);
  }

  void _selectProduct({required int type}) {
    CategoryData obj = new CategoryData();
    Map Data = obj.Data(index: (--type));
    List<Map> itemData = Data['items'];

    this._printCategoryData(Data: Data, itemData: itemData);

    stdout.write('\n\tEnter Given id for Item : ');
    int id = getInt();

    for (int i = 0; i < itemData.length; i++) {
      if (id == (Data['id'] + (i + 1))) {
        stdout.write('\tEnter Quantity : ');
        int qty = getInt();

        this._headerofCategory(qty: true);
        print(
            '\t${id}\t${itemData[i]['name']}\t\t\$ ${itemData[i]['price']}\t\t$qty\t\t\t\$ ${itemData[i]['price'] * qty}\n\n=============================================================\n\n');

        this._ButItemData(
            id: id,
            name: itemData[i]['name'],
            price: itemData[i]['price'],
            qty: qty,
            totalPrice: (itemData[i]['price'] * qty));

        return;
      }
    }
    print('\n\tInvalid Id');
  }

  void _printCategoryData({required Map Data, required List<Map> itemData}) {
    this._clearScreen();
    print('\tCATEGORY => ${Data['category']}\n');
    this._headerofCategory();

    for (int i = 0; i < itemData.length; i++) {
      if (itemData[i]['name'].length < 8) itemData[i]['name'] += '    ';

      print(
          '\t${Data['id'] + (i + 1)}\t${itemData[i]['name']}\t\t\$ ${itemData[i]['price']}');
    }
    print('=============================================================');
    return;
  }

  void _ButItemData(
      {required int id,
      required String name,
      required double price,
      required int qty,
      required double totalPrice}) {
    Map<String, dynamic> item = {
      'id': id,
      'name': name,
      'price': price,
      'qty': qty,
      'totalPrice': totalPrice,
    };
    BuyList.add(item);
    return;
  }

  void _printList() => print(BuyList);
}

int getInt() {
  return int.parse(stdin.readLineSync() ?? '0');
}

String getString() {
  return stdin.readLineSync() ?? '';
}

class Customer {
  final int size;
  List customers = [];

  Customer({required this.size}) {
    customers = List.generate(size, (index) {
      stdout.write('Enter Customer Name: ');
      String name = getString();

      stdout.write('Enter Customer Contact: ');
      int contact = getInt();

      CustomerData cust = CustomerData(name: name, contact: contact);

      print(
          '\tYout Customer ID : ${cust.id}\n\t================================');

      Category obj = Category();
      obj.BuyList.forEach((item) {
        cust.CustomerBuyList.add(item);
      });
      cust.totalBill();

      return cust;
    });

    this.Searching();
  }

  void Searching() {
    this._clearScreen();
    print(
        '\t Search Customer Data...\n\t================================================================\n');
    stdout.write('Enter Customer Id : ');
    int id = getInt();

    for (int i = 0; i < this.customers.length; i++) {
      if (id == this.customers[i].id) {
        print('\n\tCustomer Id \t\t: ${customers[i].id}');
        print('\tCustomer Name \t\t: ${customers[i].name}');
        print('\tCustomer Contact\t: ${customers[i].contact}');

        print(
            '\n================================================================\n');

        this._CartHeaderDesign();

        for (int j = 0; j < customers[i].CustomerBuyList.length; j++) {
          print(
              '\t${customers[i].CustomerBuyList[j]['id']}\t${customers[i].CustomerBuyList[j]['name']}\t\t\$ ${customers[i].CustomerBuyList[j]['price']}\t\t${customers[i].CustomerBuyList[j]['qty']}\t\t\$ ${customers[i].CustomerBuyList[j]['totalPrice']}\n');
        }

        print(
            '================================================================================================================================\n');
        print('\tTotal Bill\t: \$ ${this.customers[i].billAmount}');
        print('\tYour Discount\t: \$ ${this.customers[i].discount}');
        print('\tDiscount Bill\t: \$ ${this.customers[i].discountAmount}');
        return;
      }
    }
    print('\n\tInvalid Id');
  }

  void _CartHeaderDesign() {
    print('\tProduct Data\n\t====================\n');
    print(
        '\n\tID\tName\t\t=>\tPrice\t\tQuantity\tTotal Price\n\t==\t====\t\t\t=====\t\t========\t===========\n');
  }

  void _clearScreen() => print('\x1B[2J\x1B[0;0H');
}
