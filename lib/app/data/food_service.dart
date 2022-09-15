import 'package:pkkclient/app/domain/food.dart';

class FoodService {
  static List<FoodModel> foods = [
    FoodModel(
      id: 1,
      name: 'Cimol Mercon',
      description:
          'Burger is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun.',
      image: 'assets/images/cimol.png',
      price: 'Rp. 5.000, 00',
      rating: '4.8',
      type: 'Makanan',
    ),
    FoodModel(
      id: 2,
      name: 'Es Lumut',
      description:
          'Pizza is a savory dish of Italian origin, consisting of a usually round, flattened base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients.',
      image: 'assets/images/eslumut.png',
      price: 'Rp. 3.000',
      rating: '4.5',
      type: 'Minuman',
    ),
  ];
}
