import 'package:flutter/material.dart';

void main() {
  runApp(const MyShop());
}

class MyShop extends StatelessWidget {
  const MyShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fharadilla Rahmah',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen(),
    );
  }
}

class ProductName {
  final String name;
  final String image;
  final String desc;
  final double price;

  ProductName(this.name, this.image, this.desc, this.price);
}

final List<ProductName> productsName = [
  ProductName('Nike Air Jordan', 'assets/images/jordan.png',
      'Explode your Style like a Michael Jordan!', 100.0),
  ProductName('Vans', 'assets/images/vans.png', 'free as a life!', 80.0),
  ProductName('Converse', 'assets/images/converse.png',
      'Like My Hoby is Basket!', 120.0),
  ProductName('Docmart', 'assets/images/docmart.png',
      'Like My Hoby is Basket!', 160.0),
  ProductName('Nike Air Force', 'assets/images/airforce.png',
      'Like My Hoby is Basket!', 170.0),
  ProductName('Adidas', 'assets/images/adidas.png',
      'Like My Hoby is Basket!', 180.0),
  ProductName('Nike Basket', 'assets/images/patu1.png',
      'Like My Hoby is Basket!', 140.0),
];

class ProductListScreen extends StatelessWidget {
  ProductListScreen({Key? key});

  final List<Color> colors = [
    Color.fromARGB(255, 250, 160, 137)!,
    Color.fromARGB(255, 103, 221, 195)!,
    Color.fromARGB(255, 243, 149, 215)!,
    Color.fromARGB(255, 133, 243, 142)!,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: const [
                Text('Shoes',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                Spacer(),
                CircleAvatar(           
                  backgroundImage: AssetImage('assets/images/patu1.png'),
                  radius: 24.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: productsName.length,
              itemBuilder: (BuildContext context, int index) {
                final product = productsName[index];
                return Container(
                  margin: EdgeInsets.all(10),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: colors[index % colors.length],
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.name,
                                style: const TextStyle(fontSize: 20.0)),
                            const SizedBox(height: 8.0),
                            Text(product.desc),
                            const SizedBox(height: 8.0),
                            Text('${product.price}',
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Image.network(product.image, width: 80.0, height: 80.0),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
