import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intermediate_final_project/data/repositories/products_repo.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  final product;

  const ProductDetails(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product, style: const TextStyle(fontSize: 25)),
      ),
      body: ChangeNotifierProvider<ProductsData>(
          create: (_) => ProductsData()..fetchProducts(),
          builder: (BuildContext context, _) {
            final viewModel = context.watch<ProductsData>();
            final data = viewModel.allData;
            return ListView.builder(
                itemCount: data.length,
                padding: const EdgeInsets.all(10),
                itemBuilder: (BuildContext context, int index) {
                  final product = data[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CachedNetworkImage(
                            imageUrl: product["image"],
                            placeholder: (context, url) => const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                          const SizedBox(height: 15,),
                          Text(product["title"], style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),),
                          Text(product["description"], style: const TextStyle(
                              fontSize: 15,),),
                          const SizedBox(height: 10,),
                          Text("Price: ${product["price"]}  US",
                            style: const TextStyle(fontSize: 18),),
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
