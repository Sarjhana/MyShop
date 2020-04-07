import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';

enum FilterOptions{
  Favourites,
  all,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavourites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue){
              setState(() {
                if(selectedValue == FilterOptions.Favourites){
                  _showOnlyFavourites = true;
                }
                else {
                  _showOnlyFavourites = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favourites'), 
                value: FilterOptions.Favourites
                ),
              PopupMenuItem(
                child: Text('Show All'), 
                value: FilterOptions.all,
                ),
            ],
          )
        ],
        ),
      body: ProductsGrid(_showOnlyFavourites),
    );
  }
}

