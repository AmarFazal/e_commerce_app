import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/favorite_service.dart';
import '../../widgets/product_card.dart';
import '../../utils/constants.dart';
import '../product/product_detail_screen.dart';

class AllProductsScreen extends StatelessWidget {
  final String title;
  final List products;

  const AllProductsScreen({
    super.key,
    required this.title,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: products.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No products found',
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

