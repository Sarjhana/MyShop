import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

   final product = Provider.of<Product>(context, listen: false);
   final cart = Provider.of<Cart>(context);

    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: ()  {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: GridTile(
            child: Image.network(
              product.imageUrl, 
              fit: BoxFit.cover,
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black87,
                leading: Consumer<Product>(
                  builder: (ctx, product, _) => 
                    IconButton(
                      icon: Icon(product.isFavourite ? Icons.favorite : Icons.favorite_border),
                      iconSize: 20,
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        product.toggleFavouriteStatus();
                      },
                    ),
                  ),
                trailing: IconButton(
                  onPressed: (){
                    cart.addItem(product.id, product.price, product.title);
                  },
                  icon: Icon(Icons.shopping_cart),
                  iconSize: 20,
                  color: Theme.of(context).accentColor,
                  ),
                title: FittedBox(
                    fit: BoxFit.fill,
                    child: Text(
                    product.title,
                    textAlign: TextAlign.center,
                    ),
                ),
              ),
          ),
        ),
    );
  }
}