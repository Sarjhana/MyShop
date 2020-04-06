import 'package:flutter/material.dart';

import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {

  final String id;
  final String title;
  final String imageUrl;

  ProductItem(this.id,this.title,this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: ()  {
          Navigator.of(context).pushNamed(
            ProductDetailScreen.routeName,
            arguments: id,
          );
        },
        child: GridTile(
          child: Image.network(
            imageUrl, 
            fit: BoxFit.cover,
            ),
            footer: GridTileBar(
              backgroundColor: Colors.black54,
              leading: IconButton(
                icon: Icon(Icons.favorite),
                iconSize: 20,
                color: Theme.of(context).accentColor,
                onPressed: () {},
                ),
              trailing: IconButton(
                onPressed: (){},
                icon: Icon(Icons.shopping_cart),
                iconSize: 20,
                color: Theme.of(context).accentColor,
                ),
              title: FittedBox(
                  fit: BoxFit.fill,
                  child: Text(
                  title,
                  textAlign: TextAlign.center,
                  ),
              ),
            ),
          
        ),
      ),
    );
  }
}