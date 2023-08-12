import 'package:ecommerce_flutter_app/Model/Helper/helper.dart';
import 'package:ecommerce_flutter_app/Model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../Provider/Provider.dart';
import '../Utils/myProduct.dart';
import '../Utils/utils.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  String? selectcategory;
  RangeValues rangeValues = const RangeValues(1, 2000);
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Amazon ",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
              size: 25,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 23),
                      child: DropdownButton(
                          value: selectcategory,
                          hint: const Text("Select category..."),
                          items: catagory
                              .map(
                                (e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ),
                              )
                              .toList(),
                          onChanged: (val) {
                            setState(() {
                              selectcategory = val as String?;
                            });
                          }),
                    ),
                    Visibility(
                      visible: selectcategory != null,
                      child: ActionChip(
                        avatar: const Icon(Icons.clear),
                        label: const Text("Clear"),
                        onPressed: () {
                          setState(() {
                            selectcategory = null;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: selectcategory != null,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text("From \n\$ ${rangeValues.start.toInt()}"),
                        Expanded(
                          child: RangeSlider(
                            divisions: 2000,
                            min: 1,
                            max: 2000,
                            values: rangeValues,
                            onChanged: (val) {
                              setState(() {
                                rangeValues = val;
                              });
                            },
                          ),
                        ),
                        Text("From \n\$ ${rangeValues.end.toInt()}"),
                      ],
                    ),
                  ),
                ),
                (selectcategory != null)
                    ? getProduct(
                        category: selectcategory!,
                        displayname: selectcategory!,
                        min: rangeValues.start,
                        max: rangeValues.end,
                        filteredData: filteredData,
                      )
                    : Column(
                        children: [
                          getProduct(
                              category: "smartphones",
                              displayname: "Smart Phones",
                              min: rangeValues.start,
                              max: rangeValues.end,
                              filteredData: filteredData),
                          getProduct(
                              category: "laptops",
                              displayname: "Laptops",
                              min: rangeValues.start,
                              max: rangeValues.end,
                              filteredData: filteredData),
                          getProduct(
                              category: "fragrances",
                              displayname: "Fragrances",
                              min: rangeValues.start,
                              max: rangeValues.end,
                              filteredData: filteredData),
                          getProduct(
                              category: "skincare",
                              displayname: "Skin Care",
                              min: rangeValues.start,
                              max: rangeValues.end,
                              filteredData: filteredData),
                          getProduct(
                              category: "groceries",
                              displayname: "Groceries",
                              min: rangeValues.start,
                              max: rangeValues.end,
                              filteredData: filteredData),
                          getProduct(
                              category: "home-decoration",
                              displayname: "Home Decoration",
                              min: rangeValues.start,
                              max: rangeValues.end,
                              filteredData: filteredData),
                          getProduct(
                              category: "furniture",
                              displayname: "Furniture",
                              min: rangeValues.start,
                              max: rangeValues.end,
                              filteredData: filteredData),
                          getProduct(
                              category: "tops",
                              displayname: "Tops",
                              min: rangeValues.start,
                              max: rangeValues.end,
                              filteredData: filteredData),
                          getProduct(
                              category: "womens-dresses",
                              displayname: "Womens Dresses",
                              min: rangeValues.start,
                              max: rangeValues.end,
                              filteredData: filteredData),
                          getProduct(
                              category: "womens-shoes",
                              displayname: "Womens Shoes",
                              min: rangeValues.start,
                              max: rangeValues.end,
                              filteredData: filteredData),
                          getProduct(
                              category: "mens-shirts",
                              displayname: "Mens Shirts",
                              min: rangeValues.start,
                              max: rangeValues.end,
                              filteredData: filteredData),
                          getProduct(
                              category: "mens-shoes",
                              displayname: "Mens Shoes",
                              min: rangeValues.start,
                              max: rangeValues.end,
                              filteredData: filteredData),
                          getProduct(
                              category: "mens-watches",
                              displayname: "Mens Watches",
                              min: rangeValues.start,
                              max: rangeValues.end,
                              filteredData: filteredData),
                          getProduct(
                              category: "womens-watches",
                              displayname: "Womens Watches",
                              min: rangeValues.start,
                              max: rangeValues.end,
                              filteredData: filteredData),
                        ],
                      )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
