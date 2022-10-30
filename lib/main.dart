import 'package:flutter/material.dart';
import 'package:shoes_app/app_bar.dart';
import 'package:shoes_app/product_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "3D Shoes",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ProductPage(),
    );
  }
}

const blue = Color(0xFF5E72ED);
const appBarTitle = "Shoes";
const productTitle = "Nike Air Force 1 '07";
const productDescription = "With iconic style and legendary comfort, "
    "the AF-1 was made to be worn on repeat. "
    "This iteration puts a fresh spin on the hoops"
    "classic with crisp leather, era-echoing '80s "
    "construction and reflective-design Swoosh logos. ";
const tags = ["SHOES", "FOOTWEAR"];
const webViewUrl = "https://app.vectary.com/p/3lYIQYLTn7AicEiVCPhReG";

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ProductAppBar(
        color: blue,
        text: appBarTitle,
      ),
      body: ProductBody(
        color: blue,
        webViewUrl: webViewUrl,
        title: productTitle,
        tags: tags,
        description: productDescription,
      ),
    );
  }
}
