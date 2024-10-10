// restaurant_list.dart

import 'package:flutter/material.dart';

import 'restaurant_detail.dart';

class RestaurantList extends StatelessWidget {
  final List<Map<String, String>> restaurants = [
    {'name': 'The Habit', 'image': 'assets/images/the_habit.jpg'},
    {'name': 'The Coffee Bean & Tea Leaf', 'image': 'assets/images/coffee_bean.jpg'},
    {'name': 'Subway', 'image': 'assets/images/subway.jpg'},
    {'name': 'Panda Express', 'image': 'assets/images/panda_express.jpg'},
    {'name': 'Chronic Tacos', 'image': 'assets/images/chronic_tacos.jpg'},
    {'name': 'Hibachi-San', 'image': 'assets/images/hibachi_san.jpg'},
    {'name': 'The Halal Shack', 'image': 'assets/images/halal_shack.jpg'},
    // Add more restaurants with their names and image paths
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant List'),
      ),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = restaurants[index];
          return InkWell(
            onTap: () {
              // Navigate to the dedicated restaurant page with restaurant details
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RestaurantDetail(restaurant: restaurant),
                ),
              );
            },
            child: Column(
              children: [
                Image.asset(
                  restaurant['image']!,
                  fit: BoxFit.cover,
                  width: double.infinity, // Cover the screen horizontally
                ),
                SizedBox(height: 16.0), // Add spacing between the image and restaurant name
                Text(
                  restaurant['name']!,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0), // Add additional spacing between restaurants
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to the address selection page
            Navigator.pop(context);
          },
          child: Text('Change Address'),
        ),
      ),
    );
  }
}
