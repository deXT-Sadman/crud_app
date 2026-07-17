import 'package:crud_app/presentation/ui/screens/add_product_screen.dart';
import 'package:crud_app/presentation/ui/widgets/product_info.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD APP"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            SizedBox(
              height: 270,
              width: double.infinity,
              child: Card(
                color: Colors.grey.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductInfo(
                        productTitle: "Product Name: Asus",
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                      ProductInfo(
                        productTitle: "Product Code: Asus",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      ProductInfo(
                        productTitle: "IMG: Asus",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      ProductInfo(
                        productTitle: "Qty: Asus",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      ProductInfo(
                        productTitle: "Unit Price: Asus",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      ProductInfo(
                        productTitle: "Total Price: Asus",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                          SizedBox(width: 5),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProductScreen()),
          );
        },
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        child: Icon(Icons.add),
      ),
    );
  }
}
