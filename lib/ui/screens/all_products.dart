import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intermediate_final_project/data/repositories/products_repo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'product_details.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products", style: TextStyle(fontSize: 25),
        ),
      ),
      body: ChangeNotifierProvider<ProductsData>(
        create: (_) => ProductsData()..fetchProducts(),
        builder: (BuildContext context, _) {
          final viewModel = Provider.of<ProductsData>(context);
          //final viewModel = context.watch<ProductsData>();
          final data = viewModel.allData;
          return GridView.builder(
              itemCount: data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final product = data[index];
                return ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=> ProductDetails(product["title"])));
                  },
                  child: Card(
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
                          const SizedBox(height: 10,),
                          Text("Price: ${product["price"]}  US",
                            style: const TextStyle(fontSize: 18),),
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
