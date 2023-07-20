import 'package:flutter/material.dart';
import 'package:shopapp/providers/product.dart';
import 'package:shopapp/widgets/products_grid.dart';

enum FilterOptions{
  Favorites,
  All
}


class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites= false;

  List<Product> loadedProducts = [
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('My Shop', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        actions: [
          PopupMenuButton(itemBuilder: (_)=>[
            PopupMenuItem(child: Text('Only Favorites'), value: FilterOptions.Favorites),
            PopupMenuItem(child: Text('Show All'), value: FilterOptions.All),
          ],
          color: Colors.black,
          onSelected: (FilterOptions selectedValue){
            setState(() {
              if (selectedValue == FilterOptions.Favorites){
                _showOnlyFavorites= true;
              }
              else{
                _showOnlyFavorites= false;
              }
            });

          },)
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
