import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/screens/product_detail_screen.dart';
import 'package:shopapp/providers/product.dart';

class ProductItem extends StatelessWidget {

  final String id;
  final String title;
  final String imageUrl;

  ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductDetailScreen.routeName, arguments: product.id);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: [
            Container(
              child: Column(children: [
              Image.network(
                product.imageUrl,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(product.title, style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              Row(children: [
                Text('\$${product.price}', style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(width: 98.5),
                IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart)
                ),
              ],)
          ]),
            ),
            Consumer<Product>(builder: (context, product, _) =>
              IconButton(onPressed: (){
                product.toggleFavoriteStatus();
              }, icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.grey[400],)),
            )
          ]

        ),
      ),
    );
  }
}
