// the_habit_detail.dart

import 'package:flutter/material.dart';

class TheHabitDetail extends StatelessWidget {
  final Map<String, String> restaurant;

  TheHabitDetail({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Habit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display the restaurant image at the top
            Image.asset(
              'assets/images/the_habit.jpg', // Add the image path for The Habit
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200.0, // You can adjust the height as needed
            ),
            SizedBox(height: 16.0),

            // Display the restaurant name centered under the image
            Text(
              'The Habit',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),

            // Add a vertical list of food options for The Habit
            Expanded(
              child: ListView(
                children: [
                  FoodCategory(
                    categoryName: 'Popular',
                    foodList: [
                      FoodItem(
                        name: 'Charburger',
                        description: 'Classic Charburger with cheese',
                        image: 'assets/images/charburger.jpg',
                      ),
                      FoodItem(
                        name: 'Santa Barbara Style',
                        description: 'Santa Barbara Style Char with avocado',
                        image: 'assets/images/santa_barbara.jpg',
                      ),
                      // Add more popular food items for The Habit
                    ],
                  ),
                  // Add more categories and food items for The Habit
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to the previous page (Restaurant List)
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

void main() {
  runApp(MaterialApp(
    home: TheHabitDetail(restaurant: {},),
  ));
}
