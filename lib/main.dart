
// Flutter package imports:
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/item_page.dart';
import 'package:provider/provider.dart';

// Screen imports:
import './screens/cart_page.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/orders_screen.dart';
import './screens/user_products_screen.dart';
import './screens/item_page.dart';

// Providers imports:
import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Try IT!",
          theme: ThemeData(
            fontFamily: 'Lato',
            primaryColor: Color(0xFF4C53A5),
            
          ),
          home: //ProductsOverviewScreen(),
              ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartPage.routeName: (ctx) => CartPage(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
            ItemPageScreen.routeName:(ctx)=> ItemPageScreen(),
          }),
    );
  }
}
