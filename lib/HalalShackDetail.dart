import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'cart_page.dart';
import 'food_item_models.dart';
import 'cart_model.dart';

class HalalShackDetail extends StatefulWidget {
  final Map<String, String> restaurant;

  HalalShackDetail({required this.restaurant});

  @override
  _HalalShackDetailState createState() => _HalalShackDetailState();
}

class _HalalShackDetailState extends State<HalalShackDetail> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AutoScrollController _scrollController = AutoScrollController();
  List<GlobalKey> _keys = List.generate(5, (index) => GlobalKey());
  Timer? _debounce;
  bool _tabChangeByScroll = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(_handleTabSelection);
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      int? closestIndex;
      double closestDistance = double.infinity;
      for (int i = 0; i < _keys.length; i++) {
        final keyContext = _keys[i].currentContext;
        if (keyContext != null) {
          final RenderBox box = keyContext.findRenderObject() as RenderBox;
          final Offset position = box.localToGlobal(Offset.zero);
          final double itemTop = position.dy;
          final double viewportTop = _scrollController.position.pixels;
          final double viewportBottom = viewportTop + _scrollController.position.viewportDimension;

          if (itemTop <= viewportBottom && (itemTop >= viewportTop || position.dy <= viewportBottom)) {
            final double distance = (viewportTop - itemTop).abs();
            if (distance < closestDistance) {
              closestDistance = distance;
              closestIndex = i;
            }
          }
        }
      }

      if (!_tabChangeByScroll && closestIndex != null && closestIndex != _tabController.index) {
        setState(() {
          _tabChangeByScroll = true;
          _tabController.animateTo(closestIndex!);
        });
      }
    });
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging && !_tabChangeByScroll) {
      _scrollToIndex(_tabController.index);
    }
    _tabChangeByScroll = false;
  }

  Future _scrollToIndex(int index) async {
    await _scrollController.scrollToIndex(index, preferPosition: AutoScrollPosition.begin);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _tabController.dispose();
    _scrollController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halal Shack'),
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: TabBar(
            isScrollable: true,
            controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(text: 'Rice Bowl'),
              Tab(text: 'Salad Bowl'),
              Tab(text: 'Naanarito'),
              Tab(text: 'Fries Bowl'),
              Tab(text: 'Drinks'),
            ],
          ).preferredSize,
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              isScrollable: true,
              controller: _tabController,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(text: 'Rice Bowl'),
                Tab(text: 'Salad Bowl'),
                Tab(text: 'Naanarito'),
                Tab(text: 'Fries Bowl'),
                Tab(text: 'Drinks'),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        controller: _scrollController,
        children: [
          AutoScrollTag(
            key: _keys[0],
            controller: _scrollController,
            index: 0,
            child: FoodCategory(
              key: _keys[0],
              categoryName: 'Rice Bowl',
              isFirstCategory: true,
              foodList: [
                FoodItem(
                  name: 'Rice Bowl',
                  description: 'Base of rice with any choice of filling',
                  image: 'assets/images/halal/rice.jpg',
                  price: 0.00,
                  requiredOptions: [
                    RequiredOption(
                      name: "Pick A Filling",
                      options: ["Chicken", "Beef", "Mix (Chicken + Beef)",
                        "Hot BBQ Chicken", "Impossible Meat", "Falafel", "Chickpea Korma"],
                      optionPrices: {
                        "Chicken": 12.49,
                        "Beef": 12.49,
                        "Mix (Chicken + Beef)": 12.49,
                        "Hot BBQ Chicken": 13.49,
                        "Impossible Meat": 13.49,
                        "Falafel": 12.49,
                        "Chickpea Korma": 13.49,
                      },
                    ),
                  ],
                  extras: [
                    ExtraOption(name: "Crisp Lettuce", price: 0.00, ),
                    ExtraOption(name: "Cheese", price: 0.00,),
                    ExtraOption(name: "Corn", price: 0.00,),
                    ExtraOption(name: "Zesty Onions", price: 0.00, ),
                    ExtraOption(name: "Black Beans", price: 0.00,),
                    ExtraOption(name: "Fresh Tomatoes", price: 0.00,),
                    ExtraOption(name: "Jalapenos", price: 0.00, ),
                    ExtraOption(name: "Parsley", price: 0.00,),
                    ExtraOption(name: "Mint Cucumber", price: 0.00,),
                    ExtraOption(name: "Hummus", price: 0.00, ),
                    ExtraOption(name: "Pita Chips", price: 0.00,),
                    ExtraOption(name: "Smashed Avocado", price: 1.50,),
                    ExtraOption(name: "Kale and Quinoa", price: 0.00, ),
                    ExtraOption(name: "Garbanzo Beans Salad", price: 0.00,),
                    ExtraOption(name: "Baby Spinach", price: 0.00,),
                    ExtraOption(name: "Sweet Potato Noodles", price: 2.00, ),
                    ExtraOption(name: "Hot White Sauce", price: 0.00,),
                    ExtraOption(name: "White Sauce", price: 0.00,),
                    ExtraOption(name: "Hot Sauce", price: 0.00,),
                    ExtraOption(name: "Tahini Sauce", price: 0.00,),
                    ExtraOption(name: "Green Chutney Sauce", price: 0.00,),
                    ExtraOption(name: "BBQ Sauce", price: 0.00,),
                  ],
                ),
              ],
            ),
          ),
          AutoScrollTag(
            key: _keys[1],
            controller: _scrollController,
            index: 1,
            child: FoodCategory(
              key: _keys[1],
              categoryName: 'Salad Bowl',
              isFirstCategory: false,
              foodList: [
                FoodItem(
                  name: 'Salad Bowl',
                  description: 'Base of lettuce with any choice of filling',
                  image: 'assets/images/halal/salad.jpg',
                  price: 0.00,
                  requiredOptions: [
                    RequiredOption(
                      name: "Pick A Filling",
                      options: ["Chicken", "Beef", "Mix (Chicken + Beef)",
                        "Hot BBQ Chicken", "Impossible Meat", "Falafel", "Chickpea Korma"],
                      optionPrices: {
                        "Chicken": 12.49,
                        "Beef": 12.49,
                        "Mix (Chicken + Beef)": 12.49,
                        "Hot BBQ Chicken": 13.49,
                        "Impossible Meat": 13.49,
                        "Falafel": 12.49,
                        "Chickpea Korma": 13.49,
                      },
                    ),
                  ],
                  extras: [
                    ExtraOption(name: "Crisp Lettuce", price: 0.00, ),
                    ExtraOption(name: "Cheese", price: 0.00,),
                    ExtraOption(name: "Corn", price: 0.00,),
                    ExtraOption(name: "Zesty Onions", price: 0.00, ),
                    ExtraOption(name: "Black Beans", price: 0.00,),
                    ExtraOption(name: "Fresh Tomatoes", price: 0.00,),
                    ExtraOption(name: "Jalapenos", price: 0.00, ),
                    ExtraOption(name: "Parsley", price: 0.00,),
                    ExtraOption(name: "Mint Cucumber", price: 0.00,),
                    ExtraOption(name: "Hummus", price: 0.00, ),
                    ExtraOption(name: "Pita Chips", price: 0.00,),
                    ExtraOption(name: "Smashed Avocado", price: 1.50,),
                    ExtraOption(name: "Kale and Quinoa", price: 0.00, ),
                    ExtraOption(name: "Garbanzo Beans Salad", price: 0.00,),
                    ExtraOption(name: "Baby Spinach", price: 0.00,),
                    ExtraOption(name: "Sweet Potato Noodles", price: 2.00, ),
                    ExtraOption(name: "Hot White Sauce", price: 0.00,),
                    ExtraOption(name: "White Sauce", price: 0.00,),
                    ExtraOption(name: "Hot Sauce", price: 0.00,),
                    ExtraOption(name: "Tahini Sauce", price: 0.00,),
                    ExtraOption(name: "Green Chutney Sauce", price: 0.00,),
                    ExtraOption(name: "BBQ Sauce", price: 0.00,),
                  ],
                ),
              ],
            ),
          ),
          AutoScrollTag(
            key: _keys[2],
            controller: _scrollController,
            index: 2,
            child: FoodCategory(
              key: _keys[2],
              categoryName: 'Naanarito',
              isFirstCategory: false,
              foodList: [
                FoodItem(
                  name: 'Naanarito',
                  description: 'Soft tortilla wrap with any choice of filling',
                  image: 'assets/images/halal/naan.jpg',
                  price: 0.00,
                  requiredOptions: [
                    RequiredOption(
                      name: "Pick A Filling",
                      options: ["Chicken", "Beef", "Mix (Chicken + Beef)",
                        "Hot BBQ Chicken", "Impossible Meat", "Falafel", "Chickpea Korma"],
                      optionPrices: {
                        "Chicken": 12.49,
                        "Beef": 12.49,
                        "Mix (Chicken + Beef)": 12.49,
                        "Hot BBQ Chicken": 13.49,
                        "Impossible Meat": 13.49,
                        "Falafel": 12.49,
                        "Chickpea Korma": 13.49,
                      },
                    ),
                  ],
                  extras: [
                    ExtraOption(name: "Crisp Lettuce", price: 0.00, ),
                    ExtraOption(name: "Cheese", price: 0.00,),
                    ExtraOption(name: "Corn", price: 0.00,),
                    ExtraOption(name: "Zesty Onions", price: 0.00, ),
                    ExtraOption(name: "Black Beans", price: 0.00,),
                    ExtraOption(name: "Fresh Tomatoes", price: 0.00,),
                    ExtraOption(name: "Jalapenos", price: 0.00, ),
                    ExtraOption(name: "Parsley", price: 0.00,),
                    ExtraOption(name: "Mint Cucumber", price: 0.00,),
                    ExtraOption(name: "Hummus", price: 0.00, ),
                    ExtraOption(name: "Pita Chips", price: 0.00,),
                    ExtraOption(name: "Smashed Avocado", price: 1.50,),
                    ExtraOption(name: "Kale and Quinoa", price: 0.00, ),
                    ExtraOption(name: "Garbanzo Beans Salad", price: 0.00,),
                    ExtraOption(name: "Baby Spinach", price: 0.00,),
                    ExtraOption(name: "Sweet Potato Noodles", price: 2.00, ),
                    ExtraOption(name: "Hot White Sauce", price: 0.00,),
                    ExtraOption(name: "White Sauce", price: 0.00,),
                    ExtraOption(name: "Hot Sauce", price: 0.00,),
                    ExtraOption(name: "Tahini Sauce", price: 0.00,),
                    ExtraOption(name: "Green Chutney Sauce", price: 0.00,),
                    ExtraOption(name: "BBQ Sauce", price: 0.00,),
                  ],
                ),
              ],
            ),
          ),
          AutoScrollTag(
            key: _keys[3],
            controller: _scrollController,
            index: 3,
            child: FoodCategory(
              key: _keys[3],
              categoryName: 'Fries Bowl',
              isFirstCategory: false,
              foodList: [
                FoodItem(
                  name: 'Fries Bowl',
                  description: 'Base of crispy, hot fries with any choice of filling',
                  image: 'assets/images/halal/fries.jpg',
                  price: 0.00,
                  requiredOptions: [
                    RequiredOption(
                      name: "Pick A Filling",
                      options: ["Chicken", "Beef", "Mix (Chicken + Beef)",
                        "Hot BBQ Chicken", "Impossible Meat", "Falafel", "Chickpea Korma"],
                      optionPrices: {
                        "Chicken": 12.49,
                        "Beef": 12.49,
                        "Mix (Chicken + Beef)": 12.49,
                        "Hot BBQ Chicken": 13.49,
                        "Impossible Meat": 13.49,
                        "Falafel": 12.49,
                        "Chickpea Korma": 13.49,
                      },
                    ),
                  ],
                  extras: [
                    ExtraOption(name: "Crisp Lettuce", price: 0.00, ),
                    ExtraOption(name: "Cheese", price: 0.00,),
                    ExtraOption(name: "Corn", price: 0.00,),
                    ExtraOption(name: "Zesty Onions", price: 0.00, ),
                    ExtraOption(name: "Black Beans", price: 0.00,),
                    ExtraOption(name: "Fresh Tomatoes", price: 0.00,),
                    ExtraOption(name: "Jalapenos", price: 0.00, ),
                    ExtraOption(name: "Parsley", price: 0.00,),
                    ExtraOption(name: "Mint Cucumber", price: 0.00,),
                    ExtraOption(name: "Hummus", price: 0.00, ),
                    ExtraOption(name: "Pita Chips", price: 0.00,),
                    ExtraOption(name: "Smashed Avocado", price: 1.50,),
                    ExtraOption(name: "Kale and Quinoa", price: 0.00, ),
                    ExtraOption(name: "Garbanzo Beans Salad", price: 0.00,),
                    ExtraOption(name: "Baby Spinach", price: 0.00,),
                    ExtraOption(name: "Sweet Potato Noodles", price: 2.00, ),
                    ExtraOption(name: "Hot White Sauce", price: 0.00,),
                    ExtraOption(name: "White Sauce", price: 0.00,),
                    ExtraOption(name: "Hot Sauce", price: 0.00,),
                    ExtraOption(name: "Tahini Sauce", price: 0.00,),
                    ExtraOption(name: "Green Chutney Sauce", price: 0.00,),
                    ExtraOption(name: "BBQ Sauce", price: 0.00,),
                  ],
                ),
              ],
            ),
          ),
          AutoScrollTag(
            key: _keys[4],
            controller: _scrollController,
            index: 4,
            child: FoodCategory(
              key: _keys[4],
              categoryName: 'Drinks',
              isFirstCategory: false,
              foodList: [
                FoodItem(
                  name: 'Drinks',
                  description: 'Want a Drink?',
                  image: 'assets/images/halal/soda.jpg',
                  price: 0.00,
                  requiredOptions: [
                    RequiredOption(
                      name: "Drinks",
                      options: ["Regular Drink", "Large Drink"],
                      optionPrices: {
                        "Regular Drink": 1.50,
                        "Large Drink": 2.00,
                      },
                    ),
                  ],
                  extras: [],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
              },
              child: Text('Go to Cart'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back to Restaurant List'),
            ),
          ),
        ],
      ),
    );
  }
}


class FoodCategory extends StatelessWidget {
  final GlobalKey key;
  final String categoryName;
  final List<FoodItem> foodList;
  final bool isFirstCategory;

  FoodCategory({required this.key, required this.categoryName, required this.foodList, this.isFirstCategory = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // If this is the first category, display the image and restaurant name
        if (isFirstCategory) ...[
          Image.asset(
            'assets/images/halal_shack.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200.0,
          ),
          SizedBox(height: 16.0),
          Center(
            child: Text(
              'Halal Shack',
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
            if (foodItem.image != null && foodItem.image!.isNotEmpty)
              Expanded(
                flex: 2,
                child: Image.asset(
                  foodItem.image!,
                  fit: BoxFit.contain,
                  height: 100.0,
                ),
              )
            else
              Container(
                width: 200.0,
                height: 100.0,
              ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodItem.name,
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      foodItem.description,
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "\$${foodItem.price.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
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
        return DialogWithExtras(
          foodItem: item,
          onAddToCart: (FoodItem addedItem, Map<String, String?> selectedOptions, Map<String, bool> extras) {
            double totalPrice = addedItem.price;

            // Calculate additional costs for required options
            addedItem.requiredOptions.forEach((option) {
              String? selectedOption = selectedOptions[option.name];
              double? additionalCost = option.optionPrices[selectedOption];
              if (additionalCost != null) {
                totalPrice += additionalCost;
              }
            });

            // Add the price of selected extras
            addedItem.extras.forEach((extra) {
              if (extras[extra.name] == true) {
                totalPrice += extra.price ?? 0.0;
              }
            });

            // Update the price of the item
            addedItem.price = totalPrice;

            Provider.of<CartModel>(context, listen: false).addItem(addedItem);
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}


class DialogWithExtras extends StatefulWidget {
  final FoodItem foodItem;
  final Function(FoodItem, Map<String, String?>, Map<String, bool>) onAddToCart;

  DialogWithExtras({Key? key, required this.foodItem, required this.onAddToCart}) : super(key: key);

  @override
  _DialogWithExtrasState createState() => _DialogWithExtrasState();
}


class _DialogWithExtrasState extends State<DialogWithExtras> {
  late double totalPrice;
  Map<String, bool> extrasSelected = {};
  Map<String, String?> selectedRequiredOptions = {};
  Map<String, bool> showError = {};

  @override
  void initState() {
    super.initState();
    initializeSelections();
  }

  void initializeSelections() {
    totalPrice = widget.foodItem.price;
    widget.foodItem.extras.forEach((extra) {
      extrasSelected[extra.name] = false;
    });
    widget.foodItem.requiredOptions.forEach((option) {
      selectedRequiredOptions[option.name] = "(Choose an option)";
      showError[option.name] = false;
    });
    calculateTotalPrice();
  }

  void calculateTotalPrice() {
    double tempTotal = widget.foodItem.price;
    widget.foodItem.extras.forEach((extra) {
      if (extrasSelected[extra.name] == true) {
        tempTotal += extra.price ?? 0.0;
      }
    });

    widget.foodItem.requiredOptions.forEach((option) {
      String? selectedOption = selectedRequiredOptions[option.name];
      double? additionalCost = option.optionPrices[selectedOption];
      if (additionalCost != null) {
        tempTotal += additionalCost;
      }
    });

    setState(() {
      totalPrice = tempTotal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Customize Your Order"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...buildRequiredOptions(),
            ...buildExtrasOptions(),
          ],
        ),
      ),
      actions: <Widget>[
        Text("Total: \$${totalPrice.toStringAsFixed(2)}"),
        ElevatedButton(
          onPressed: () {
            if (validateRequiredOptions()) {
              // Update the item with the selected options and extras
              widget.foodItem.selectedRequiredOptions = selectedRequiredOptions;
              widget.foodItem.selectedExtras = extrasSelected;
              Provider.of<CartModel>(context, listen: false).addItem(widget.foodItem.clone());
              Navigator.of(context).pop(); // Close the dialog
            } else {
              // Handle the case where not all required options are selected
              print('Validation failed, item not added to cart');
            }
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

  List<Widget> buildRequiredOptions() {
    return widget.foodItem.requiredOptions.map((requiredOption) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showError[requiredOption.name] == true)
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                "Please select an option",
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: requiredOption.name),
            value: selectedRequiredOptions[requiredOption.name],
            onChanged: (String? newValue) {
              setState(() {
                selectedRequiredOptions[requiredOption.name] = newValue;
                showError[requiredOption.name] = newValue == "(Choose an option)";
                calculateTotalPrice();
              });
            },
            items: [DropdownMenuItem<String>(value: "(Choose an option)", child: Text("(Choose an option)"))]
              ..addAll(requiredOption.options.map((option) {
                double? price = requiredOption.optionPrices[option];
                String optionText = price != null && price > 0 ? "$option (+\$${price.toStringAsFixed(2)})" : option;
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(optionText),
                );
              })),
          ),
          SizedBox(height: 10),
        ],
      );
    }).toList();
  }

  List<Widget> buildExtrasOptions() {
    return widget.foodItem.extras.isNotEmpty ? [
      SizedBox(height: widget.foodItem.requiredOptions.isNotEmpty ? 16.0 : 0.0),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          "Extras",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      ...widget.foodItem.extras.map((extra) {
        return CheckboxListTile(
          title: Text("${extra.name} (\$${extra.price?.toStringAsFixed(2)})"),
          value: extrasSelected[extra.name],
          onChanged: (bool? value) {
            setState(() {
              extrasSelected[extra.name] = value!;
              calculateTotalPrice();
            });
          },
        );
      }).toList(),
    ] : [];
  }

  bool validateRequiredOptions() {
    bool allValid = true;
    setState(() {
      for (var option in widget.foodItem.requiredOptions) {
        if (selectedRequiredOptions[option.name] == "(Choose an option)") {
          showError[option.name] = true;
          allValid = false;
        } else {
          showError[option.name] = false;
        }
      }
    });
    return allValid;
  }
}
