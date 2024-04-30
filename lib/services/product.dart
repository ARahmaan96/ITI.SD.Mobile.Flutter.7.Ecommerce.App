import 'package:ecommerce_app/config.dart';
import 'package:ecommerce_app/helper/http.dart';
import 'package:ecommerce_app/models/product.dart';

class Product {
  Future<List<ProductModel>> getProducts() async {
    List<dynamic> data = await Http().get(url: '$apiEndpoint/products');

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productsList;
  }

  Future<ProductModel> add(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required String category}) async {
    Map<String, dynamic> data =
        await Http().post(url: '$apiEndpoint/products', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category,
    });

    return ProductModel.fromJson(data);
  }

  Future<ProductModel> update(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required int id,
      required String category}) async {
    Map<String, dynamic> data =
        await Http().put(url: '$apiEndpoint/products/$id', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category,
    });

    return ProductModel.fromJson(data);
  }
}
