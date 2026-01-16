import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/favorite_service.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/product_card.dart';
import '../../utils/constants.dart';
import '../product/product_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final favoriteService = Provider.of<FavoriteService>(context);
    final favoriteProducts = favoriteService.getFavoriteProducts();

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.favorites),
      ),
      body: favoriteProducts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No Favorites Yet',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Add products to your favorites',
                    style: theme.textTheme.bodyMedium?.copyWith(
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
                childAspectRatio: 0.63,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: favoriteProducts.length,
              itemBuilder: (context, index) {
                final product = favoriteProducts[index];
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

