import 'package:ecommerce_app/Pages/home_page.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/services/product.dart';
import 'package:ecommerce_app/components/custom_button.dart';
import 'package:ecommerce_app/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductPage extends StatefulWidget {
  static String id = 'update product';

  const UpdateProductPage({super.key});

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Update Product'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Text('Product Name:'),
                const SizedBox(height: 8),
                CustomTextField(
                  initialValue: product.title,
                  onChanged: (value) {
                    product.title = value;
                  },
                  hintText: 'Product Name',
                ),
                const SizedBox(height: 15),
                const Text('Description:'),
                const SizedBox(height: 8),
                CustomTextField(
                  initialValue: product.description,
                  onChanged: (value) {
                    product.description = value;
                  },
                  hintText: 'description',
                ),
                const SizedBox(height: 15),
                const Text('Price:'),
                const SizedBox(height: 8),
                CustomTextField(
                  initialValue: product.price.toString(),
                  onChanged: (value) {
                    product.price = value;
                  },
                  hintText: 'price',
                  inputType: TextInputType.number,
                ),
                const SizedBox(height: 15),
                const Text('Image:'),
                const SizedBox(height: 8),
                CustomTextField(
                  initialValue: product.image,
                  onChanged: (value) {
                    product.image = value;
                  },
                  hintText: 'image',
                ),
                const SizedBox(height: 30),
                CustomButon(
                  text: 'Update',
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });
                    try {
                      await updateProduct(product);
                      Navigator.pop(
                        context,
                        HomePage.id,
                      );
                    } catch (e) {
                      print(e.toString());
                    }
                    setState(() {
                      isLoading = false;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await Product().update(
        id: product.id,
        title: product.title,
        price: product.price.toString(),
        desc: product.description,
        image: product.image,
        category: product.category);
  }
}
