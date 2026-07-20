// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  bool inProgress = false;
  Client http = Client();

  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productCodeController = TextEditingController();
  final TextEditingController _imgController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();
  final TextEditingController _productUnitPriceController =
      TextEditingController();
  final TextEditingController _productTotalPriceController =
      TextEditingController();

  @override
  void dispose() {
    _productNameController.dispose();
    _productCodeController.dispose();
    _imgController.dispose();
    _qtyController.dispose();
    _productUnitPriceController.dispose();
    _productTotalPriceController.dispose();
    super.dispose();
  }

  void addProduct() async {
    inProgress = true;
    setState(() {});

    Uri uri = Uri.parse(
      'https://crud-api-ostad-live.onrender.com/api/v1/CreateProduct',
    );

    Response response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "ProductName": _productNameController.text.toString(),
        "ProductCode": int.parse(_productCodeController.text),
        "Img": _imgController.text.toString(),
        "Qty": int.parse(_qtyController.text),
        "UnitPrice": int.parse(_productUnitPriceController.text),
        "TotalPrice": int.parse(_productTotalPriceController.text),
      }),
    );

    final responseJson = jsonDecode(response.body);
    inProgress = false;
    setState(() {});

    if (responseJson["status"] == "success") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Created Successfully"),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed!"), backgroundColor: Colors.redAccent),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        backgroundColor: Colors.amberAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _productNameController,
                decoration: InputDecoration(
                  hintText: "Product Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _productCodeController,
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
                controller: _productUnitPriceController,
                decoration: InputDecoration(
                  hintText: "Product Unit Price",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _productTotalPriceController,
                decoration: InputDecoration(
                  hintText: "Product Total Price",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    addProduct();
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amberAccent,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text("Add Product"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
