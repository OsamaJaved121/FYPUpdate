// ignore: import_of_legacy_library_into_null_safe
import 'package:clippy_flutter/arc.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:provider/provider.dart';

import '../providers/products.dart';

//import '../widgets/item_app_bar.dart';

import '../providers/cart.dart';

class ItemPageScreen extends StatelessWidget {
  static const routeName = '/item-page';
  final List<Color> clrs = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
  ];
  ItemPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)?.settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    final cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          loadedProduct.title,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        backgroundColor: Color(0xFF4C53A5),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF4C53A5),
        onPressed: () {
          cart.addItem(loadedProduct.id, loadedProduct.price,
              loadedProduct.title, loadedProduct.imageUrl);
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Added item to cart!',
              ),
              duration: Duration(seconds: 2),
              action: SnackBarAction(
                label: 'UNDO',
                onPressed: () {
                  cart.removeSingleItem(loadedProduct.id);
                },
              ),
            ),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
      backgroundColor: const Color(0xffedecf2),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.network(
              loadedProduct.imageUrl,
              //fit: BoxFit.cover,
            ),
          ),
          Arc(
            edge: Edge.TOP,
            arcType: ArcType.CONVEY,
            height: 30,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 20),
                      // child: Row(
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.only(top: 5, bottom: 10),
                      //       child: Row(
                      //         children: [Row()],
                      //       ),
                      //     ),
                      //     Container()
                      //   ],
                      // ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingBar.builder(
                            initialRating: 4,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4),
                            itemBuilder: (context, _) => const Icon(
                              Icons.favorite,
                              color: Color(0xFF4C53A5),
                            ),
                            onRatingUpdate: (index) {},
                          ),
                          // Row(
                          //   children: [
                          //     Container(
                          //       padding: const EdgeInsets.all(5),
                          //       decoration: BoxDecoration(
                          //         color: Colors.white,
                          //         borderRadius: BorderRadius.circular(20),
                          //         boxShadow: [
                          //           BoxShadow(
                          //               color: Colors.grey.withOpacity(0.5),
                          //               spreadRadius: 3.0,
                          //               blurRadius: 10.0,
                          //               offset: const Offset(0, 3))
                          //         ],
                          //       ),
                          //       child: const Icon(
                          //         CupertinoIcons.minus,
                          //         size: 18,
                          //         color: Color(0xFF4C53A5),
                          //       ),
                          //     ),
                          //     Container(
                          //       margin: const EdgeInsets.symmetric(
                          //         horizontal: 10.0,
                          //       ),
                          //       child: const Text(
                          //         "01",
                          //         style: TextStyle(
                          //           fontSize: 18,
                          //           fontWeight: FontWeight.bold,
                          //           color: Color(0xFF4C53A5),
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       padding: const EdgeInsets.all(5),
                          //       decoration: BoxDecoration(
                          //         color: Colors.white,
                          //         borderRadius: BorderRadius.circular(20),
                          //         boxShadow: [
                          //           BoxShadow(
                          //               color: Colors.grey.withOpacity(0.5),
                          //               spreadRadius: 3.0,
                          //               blurRadius: 10.0,
                          //               offset: const Offset(0, 3))
                          //         ],
                          //       ),
                          //       child: const Icon(
                          //         CupertinoIcons.plus,
                          //         size: 18,
                          //         color: Color(0xFF4C53A5),
                          //       ),
                          //     ),
                          //   ],
                          // )
                          Spacer(),
                          Text(
                            '\$ ${loadedProduct.price}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4C53A5),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        loadedProduct.description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xFF4C53A5),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          const Text(
                            "Size:",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4C53A5),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                alignment: Alignment.center,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                                child: const Text(
                                  "1",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF4C53A5),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                alignment: Alignment.center,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                                child: const Text(
                                  "2",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF4C53A5),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                alignment: Alignment.center,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                                child: const Text(
                                  "3",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF4C53A5),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                alignment: Alignment.center,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                                child: const Text(
                                  "4",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF4C53A5),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                alignment: Alignment.center,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                                child: const Text(
                                  "5",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF4C53A5),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          const Text(
                            "Colors:",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4C53A5),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Row(
                            children: [
                              for (int i = 0; i < 5; i++)
                                Container(
                                  height: 30,
                                  width: 30,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    color: clrs[i],
                                    borderRadius: BorderRadius.circular(30.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 8,
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 15),
                      child: Container(
                        height: 50,
                        width: 210,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Try AR',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF4C53A5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
