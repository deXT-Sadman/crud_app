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
      appBar: AppBar(title: Text("Todo"), backgroundColor: Colors.amberAccent),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            SizedBox(
              height: 210,
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
