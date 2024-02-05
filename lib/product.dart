
//
// import 'package:freezed_annotation/freezed_annotation.dart';
// part 'product.freezed.dart';
// part 'product.g.dart';
//
//
//
// @freezed
// class Product with _$Product {
//     const factory Product({
//     required int id,
//   required String title,
// })= _Product;
//
//   factory Product.fromJson(Map<String, dynamic> json) =>
//       _$ProductFromJson(json);
//
// }

// class Product {
//   final int id;
//   final String title;
//
//   Product ({
//     required this.id,
//     required this.title
// });
//
//   factory Product.fromJson(Map<String, dynamic>json){
//     return Product(
//         id: json['id'],
//         title: json['title']
//     );
//   }
// }