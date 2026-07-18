import 'package:crud_app/presentation/ui/screens/add_product_screen.dart';
import 'package:crud_app/presentation/ui/widgets/product_info.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productCodeController = TextEditingController();
  final TextEditingController _imgController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();
  final TextEditingController _productUnitPriceController =
      TextEditingController();
  final TextEditingController _productTotalPriceController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD APP"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Column(
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
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Update Product"),
                                            const SizedBox(width: 12),
                                            IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(Icons.cancel),
                                            ),
                                          ],
                                        ),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextField(
                                              controller:
                                                  _productNameController,
                                              decoration: InputDecoration(
                                                hintText: "Product Name",
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                            const SizedBox(height: 12),
                                            TextField(
                                              controller:
                                                  _productCodeController,
                                              decoration: InputDecoration(
                                                hintText: "Product Code",
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                            const SizedBox(height: 12),
                                            TextField(
                                              controller: _imgController,
                                              decoration: InputDecoration(
                                                hintText: "Product Image",
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                            const SizedBox(height: 12),
                                            TextField(
                                              controller: _qtyController,
                                              decoration: InputDecoration(
                                                hintText: "Product QTY",
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                            const SizedBox(height: 12),
                                            TextField(
                                              controller:
                                                  _productUnitPriceController,
                                              decoration: InputDecoration(
                                                hintText: "Product Unit Price",
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                            const SizedBox(height: 12),
                                            TextField(
                                              controller:
                                                  _productTotalPriceController,
                                              decoration: InputDecoration(
                                                hintText: "Product Total Price",
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                            const SizedBox(height: 12),
                                            SizedBox(
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.amberAccent,
                                                  foregroundColor: Colors.black,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8,
                                                        ),
                                                  ),
                                                ),
                                                child: Text("Add Product"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                icon: Icon(Icons.edit),
                              ),
                              SizedBox(width: 5),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Are you sure for delete?"),
                                        content: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("No"),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Text("Yes"),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
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
            );
          },
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
