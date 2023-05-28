//import 'package:badges/badges.dart' as badge;
import '../widgets/badge.dart' as badge;
import 'package:flutter/material.dart';
import '../providers/cart.dart';
import '../screens/cart_screen.dart';
import 'package:provider/provider.dart';

//import 'app_drawer.dart';

enum FilterOptions {
  Favorites,
  All,
}

class HomeAppbar extends StatefulWidget {
  const HomeAppbar({super.key});

//static const filterOptions = FilterOptions;

  @override
  State<HomeAppbar> createState() => _HomeAppbarState();
}

class _HomeAppbarState extends State<HomeAppbar> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            iconSize: 25.0,
            color: Color(0xFF4C53A5),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Try It",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C53A5),
              ),
            ),
          ),
          const Spacer(),
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: const Icon(
              Icons.more_vert,
              color: Color(0xFF4C53A5),
            ),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.Favorites,
                child: Text('Only Favorites'),
              ),
              const PopupMenuItem(
                value: FilterOptions.All,
                child: Text('Show All'),
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => badge.Badge(
              child: ch!,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_bag_outlined,
                size: 30,
                color: Color(0xFF4C53A5),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),

          // badge.Badge(
          //   badgeStyle: const badge.BadgeStyle(
          //     badgeColor: Colors.red,
          //     padding: EdgeInsets.all(7),
          //   ),
          //   badgeContent: const Text(
          //     "3",
          //     style: TextStyle(
          //       color: Colors.white,
          //     ),
          //   ),
          //   child: InkWell(
          //     onTap: () {},
          //     child: const Icon(
          //       Icons.shopping_bag_outlined,
          //       size: 30,
          //       color: Color(0xFF4C53A5),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
