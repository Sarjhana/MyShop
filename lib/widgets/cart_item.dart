import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {

  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItem(this.id, this.price, this.quantity, this.title);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
          ),
          alignment: Alignment.centerRight,
      ),
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: FittedBox(child: Text('₹$price')
                ),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total: ₹${(price * quantity)}'),
            trailing: Text('$quantity x'),
          ),
          ),
      ),
    );
  }
}