// restaurant_detail.dart

import 'package:flutter/material.dart';

class CoffeeBeanDetail extends StatelessWidget {
  final Map<String, String> restaurant;

  CoffeeBeanDetail({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant['Coffee Bean & Tea Leaf'] ?? 'Restaurant Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display the restaurant image at the top
            Image.asset(
              restaurant['image'] ?? 'assets/images/coffee_bean.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200.0, // You can adjust the height as needed
            ),
            SizedBox(height: 16.0),

            // Display the restaurant name centered under the image
            Text(
              restaurant['The Coffee Bean & Tea Leaf'] ?? 'The Coffee Bean & Tea Leaf',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),

            // Add a vertical list of food options with categories
            Expanded(
              child: ListView(
                children: [
                  FoodCategory(
                    categoryName: 'Featured',
                    foodList: [
                      FoodItem(
                        name: 'Vanilla Spiced Oat Latte',
                        description: 'A delicious blend of vanilla and spice. '
                            'We are adding a hint of spice and our Oatly Oatmilk '
                            'for the perfect Winter beverage. Plant-Based. Vegan.',
                        image: 'assets/images/Vanilla_Spiced_Oat_Latte.jpg',
                      ),
                      FoodItem(
                        name: 'Iced Vanilla Spiced Oat Latte',
                        description: 'A delicious blend of vanilla and spice. '
                            'We are adding a hint of spice and our Oatly Oatmilk '
                            'for the perfect Winter beverage. All served over ice '
                            'for a refreshing treat. Plant-Based. Vegan.',
                        image: 'assets/images/Iced_Vanilla_Spiced_Oat_Latte.jpg',
                      ),
                      FoodItem(
                        name: 'Vanilla Spiced Chai Latte',
                        description: 'A twist on our already amazing chai latte'
                            'with an additional boost of spice.',
                        image: 'assets/images/Vanilla_Spiced_Chai_Latte.jpg',
                      ),
                      FoodItem(
                        name: 'Vanilla Spiced Chai Cream Latte',
                        description: 'A fun twist on our already amazing chai latte'
                            'with an additional boost of spice and topped with our '
                            'delicious cream cap.',
                        image: 'assets/images/Vanilla_Spiced_Chai_Cream_Latte.jpg',
                      ),
                      FoodItem(
                        name: 'Iced Vanilla Spiced Chai Cream Latte',
                        description: 'A twist on our already amazing chai latte'
                            'with an additional boost of spice. All served over ice '
                            'for a refreshing treat.',
                        image: 'assets/images/Iced_Vanilla_Spiced_Chai_Cream_Latte.jpg',
                      ),
                      FoodItem(
                        name: 'Vanilla Spiced Oat Cold Brew',
                        description: 'A delicious blend of vanilla and spice. '
                            'We are adding a hint of spice and our Oatly Oatmilk '
                            'for the perfect Winter beverage. All served over ice '
                            'for a refreshing treat. Plant-Based. Vegan.',
                        image: 'assets/images/Vanilla_Spiced_Oat_Cold_Brew.jpg',
                      ),
                      FoodItem(
                        name: 'Dark Chocolate Latte',
                        description: 'Fresh pulled shots of espresso with our rich '
                            'dark chocolate powder, steamed non-fat milk and topped '
                            'with thick foam.',
                        image: 'assets/images/Dark_Chocolate_Latte.jpg',
                      ),
                      FoodItem(
                        name: 'White Chocolate Latte',
                        description: 'Fresh pulled shots of espresso with our white '
                            'chocolate powder, steamed non-fat milk and topped with '
                            'thick foam.',
                        image: 'assets/images/White_Chocolate_Latte.jpg',
                      ),
                      FoodItem(
                        name: 'Strawberry Cake Pop',
                        description: 'A delicious strawberry flavored cake pop dipped '
                            'in pink chocolate coating and rainbow sprinkles. 150 calories.',
                        image: 'assets/images/Strawberry_Cake_Pop.jpg',
                      ),
                      FoodItem(
                        name: 'Chocolate Cake Pop',
                        description: 'A delicious chocolate cake pop dipped '
                            'in milk chocolate coating with rainbow sprinkles. 150 calories.',
                        image: 'assets/images/Chocolate_Cake_Pop.jpg',
                      ),
                    ],
                  ),
                  FoodCategory(
                    categoryName: 'Charburgers',
                    foodList: [
                      FoodItem(
                        name: 'Food Item 3',
                        description: 'Description for Food Item 3',
                        image: 'assets/images/food_item_3.jpg',
                      ),
                      FoodItem(
                        name: 'Food Item 4',
                        description: 'Description for Food Item 4',
                        image: 'assets/images/food_item_4.jpg',
                      ),
                      // Add more charburgers
                    ],
                  ),
                  FoodCategory(
                    categoryName: 'Signature Sandwiches',
                    foodList: [
                      FoodItem(
                        name: 'Food Item 5',
                        description: 'Description for Food Item 5',
                        image: 'assets/images/food_item_5.jpg',
                      ),
                      FoodItem(
                        name: 'Food Item 6',
                        description: 'Description for Food Item 6',
                        image: 'assets/images/food_item_6.jpg',
                      ),
                      // Add more signature sandwiches
                    ],
                  ),
                  // Add more categories and food items as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodCategory extends StatelessWidget {
  final String categoryName;
  final List<FoodItem> foodList;

  FoodCategory({required this.categoryName, required this.foodList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            categoryName,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
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

  FoodItem({required this.name, required this.description, required this.image});
}

class FoodOption extends StatelessWidget {
  final FoodItem foodItem;

  FoodOption({required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Card(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
