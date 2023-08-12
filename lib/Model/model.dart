import 'dart:async';

import 'package:flutter/cupertino.dart';

class Product {
  final int id;
  final String title;
  final String description;
  final int price;
  final num discountPercentage;
  final num rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });
  factory Product.formMap({required Map data}) {
    final ratingValue = data['rating'];
    double rating;
    if (ratingValue is int) {
      rating = ratingValue.toDouble();
    } else if (ratingValue is double) {
      rating = ratingValue;
    } else {
      rating = 0.0;
    }
    final discountvalue = data['discountPercentage'];
    double discount;
    if (discountvalue is int) {
      discount = discountvalue.toDouble();
    } else if (discountvalue is double) {
      discount = discountvalue;
    } else {
      discount = 0.0;
    }
    return Product(
        id: data['id'],
        title: data['title'],
        description: data['description'],
        price: data['price'],
        discountPercentage: discount,
        rating: rating,
        stock: data['stock'],
        brand: data['brand'],
        category: data['category'],
        thumbnail: data['thumbnail'],
        images: data['images']);
  }
}

class SearchLocation {
  String Location;
  Product? product;
  TextEditingController locationController;

  SearchLocation({
    required this.Location,
    this.product,
    required this.locationController,
  });
}

class ConnectionModel {
  String connectivityStatus;
  StreamSubscription? connectivityStream;

  ConnectionModel({
    required this.connectivityStatus,
    this.connectivityStream,
  });
}
