import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/product.dart';
import '../services/favorite_service.dart';
import '../utils/constants.dart';
import '../l10n/app_localizations.dart';
import 'animated_card.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final favoriteService = Provider.of<FavoriteService>(context);
    final isFavorite = favoriteService.isFavorite(product.id);
    
    return AnimatedCard(
      onTap: onTap,
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppConstants.defaultRadius),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: CachedNetworkImage(
                    imageUrl: product.imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.grey[300],
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey[300],
                      child: const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              if (product.isNew)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      localizations.newLabel,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              if (product.hasDiscount)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '-${product.discountPercentage.toInt()}%',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              Positioned(
                bottom: 8,
                right: 8,
                child: GestureDetector(
                  onTap: onFavoriteTap ?? () {
                    favoriteService.toggleFavorite(product.id);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      size: 20,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product.name,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      ...List.generate(
                        5,
                        (index) => Icon(
                          index < product.rating.floor()
                              ? Icons.star
                              : Icons.star_border,
                          size: 12,
                          color: Colors.amber,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          '${product.rating} (${product.reviewCount})',
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 10,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '\$${product.price.toStringAsFixed(2)}',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.primary,
                                fontSize: 15,
                              ),
                            ),
                            if (product.hasDiscount)
                              Text(
                                '\$${product.oldPrice!.toStringAsFixed(2)}',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (product.stock > 0)
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              localizations.inStock,
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

