import 'package:ecommerce_flutter_app/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '../Model/Helper/helper.dart';
import '../Model/model.dart';
import '../Provider/Provider.dart';

Widget getProduct(
    {required String category,
    required String displayname,
    required List<Product> filteredData,
    double min = 0,
    double max = 2000}) {
  return FutureBuilder(
    future: APIHelper.apiHelper.callApi(),
    builder: (context, snapshot) {
      double h = MediaQuery.of(context).size.height;
      double w = MediaQuery.of(context).size.width;
      if (snapshot.hasError) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: h * 0.3,
              ),
              Image.asset(
                'assets/images/download.png',
                height: 200,
                width: 200,
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Text(
                "No Internet Connection\n Please Connect a Network",
                style: TextStyle(
                    fontSize: h * 0.022,
                    color: Provider.of<ThemeProvider>(context).isdark
                        ? Colors.red
                        : Colors.red),
              ),
            ],
          ),
        );
      } else if (snapshot.hasData) {
        List<Product>? data = snapshot.data;
        filteredData =
            data!.where((item) => category == item.category).toList();
        return SizedBox(
          height: h * 0.5,
          width: w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    displayname,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              Expanded(
                flex: 20,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: filteredData.length,
                  itemBuilder: (context, i) {
                    filteredData[i].price >= min;
                    filteredData[i].price <= max;
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed("detail", arguments: filteredData[i]);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        // height: h,
                        width: w * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                      ),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              filteredData[i].thumbnail),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 60,
                                    decoration: const BoxDecoration(
                                      color: Color(0xffb71c1c),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${filteredData[i].discountPercentage} %",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                width: w,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        filteredData[i].title,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        "\$ ${filteredData[i].price}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      RatingBarIndicator(
                                        rating:
                                            filteredData[i].rating.toDouble(),
                                        itemBuilder: (context, index) =>
                                            const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        itemCount: 5,
                                        itemSize: 20,
                                        direction: Axis.horizontal,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Container();
                  },
                ),
              ),
            ],
          ),
        );
      }
      return Center(
        child: SizedBox(
          height: h,
          width: w,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
        ),
      );
    },
  );
  // return Builder(builder: (context) {
  //   double h = MediaQuery.of(context).size.height;
  //   double w = MediaQuery.of(context).size.width;
  //   return SizedBox(
  //     height: h * 0.4,
  //     width: w,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.all(10),
  //           child: Text(
  //             displayname,
  //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
  //           ),
  //         ),
  //         Expanded(
  //           flex: 1,
  //           child: ListView.separated(
  //             scrollDirection: Axis.horizontal,
  //             itemCount: filteredData!.length,
  //             itemBuilder: (context, i) {
  //               // Product product = data[index];
  //               return Container(
  //                 margin: const EdgeInsets.all(20),
  //                 height: h * 0.5,
  //                 width: w * 0.5,
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(30),
  //                   border: Border.all(),
  //                 ),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Expanded(
  //                       flex: 1,
  //                       child: Stack(
  //                         children: [
  //                           Container(
  //                             decoration: BoxDecoration(
  //                               borderRadius: const BorderRadius.only(
  //                                 topLeft: Radius.circular(30),
  //                                 topRight: Radius.circular(30),
  //                               ),
  //                               image: DecorationImage(
  //                                   image:
  //                                       NetworkImage(filteredData[i].thumbnail),
  //                                   fit: BoxFit.cover),
  //                             ),
  //                             // child: Image.asset("lib/Assets/Image/monkeybhai.jpg"),
  //                             // child: Image.network(
  //                             //   "https://gifdb.com/images/high/goofy-dancing-monkey-ar6ploj3u3zrtlru.gif",
  //                             //   fit: BoxFit.cover,
  //                             // ),
  //                           ),
  //                           Container(
  //                             height: 30,
  //                             width: 60,
  //                             decoration: const BoxDecoration(
  //                               color: Color(0xffb71c1c),
  //                               borderRadius: BorderRadius.only(
  //                                 topLeft: Radius.circular(30),
  //                                 bottomRight: Radius.circular(10),
  //                               ),
  //                             ),
  //                             alignment: Alignment.center,
  //                             child: Text(
  //                               "${filteredData[i].discountPercentage} %",
  //                               style: const TextStyle(
  //                                 color: Colors.white,
  //                                 fontWeight: FontWeight.bold,
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                     Expanded(
  //                       child: Container(
  //                         width: w,
  //                         decoration: const BoxDecoration(
  //                           borderRadius: BorderRadius.only(
  //                             bottomLeft: Radius.circular(30),
  //                             bottomRight: Radius.circular(30),
  //                           ),
  //                         ),
  //                         child: Padding(
  //                           padding: const EdgeInsets.only(left: 10),
  //                           child: Column(
  //                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Text(
  //                                 filteredData[i].title,
  //                                 style: const TextStyle(
  //                                     fontWeight: FontWeight.w500,
  //                                     fontSize: 16),
  //                               ),
  //                               Text(
  //                                 "\$ ${filteredData[i].price}",
  //                                 style: const TextStyle(
  //                                   fontWeight: FontWeight.bold,
  //                                   fontSize: 16,
  //                                 ),
  //                               ),
  //                               RatingBarIndicator(
  //                                 rating: filteredData[i].rating.toDouble(),
  //                                 itemBuilder: (context, index) => const Icon(
  //                                   Icons.star,
  //                                   color: Colors.amber,
  //                                 ),
  //                                 itemCount: 5,
  //                                 itemSize: 20,
  //                                 direction: Axis.horizontal,
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               );
  //             },
  //             separatorBuilder: (BuildContext context, int index) {
  //               return Container();
  //             },
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // });
  // return Builder(builder: (context) {
  //   double h = MediaQuery.of(context).size.height * 0.45;
  //   double w = MediaQuery.of(context).size.width * 0.5;
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.only(left: 25),
  //         child: Text(
  //           displayname,
  //           style: const TextStyle(
  //             fontSize: 25,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //       SingleChildScrollView(
  //         physics: const BouncingScrollPhysics(),
  //         scrollDirection: Axis.horizontal,
  //         child: Row(
  //             children: Allproducts.map((e) => (e['category'] == category)
  //                 ? (e['price'] >= min.toInt() && e['price'] <= max.toInt())
  //                     ? Builder(builder: (ctx) {
  //                         return GestureDetector(
  //                           onTap: () {
  //                             Product p1 = Product(
  //                               id: e['id'],
  //                               brand: e['brand'],
  //                               category: e['category'],
  //                               description: e['description'],
  //                               discountPercentage: e['discountPercentage'],
  //                               images: e['images'],
  //                               price: e['price'],
  //                               rating: e['rating'],
  //                               stock: e['stock'],
  //                               thumbnail: e['thumbnail'],
  //                               title: e['title'],
  //                             );
  //                             Navigator.of(context)
  //                                 .pushNamed('detail', arguments: p1);
  //                           },
  //                           child: Container(
  //                             margin: const EdgeInsets.all(20),
  //                             height: h,
  //                             width: w,
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(30),
  //                               border: Border.all(),
  //                             ),
  //                             child: Column(
  //                               mainAxisAlignment:
  //                                   MainAxisAlignment.spaceBetween,
  //                               children: [
  //                                 Expanded(
  //                                   flex: 2,
  //                                   child: Stack(
  //                                     children: [
  //                                       Container(
  //                                         decoration: BoxDecoration(
  //                                           borderRadius:
  //                                               const BorderRadius.only(
  //                                             topLeft: Radius.circular(30),
  //                                             topRight: Radius.circular(30),
  //                                           ),
  //                                           image: DecorationImage(
  //                                               image: NetworkImage(
  //                                                   e['thumbnail']),
  //                                               fit: BoxFit.cover),
  //                                         ),
  //                                         // child: Image.asset("lib/Assets/Image/monkeybhai.jpg"),
  //                                         // child: Image.network(
  //                                         //   "https://gifdb.com/images/high/goofy-dancing-monkey-ar6ploj3u3zrtlru.gif",
  //                                         //   fit: BoxFit.cover,
  //                                         // ),
  //                                       ),
  //                                       Container(
  //                                         height: 30,
  //                                         width: 60,
  //                                         decoration: const BoxDecoration(
  //                                           color: Color(0xffb71c1c),
  //                                           borderRadius: BorderRadius.only(
  //                                             topLeft: Radius.circular(30),
  //                                             bottomRight: Radius.circular(10),
  //                                           ),
  //                                         ),
  //                                         alignment: Alignment.center,
  //                                         child: Text(
  //                                           "${e['discountPercentage'].toString()}%",
  //                                           style: const TextStyle(
  //                                             color: Colors.white,
  //                                             fontWeight: FontWeight.bold,
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                                 Expanded(
  //                                   child: Container(
  //                                     width: w,
  //                                     decoration: const BoxDecoration(
  //                                       borderRadius: BorderRadius.only(
  //                                         bottomLeft: Radius.circular(30),
  //                                         bottomRight: Radius.circular(30),
  //                                       ),
  //                                     ),
  //                                     child: Padding(
  //                                       padding:
  //                                           const EdgeInsets.only(left: 10),
  //                                       child: Column(
  //                                         mainAxisAlignment:
  //                                             MainAxisAlignment.spaceEvenly,
  //                                         crossAxisAlignment:
  //                                             CrossAxisAlignment.start,
  //                                         children: [
  //                                           Text(
  //                                             e['title'],
  //                                             style: const TextStyle(
  //                                                 fontWeight: FontWeight.w500,
  //                                                 fontSize: 16),
  //                                           ),
  //                                           Text(
  //                                             "\$ ${e['price'].toString()}",
  //                                             style: const TextStyle(
  //                                               fontWeight: FontWeight.bold,
  //                                               fontSize: 16,
  //                                             ),
  //                                           ),
  //                                           RatingBarIndicator(
  //                                             rating: e['rating'].toDouble(),
  //                                             itemBuilder: (context, index) =>
  //                                                 const Icon(
  //                                               Icons.star,
  //                                               color: Colors.amber,
  //                                             ),
  //                                             itemCount: 5,
  //                                             itemSize: 20,
  //                                             direction: Axis.horizontal,
  //                                           ),
  //                                         ],
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                         );
  //                       })
  //                     : SizedBox(
  //                         height: MediaQuery.of(context).size.height,
  //                         width: MediaQuery.of(context).size.width,
  //                         child: const Center(
  //                             child: Text("No range Available........")),
  //                       )
  //                 : Container()).toList()),
  //       ),
  //     ],
  //   );
  // });
}
