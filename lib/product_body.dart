import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProductText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  const ProductText({
    Key? key,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 8.0,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

class Tags extends StatelessWidget {
  final List<String> tags;
  final Color bgColor;

  const Tags({
    Key? key,
    required this.tags,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          ...tags.map(
            (tag) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Chip(
                label: Text(
                  tag,
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: bgColor.withOpacity(0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({Key? key}) : super(key: key);

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 1;

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() => quantity -= 1);
    }
  }

  void increaseQuantity() {
    setState(() => quantity += 1);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          const Text(
            "Quantity",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: decreaseQuantity,
            icon: const Icon(Icons.remove),
          ),
          Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(
                width: 1.0,
                color: Colors.grey.withOpacity(0.3),
              ),
            ),
            child: Center(
              child: Text(quantity.toString()),
            ),
          ),
          IconButton(
            onPressed: increaseQuantity,
            icon: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}

class PurchaseButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPurchaseHandler;

  const PurchaseButton({
    required this.color,
    required this.onPurchaseHandler,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPurchaseHandler,
        child: Container(
          height: 60.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: color,
          ),
          child: const Center(
            child: Text(
              "PURCHASE",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductBody extends StatelessWidget {
  final Color color;
  final String webViewUrl;
  final String title;
  final List<String> tags;
  final String description;

  const ProductBody({
    Key? key,
    required this.color,
    required this.webViewUrl,
    required this.title,
    required this.tags,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 450.0,
            child: WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: webViewUrl,
            ),
          ),
          ProductText(
            text: title,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          Tags(tags: tags, bgColor: color),
          ProductText(text: description),
          const QuantitySelector(),
          PurchaseButton(
            color: color,
            onPurchaseHandler: () {},
          ),
        ],
      ),
    );
  }
}
