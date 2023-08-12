import 'package:ecommerce_flutter_app/Provider/Provider.dart';
import 'package:ecommerce_flutter_app/Views/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Utils/utils.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var TotalAmount = 0;

  @override
  void initState() {
    super.initState();
    Addedproducts.forEach((ele) {
      TotalAmount += ele.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // toolbarHeight: 80,
        backgroundColor: Colors.white,
        title: const Text(
          "Your Cart",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.home_filled,
                color: Colors.black87,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('home');
              },
            ),
          )
        ],
      ),
      body: Addedproducts.isEmpty
          ? Center(
              child: Text(
                'Your cart is empty.',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemBuilder: (context, i) {
                final product = Addedproducts[i];
                return Container(
                  margin: const EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(blurRadius: 5, color: Colors.grey),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 0.4,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey,
                                image: DecorationImage(
                                  image: NetworkImage(product.thumbnail),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "Prize : \$ ${product.price}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      Addedproducts.remove(product);
                                      TotalAmount -= product.price;
                                    });
                                  },
                                  child: const Text("Remove Product"),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          product.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: Addedproducts.length,
            ),
      bottomNavigationBar: Addedproducts.isNotEmpty
          ? Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total Price: ",
                    style: TextStyle(fontSize: 22),
                  ),
                  Text(
                    "\$ $TotalAmount",
                    style: const TextStyle(fontSize: 22),
                  ),
                ],
              ),
            )
          : null,
      // body: Column(
      //   children: [
      //     Expanded(
      //       child: SingleChildScrollView(
      //         child: Column(children: [
      //           ...Addedproducts.map(
      //             (e) => Container(
      //               margin: const EdgeInsets.all(20),
      //               height: MediaQuery.of(context).size.height * 0.3,
      //               width: MediaQuery.of(context).size.width,
      //               decoration: BoxDecoration(
      //                   color: Colors.white,
      //                   borderRadius: BorderRadius.circular(30),
      //                   boxShadow: [
      //                     const BoxShadow(blurRadius: 5, color: Colors.grey),
      //                   ]),
      //               child: Padding(
      //                 padding: const EdgeInsets.all(16),
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Row(
      //                       children: [
      //                         Container(
      //                           margin: const EdgeInsets.all(10),
      //                           height:
      //                               MediaQuery.of(context).size.height * 0.2,
      //                           width: MediaQuery.of(context).size.width * 0.40,
      //                           alignment: Alignment.centerLeft,
      //                           decoration: BoxDecoration(
      //                               borderRadius: BorderRadius.circular(30),
      //                               color: Colors.grey,
      //                               image: DecorationImage(
      //                                   image: NetworkImage(e.thumbnail),
      //                                   fit: BoxFit.cover)),
      //                         ),
      //                         Column(
      //                           children: [
      //                             Text(
      //                               "Prize : \$ ${e.price}",
      //                               style: const TextStyle(
      //                                   fontWeight: FontWeight.bold,
      //                                   fontSize: 22),
      //                             ),
      //                             ElevatedButton(
      //                                 onPressed: () {
      //                                   setState(() {
      //                                     Addedproducts.remove(e);
      //                                     TotalAmount -= e.price;
      //                                   });
      //                                 },
      //                                 child: const Text("Remove Product")),
      //                           ],
      //                         ),
      //                       ],
      //                     ),
      //                     Text(
      //                       e.title,
      //                       style: const TextStyle(
      //                           fontWeight: FontWeight.bold, fontSize: 20),
      //                     )
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ).toList(),
      //           Align(
      //             alignment: AlignmentDirectional.bottomEnd,
      //             child: Container(
      //               color: Colors.grey[200],
      //               padding: const EdgeInsets.all(20),
      //               child: Row(
      //                 crossAxisAlignment: CrossAxisAlignment.end,
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Text(
      //                     "Total Price: ",
      //                     style: const TextStyle(fontSize: 22),
      //                   ),
      //                   Text(
      //                     "\$ $TotalAmount",
      //                     style: const TextStyle(fontSize: 22),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ]),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
