import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/product_service.dart';
import '../../services/favorite_service.dart';
import '../../models/category.dart';
import '../../widgets/product_card.dart';
import '../../utils/constants.dart';
import '../product/product_detail_screen.dart';

class CategoryProductsScreen extends StatelessWidget {
  final Category category;

  const CategoryProductsScreen({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final products = ProductService.getProductsByCategory(category.name);

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: products.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    category.icon,
                    style: const TextStyle(fontSize: 64),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No products in this category',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.62,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                final favoriteService = Provider.of<FavoriteService>(context);
                return ProductCard(
                  product: product,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(product: product),
                      ),
                    );
                  },
                  onFavoriteTap: () {
                    favoriteService.toggleFavorite(product.id);
                  },
                );
              },
            ),
    );
  }
}

