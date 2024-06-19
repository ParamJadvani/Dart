class CategoryData {
  List<Map<String, dynamic>> items = [
    {
      'id': 000,
      'category': 'Vegetables',
      'items': [
        {'name': 'Potatoes', 'price': 0.36},
        {'name': 'Onions', 'price': 0.30},
        {'name': 'Tomatoes', 'price': 0.48},
        {'name': 'Carrots', 'price': 0.42},
        {'name': 'Lettuce', 'price': 0.54},
        {'name': 'Cucumbers', 'price': 0.36},
      ]
    },
    {
      'id': 100,
      'category': 'Fruits',
      'items': [
        {'name': 'Apples', 'price': 0.96},
        {'name': 'Bananas', 'price': 0.60},
        {'name': 'Oranges', 'price': 0.72},
        {'name': 'Grapes', 'price': 1.44},
        {'name': 'Strawberries', 'price': 180.0},
        {'name': 'Pineapple', 'price': 1.20},
      ]
    },
    {
      'id': 200,
      'category': 'Drinks',
      'items': [
        {'name': 'Milk', 'price': 0.48},
        {'name': 'Tea ', 'price': 1.44},
        {'name': 'Coffee', 'price': 2.40},
        {'name': 'Orange Juice', 'price': 1.80},
        {'name': 'Coconut Water', 'price': 0.96},
      ]
    },
    {
      'id': 300,
      'category': 'Weapons',
      'items': [
        {'name': 'AK-47', 'price': 700.0},
        {'name': 'Desert Eagle', 'price': 1200.0},
        {'name': 'FN SCAR', 'price': 1500.0},
        {'name': 'Barrett M82', 'price': 2000.0},
        {'name': 'M4 Carbine', 'price': 1000.0},
        {'name': 'HK416', 'price': 1300.0},
        {'name': 'Steyr AUG', 'price': 1400.0},
        {'name': 'RPG-7', 'price': 2500.0},
      ]
    },
    {
      'id': 400,
      'category': 'Snacks',
      'items': [
        {'name': 'Chips', 'price': 0.30},
        {'name': 'Biscuits', 'price': 0.36},
        {'name': 'Namkeen', 'price': 0.60},
        {'name': 'Chocolates', 'price': 1.20},
        {'name': 'Popcorn', 'price': 0.48},
        {'name': 'Nuts', 'price': 2.40},
        {'name': 'Samosa', 'price': 0.18},
        {'name': 'Kachori', 'price': 0.24},
      ]
    },
  ];

  Map Data({required int index}) {
    return items[index];
  }
}
