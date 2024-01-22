import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class TheHabitDetail extends StatefulWidget {
  final Map<String, String> restaurant;

  TheHabitDetail({required this.restaurant});

  @override
  _TheHabitDetailState createState() => _TheHabitDetailState();
}

class _TheHabitDetailState extends State<TheHabitDetail> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AutoScrollController _scrollController = AutoScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }



  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      _scrollToIndex(_tabController.index);
    }
  }

  Future _scrollToIndex(int index) async {
    await _scrollController.scrollToIndex(index, preferPosition: AutoScrollPosition.begin);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Habit'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Charburgers'),
            Tab(text: 'Signature Sandwiches'),
            Tab(text: 'Popular Meals'),
          ],
        ),
      ),
      body: ListView(
        controller: _scrollController,
        children: [
          AutoScrollTag(
            key: ValueKey(0),
            controller: _scrollController,
            index: 0,
            child: FoodCategory(
              categoryName: 'Charburgers',
              isFirstCategory: true,
              foodList: [FoodItem(
                name: '#1 Original Charburger',
                description: 'A seared Impossible patty (a plant-based alternative patty) '
                    'topped with caramelized onions, crisp lettuce, '
                    'tomato, pickles, mayo on a toasted bun. ',
                image: 'assets/images/habit/#1.png',
                price: 11.09,
                extras: [
                  ExtraOption(name: "Cheese", price: 1.00, image: 'assets/images/habit/cheese.png'),
                  ExtraOption(name: "Avocado", price: 2.00, image: 'assets/images/habit/avocado.png'),
                  ExtraOption(name: "Bacon", price: 1.80, image: 'assets/images/habit/bacon.png'),
                ],
              ),
                FoodItem(
                  name: '#2 Original Double Char',
                  description: 'Two freshly chargrilled beef patties, caramelized onions,'
                      ' crisp lettuce, fresh tomato, pickles, and mayo on a toasted bun. '
                      'Includes fries and a regular drink.',
                  image: 'assets/images/habit/#2.png',
                  price: 12.69,
                  extras: [
                    ExtraOption(name: "Cheese", price: 1.00, image: 'assets/images/habit/cheese.png'),
                    ExtraOption(name: "Avocado", price: 2.00, image: 'assets/images/habit/avocado.png'),
                    ExtraOption(name: "Bacon", price: 1.80, image: 'assets/images/habit/bacon.png'),
                  ],
                ),
                FoodItem(
                  name: 'Patty Melt',
                  description: 'Two chargrilled patties served on a toasted '
                      'corn rye, with one slice of yellow American cheese '
                      'and one slice of white American cheese, caramelized'
                      ' onions, and Thousand Island spread.',
                  image: 'assets/images/habit/patty_melt.png',
                  price: 8.79,
                  extras: [
                    ExtraOption(name: "Cheese", price: 1.00, image: 'assets/images/cheese.png'),
                    ExtraOption(name: "Avocado", price: 2.00, image: 'assets/images/avocado.png'),
                    ExtraOption(name: "Bacon", price: 1.80, image: 'assets/images/bacon.png'),
                  ],
                ),
                FoodItem(
                  name: 'Santa Barbara Charburger',
                  description: 'Two freshly chargrilled beef patties, avocado, '
                      'caramelized onions, American cheese, crisp lettuce, '
                      'tomato, pickles and mayo on grilled sourdough.',
                  image: 'assets/images/habit/santa_barbara_char.png',
                  price: 8.49,
                  extras: [
                    ExtraOption(name: "Cheese", price: 1.00, image: 'assets/images/cheese.png'),
                    ExtraOption(name: "Avocado", price: 2.00, image: 'assets/images/avocado.png'),
                    ExtraOption(name: "Bacon", price: 1.80, image: 'assets/images/bacon.png'),
                  ],
                ),
                FoodItem(
                  name: 'Charburger',
                  description: 'Our award-winning burger topped with '
                      'caramelized onions, crisp lettuce, fresh tomato, '
                      'pickles, and mayo on a toasted bun.',
                  image: 'assets/images/habit/char.png',
                  price: 5.39,
                  extras: [
                    ExtraOption(name: "Cheese", price: 1.00, image: 'assets/images/cheese.png'),
                    ExtraOption(name: "Avocado", price: 2.00, image: 'assets/images/avocado.png'),
                    ExtraOption(name: "Bacon", price: 1.80, image: 'assets/images/bacon.png'),
                  ],
                ),
                FoodItem(
                  name: 'Double Char',
                  description: 'Two freshly chargrilled beef patties, '
                      'caramelized onions, crisp lettuce, fresh tomato, '
                      'pickles, and mayo on a toasted bun.',
                  image: 'assets/images/habit/double_char.png',
                  price: 6.99,
                  extras: [
                    ExtraOption(name: "Cheese", price: 1.00, image: 'assets/images/cheese.png'),
                    ExtraOption(name: "Avocado", price: 2.00, image: 'assets/images/avocado.png'),
                    ExtraOption(name: "Bacon", price: 1.80, image: 'assets/images/bacon.png'),
                  ],
                ),
                FoodItem(
                  name: 'BBQ Bacon Char',
                  description: 'Freshly chargrilled beef patty, '
                      'hickory-smoked bacon, caramelized onions, '
                      'crisp lettuce, fresh tomato, and mayo on a toasted bun.',
                  image: 'assets/images/habit/bbq_char.png',
                  price: 7.29,
                  extras: [
                    ExtraOption(name: "Cheese", price: 1.00, image: 'assets/images/cheese.png'),
                    ExtraOption(name: "Avocado", price: 2.00, image: 'assets/images/avocado.png'),
                    ExtraOption(name: "Bacon", price: 1.80, image: 'assets/images/bacon.png'),
                  ],
                ),
                FoodItem(
                  name: 'Teriyaki Char',
                  description: 'Freshly chargrilled beef patty, grilled pineapple, '
                      'teriyaki sauce, caramelized onions, crisp lettuce, '
                      'fresh tomato, pickle, and mayo on a toasted bun.',
                  image: 'assets/images/habit/teriyaki_char.png',
                  price: 6.29,
                  extras: [
                    ExtraOption(name: "Cheese", price: 1.00, image: 'assets/images/cheese.png'),
                    ExtraOption(name: "Avocado", price: 2.00, image: 'assets/images/avocado.png'),
                    ExtraOption(name: "Bacon", price: 1.80, image: 'assets/images/bacon.png'),
                  ],
                ),
                FoodItem(
                  name: 'Portabella Char',
                  description: 'Freshly chargrilled beef patty, Portabella mushrooms, caramelized onions, '
                      'melted White American cheese, crisp lettuce, '
                      'fresh tomato, pickle, and roasted garlic aioli on a toasted bun.',
                  image: 'assets/images/habit/portabella_char.png',
                  price: 6.99,
                  extras: [
                    ExtraOption(name: "Cheese", price: 1.00, image: 'assets/images/cheese.png'),
                    ExtraOption(name: "Avocado", price: 2.00, image: 'assets/images/avocado.png'),
                    ExtraOption(name: "Bacon", price: 1.80, image: 'assets/images/bacon.png'),
                  ],
                ),
                FoodItem(
                  name: 'Original Impossible (TM) Burger',
                  description: 'A seared Impossible patty (a plant-based alternative patty) '
                      'topped with caramelized onions, crisp lettuce, '
                      'tomato, pickles, mayo on a toasted bun. '
                      'Impossible is a trademark of Impossible Foods, Inc. Used under license.',
                  image: 'assets/images/habit/impossible_char.png',
                  price: 7.99,
                  extras: [
                    ExtraOption(name: "Cheese", price: 1.00, image: 'assets/images/cheese.png'),
                    ExtraOption(name: "Avocado", price: 2.00, image: 'assets/images/avocado.png'),
                    ExtraOption(name: "Bacon", price: 1.80, image: 'assets/images/bacon.png'),
                  ],
                ),
              ],
            ),
          ),
          AutoScrollTag(
            key: ValueKey(1),
            controller: _scrollController,
            index: 1,
            child: FoodCategory(
                categoryName: 'Signature Sandwiches',
                foodList: [FoodItem(
                  name: 'Spicy Crispy Chicken Sandwich',
                  description: 'Crispy Chicken breast with white '
                      'American cheese, house-made coleslaw, pickles, '
                      'and spicy red pepper sauce on a toasted flaxseed brioche bun ',
                  image: 'assets/images/habit/crispy_chicken.png',
                  price: 9.99,
                  extras: [
                  ],
                ),
                  FoodItem(
                    name: 'Ahi Tuna Filet',
                    description: 'Line-caught, sushi-grade tuna steak with a teriyaki glaze, '
                        'crisp shredded lettuce, fresh tomatoes, and tartar sauce',
                    image: 'assets/images/habit/ahi_tuna.png',
                    price: 9.99,
                    extras: [
                      ExtraOption(name: "Avocado", price: 2.00, image: 'assets/images/avocado.png'),
                    ],
                  ),
                  FoodItem(
                    name: 'Chicken Club',
                    description: 'Due to an interruption in supply chain, green leaf lettuce may be '
                        'substituted with iceberg lettuce. Hand-filleted marinated chicken breast, '
                        'green leaf lettuce, tomatoes, hickory-smoked bacon, fresh avocado, and mayo, served on toasted sourdough',
                    price: 9.99,
                    image: 'assets/images/habit/chicken_club.png',
                    extras: [
                    ],
                  ),
                  FoodItem(
                    name: 'Grilled Chicken',
                    description: 'Hand-filleted marinated chicken breast, melted cheese, crisp shredded lettuce,'
                        ' fresh tomatoes, mayo, and your choice of BBQ or teriyaki sauce.',
                    image: 'assets/images/habit/grilled_chicken.png',
                    price: 7.99,
                    extras: [
                      ExtraOption(name: "Avocado", price: 2.00, image: 'assets/images/avocado.png'),
                    ],
                  ),
                  FoodItem(
                    name: 'Veggie Burger',
                    description: 'Vegan veggie patty on a toasted wheat bun, green leaf lettuce,'
                        ' fresh tomatoes, and cucumbers, with sweet mustard dressing, and onions.'
                        ' (Grilled onions are not vegetarian)',
                    image: 'assets/images/habit/veggie_burger.png',
                    price: 7.29,
                    extras: [
                      ExtraOption(name: "Cheese", price: 1.00, image: 'assets/images/cheese.png'),
                      ExtraOption(name: "Avocado", price: 2.00, image: 'assets/images/avocado.png'),
                      ExtraOption(name: "Bacon", price: 1.80, image: 'assets/images/bacon.png'),
                    ],
                  ),
                  FoodItem(
                    name: 'Grilled Cheese',
                    description: 'Three slices of American cheese between two buttered slices of grilled sourdough bread',
                    image: 'assets/images/habit/grilled_cheese.png',
                    price: 5.69,
                    extras: [
                      ExtraOption(name: "Avocado", price: 2.00, image: 'assets/images/avocado.png'),
                      ExtraOption(name: "Bacon", price: 1.80, image: 'assets/images/bacon.png'),
                    ],
                  ),
                ]
            ),
          ),
          AutoScrollTag(
            key: ValueKey(2),
            controller: _scrollController,
            index: 2,
            child: FoodCategory(
              categoryName: 'Popular Meals',
              foodList: [],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Back to Restaurant List'),
        ),
      ),
    );
  }
}

class FoodCategory extends StatelessWidget {
  final String categoryName;
  final List<FoodItem> foodList;
  final bool isFirstCategory;

  FoodCategory({required this.categoryName, required this.foodList, this.isFirstCategory = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // If this is the first category, display the image and restaurant name
        if (isFirstCategory) ...[
          Image.asset(
            'assets/images/the_habit.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200.0,
          ),
          SizedBox(height: 16.0),
          Center(
            child: Text(
              'The Habit',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16.0),
        ],

        // Category title
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            categoryName,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),

        // Food items in this category
        Column(
          children: foodList.map((foodItem) {
            return FoodOption(foodItem: foodItem);
          }).toList(),
        ),

        SizedBox(height: 16.0),
      ],
    );
  }
}

class FoodItem {
  final String name;
  final String description;
  final String image;
  final double price;
  final List<ExtraOption> extras;

  FoodItem({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.extras,
  });
}

class ExtraOption {
  final String name;
  final double price;
  final String image;

  ExtraOption({required this.name, required this.price, required this.image});
}



class FoodOption extends StatelessWidget {
  final FoodItem foodItem;

  FoodOption({required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showCustomizationOptions(context, foodItem),
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            // Display the food image on the left
            Expanded(
              flex: 2,
              child: Image.asset(
                foodItem.image,
                fit: BoxFit.cover,
                height: 100.0, // You can adjust the height of the food image
              ),
            ),
            // Display the food name and description on the right
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodItem.name,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      foodItem.description,
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "\$${foodItem.price.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCustomizationOptions(BuildContext context, FoodItem item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogWithExtras(foodItem: item);
      },
    );
  }
}


class DialogWithExtras extends StatefulWidget {
  final FoodItem foodItem;

  DialogWithExtras({Key? key, required this.foodItem}) : super(key: key);

  @override
  _DialogWithExtrasState createState() => _DialogWithExtrasState();
}

class _DialogWithExtrasState extends State<DialogWithExtras> {
  late double totalPrice;
  Map<String, bool> extrasSelected = {};

  @override
  void initState() {
    super.initState();
    totalPrice = widget.foodItem.price;
    widget.foodItem.extras.forEach((extra) {
      extrasSelected[extra.name] = false;
    });
  }

  void _updateTotalPrice(String extraName, bool isSelected) {
    setState(() {
      extrasSelected[extraName] = isSelected;
      totalPrice = widget.foodItem.price;
      extrasSelected.forEach((name, isSelected) {
        if (isSelected) {
          totalPrice += widget.foodItem.extras
              .firstWhere((extra) => extra.name == name)
              .price;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Customize Your Order"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: widget.foodItem.extras.map((extra) {
          return CheckboxListTile(
            title: Text("${extra.name} (\$${extra.price.toStringAsFixed(2)})"),
            value: extrasSelected[extra.name],
            onChanged: (bool? value) {
              _updateTotalPrice(extra.name, value ?? false);
            },
          );
        }).toList(),
      ),
      actions: <Widget>[
        Text("Total: \$${totalPrice.toStringAsFixed(2)}"),
        ElevatedButton(
          onPressed: () {
            // Handle add to cart logic
            Navigator.of(context).pop();
          },
          child: Text('Add to Cart'),
        ),
        TextButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

