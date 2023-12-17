import 'package:flutter/material.dart';
import 'package:coffeeappui/util/coffee_type.dart';
import 'package:coffeeappui/util/coffee_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeeType = [
    ['Cappuccino', true],
    ['Latte', false],
    ['Black', false],
    ['Tea', false],
    ['Croissant', false],
    ['Cakes', false],
    ['Doughnuts', false],
    ['Sandwiches', false],
    ['Macarons', false],
  ];

  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find the best coffee for you",
              style: GoogleFonts.getFont(
                'Bebas Neue',
                textStyle: const TextStyle(fontSize: 56, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Find your coffee...',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context, index) {
                return CoffeeType(
                  coffeeType: coffeeType[index][0],
                  isSelected: coffeeType[index][1],
                  onTap: () {
                    coffeeTypeSelected(index);
                  },
                );
              },
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                CoffeeTile(
                  coffeeImagePath: 'lib/images/latte.png',
                  coffeeName: 'Latte',
                  coffeePrice: '4.20',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/mocha.png',
                  coffeeName: 'Mocha',
                  coffeePrice: '4.18',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/croissant.png',
                  coffeeName: 'Croissant',
                  coffeePrice: '4.49',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/2coffee.png',
                  coffeeName: 'Hazelnut Coffee',
                  coffeePrice: '5.31',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/ford.png',
                  coffeeName: 'Coffee',
                  coffeePrice: '4.49',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
