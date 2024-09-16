import 'package:flutter/material.dart';
import 'package:shopping_cart/models/product.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.name),actions: [IconButton(onPressed: (){
        setState(() {
          widget.product.isFavorite = !widget.product.isFavorite;
        });
      }, icon: Icon(Icons.favorite, color: widget.product.isFavorite?Colors.red:Colors.grey,))]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(widget.product.image, width: double.infinity, height: 200, fit: BoxFit.fitHeight,),
          SizedBox(height: 16),
          Text(widget.product.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('\$${widget.product.price.toStringAsFixed(2)}', style: TextStyle(fontSize: 20),),
          SizedBox(height: 16),
          Text(widget.product.description),
          // Spacer(),
          // ElevatedButton(onPressed: (){}, child: Text('Mark as Favorite'),
          // )
        ],
      ),
    );
  }
}