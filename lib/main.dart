import 'package:flutter/material.dart';
import 'package:myshop/providers/product.dart';
import 'package:provider/provider.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/orders_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/user_products_screen.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/auth.dart';
import './screens/cart_screen.dart';
import './providers/orders.dart';
import './screens/auth_screen.dart';
import './screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          update: (ctx, auth, prevProd) => Products(
            auth.token, 
            auth.userId,
            prevProd == null ? [] : prevProd.items
          ),
         // builder: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          update: (ctx, auth, prevOrders) => Orders(
            auth.token, 
            auth.userId,
            prevOrders == null ? [] : prevOrders.orders
          ),
        ),
      ],
     // builder: (ctx) => Products(),
      child: Consumer<Auth> (builder: (ctx,auth,_) => MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: auth.isAuth 
          ? ProductsOverviewScreen() 
          : FutureBuilder(
            future: auth.tryAutoLogin(), 
            builder: (ctx, authResultSnapshot) => 
              authResultSnapshot.connectionState == ConnectionState.waiting 
                ? SplashScreen() 
                : AuthScreen(),
          ),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
         // ProductsOverviewScreen.rout
        },
      ),
      ),
    );
  }
}