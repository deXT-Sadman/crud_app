// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:crud_app/data/model/product_model.dart';
import 'package:crud_app/presentation/ui/screens/add_product_screen.dart';
import 'package:crud_app/presentation/ui/widgets/product_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool inProgress = false;
  Client http = Client();
  ProductModel productModel = ProductModel();

  @override
  void initState() {
    super.initState();
    getAllProduct();
  }

  void getAllProduct() async {
    inProgress = true;
    setState(() {});

    Uri uri = Uri.parse(
      'https://crud-api-ostad-live.onrender.com/api/v1/ReadProduct',
    );

    Response response = await http.get(uri);
    productModel = ProductModel.fromJson(jsonDecode(response.body));

    inProgress = false;
    setState(() {});
  }

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
        child: inProgress == true
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: productModel.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 530,
                        width: double.infinity,
                        child: Card(
                          color: Colors.grey.shade300,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ProductInfo(
                                  productTitle:
                                      "Product Name: ${productModel.data?[index].productName ?? "N/A"}",
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                                ProductInfo(
                                  productTitle:
                                      "Product Code: ${productModel.data?[index].productCode ?? "N/A"}",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                                ProductInfo(
                                  productTitle:
                                      "IMG: ${productModel.data?[index].img ?? "N/A"}",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                                ProductInfo(
                                  productTitle:
                                      "Qty: ${productModel.data?[index].qty ?? "N/A"}",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                                ProductInfo(
                                  productTitle:
                                      "Unit Price: ${productModel.data?[index].unitPrice ?? "N/A"}",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                                ProductInfo(
                                  productTitle:
                                      "Total Price: ${productModel.data?[index].totalPrice ?? "N/A"}",
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                                      border:
                                                          OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 12),
                                                  TextField(
                                                    controller:
                                                        _productCodeController,
                                                    decoration: InputDecoration(
                                                      hintText: "Product Code",
                                                      border:
                                                          OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 12),
                                                  TextField(
                                                    controller: _imgController,
                                                    decoration: InputDecoration(
                                                      hintText: "Product Image",
                                                      border:
                                                          OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 12),
                                                  TextField(
                                                    controller: _qtyController,
                                                    decoration: InputDecoration(
                                                      hintText: "Product QTY",
                                                      border:
                                                          OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 12),
                                                  TextField(
                                                    controller:
                                                        _productUnitPriceController,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          "Product Unit Price",
                                                      border:
                                                          OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 12),
                                                  TextField(
                                                    controller:
                                                        _productTotalPriceController,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          "Product Total Price",
                                                      border:
                                                          OutlineInputBorder(),
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
                                                        foregroundColor:
                                                            Colors.black,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                8,
                                                              ),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        "Add Product",
                                                      ),
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
                                              title: Text(
                                                "Are you sure for delete?",
                                              ),
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
