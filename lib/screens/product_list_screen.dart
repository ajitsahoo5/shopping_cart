import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/bloc/product_bloc/product_bloc.dart';
import 'package:shopping_cart/services/api_service.dart';
import 'product_details_screen.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List'),),
      body: BlocProvider(
        create: (context) => ProductBloc(ApiService())..add(FetchProductsEvent()),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProductError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is ProductLoaded) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                

                  final product = state.products[index];
                  return ListTile(
                    leading: Image.network(product.image, width: 50, height: 50),
                    title: Text(product.name),
                    subtitle: Text('\$${product.price}'),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsScreen(product: product),
                      ),
                    ),
                  );
                },
              );
            }
            return Center(child: Text('No products available'));
          },
        ),
      ),
    );
  }
}
