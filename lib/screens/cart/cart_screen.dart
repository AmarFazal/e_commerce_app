import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../services/cart_service.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/animated_button.dart';
import '../../utils/constants.dart';
import '../checkout/checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final cartService = Provider.of<CartService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.cart),
      ),
      body: cartService.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    localizations.emptyCart,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    localizations.emptyCartMessage,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  AnimatedButton(
                    text: localizations.continueShopping,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    width: 200,
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(AppConstants.defaultPadding),
                    itemCount: cartService.items.length,
                    itemBuilder: (context, index) {
                      final item = cartService.items[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  imageUrl: item.product.imageUrl,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    width: 80,
                                    height: 80,
                                    color: Colors.grey[300],
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) => Container(
                                    width: 80,
                                    height: 80,
                                    color: Colors.grey[300],
                                    child: const Icon(Icons.error),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.product.name,
                                      style: theme.textTheme.titleSmall?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    if (item.selectedColor != null ||
                                        item.selectedSize != null) ...[
                                      const SizedBox(height: 4),
                                      Text(
                                        [
                                          if (item.selectedColor != null)
                                            '${localizations.selectColor}: ${item.selectedColor}',
                                          if (item.selectedSize != null)
                                            '${localizations.selectSize}: ${item.selectedSize}',
                                        ].join(', '),
                                        style: theme.textTheme.bodySmall?.copyWith(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                    const SizedBox(height: 8),
                                    Text(
                                      '\$${item.product.price.toStringAsFixed(2)}',
                                      style: theme.textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: theme.colorScheme.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.delete_outline),
                                    color: Colors.red,
                                    onPressed: () {
                                      cartService.removeFromCart(
                                        item.product.id,
                                        color: item.selectedColor,
                                        size: item.selectedSize,
                                      );
                                    },
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.remove, size: 18),
                                          onPressed: () {
                                            cartService.updateQuantity(
                                              item.product.id,
                                              item.quantity - 1,
                                              color: item.selectedColor,
                                              size: item.selectedSize,
                                            );
                                          },
                                        ),
                                        Text(
                                          '${item.quantity}',
                                          style: theme.textTheme.bodyMedium,
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.add, size: 18),
                                          onPressed: () {
                                            cartService.updateQuantity(
                                              item.product.id,
                                              item.quantity + 1,
                                              color: item.selectedColor,
                                              size: item.selectedSize,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(AppConstants.defaultPadding),
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, -4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            localizations.subtotal,
                            style: theme.textTheme.titleMedium,
                          ),
                          Text(
                            '\$${cartService.totalPrice.toStringAsFixed(2)}',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            localizations.shipping,
                            style: theme.textTheme.bodyMedium,
                          ),
                          Text(
                            '\$0.00',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            localizations.totalPrice,
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$${cartService.totalPrice.toStringAsFixed(2)}',
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      AnimatedButton(
                        text: localizations.checkout,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CheckoutScreen(),
                            ),
                          );
                        },
                        icon: Icons.payment,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

