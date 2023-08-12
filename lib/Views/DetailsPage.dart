import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/model.dart';
import '../Utils/utils.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  late Product fdata;
  @override
  Widget build(BuildContext context) {
    Product fdata = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          "Amazon",
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              //Navigate to previous screen
            },
            icon: const Icon(
              CupertinoIcons.cart,
              color: Colors.black,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!Addedproducts.contains(fdata)) {
            Addedproducts.add(fdata);
          }
          Navigator.of(context).pushNamed('cart');
        },
        child: const Icon(Icons.add_shopping_cart),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: fdata.images
                        .map((e) => Container(
                              margin: const EdgeInsets.all(5),
                              height: 421,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(e), fit: BoxFit.cover),
                              ),
                            ))
                        .toList()),
              ),
            ],
          ),
          Positioned(
            top: 400,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 12, spreadRadius: 2),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            fdata.title,
                            style: const TextStyle(
                                fontSize: 21, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            "\$ ${fdata.price}",
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          fdata.category,
                          style:
                              const TextStyle(fontSize: 22, color: Colors.grey),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          " ⭐ ${fdata.rating}",
                          style:
                              const TextStyle(fontSize: 22, color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Brand",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          fdata.brand,
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Stock",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          "${fdata.stock}",
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Description",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      fdata.description,
                      style: const TextStyle(fontSize: 22, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
