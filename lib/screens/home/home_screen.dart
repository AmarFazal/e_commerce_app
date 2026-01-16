import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../services/cart_service.dart';
import '../../services/product_service.dart';
import '../../services/favorite_service.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/product_card.dart';
import '../../widgets/animated_card.dart';
import '../../utils/constants.dart';
import '../product/product_detail_screen.dart';
import '../category/category_products_screen.dart';
import '../products/all_products_screen.dart';
import '../cart/cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _bannerController = PageController();

  final List<Map<String, dynamic>> _banners = [
    {
      'title': 'New Collection',
      'subtitle': 'Up to 50% Off',
      'image': 'https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=800',
      'color': Colors.blue,
    },
    {
      'title': 'Summer Sale',
      'subtitle': 'Best Deals Ever',
      'image': 'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=800',
      'color': Colors.orange,
    },
    {
      'title': 'Premium Quality',
      'subtitle': 'Shop Now',
      'image': 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800',
      'color': Colors.purple,
    },
  ];

  @override
  void dispose() {
    _bannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final cartService = Provider.of<CartService>(context);
    final featuredProducts = ProductService.getFeaturedProducts();
    final newProducts = ProductService.getNewProducts();
    final categories = ProductService.categories;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                localizations.appName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),
            actions: [
              IconButton(
                icon: Stack(
                  children: [
                    const Icon(Icons.shopping_cart_outlined),
                    if (cartService.itemCount > 0)
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            '${cartService.itemCount}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Banner Slider
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    controller: _bannerController,
                    itemCount: _banners.length,
                    itemBuilder: (context, index) {
                      final banner = _banners[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              CachedNetworkImage(
                                imageUrl: banner['image'],
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Container(
                                  color: banner['color'],
                                ),
                                errorWidget: (context, url, error) => Container(
                                  color: banner['color'],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.black.withOpacity(0.5),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 24,
                                bottom: 24,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      banner['title'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      banner['subtitle'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: SmoothPageIndicator(
                    controller: _bannerController,
                    count: _banners.length,
                    effect: WormEffect(
                      dotColor: Colors.grey[300]!,
                      activeDotColor: theme.colorScheme.primary,
                      dotHeight: 8,
                      dotWidth: 8,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Categories
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        localizations.categoriesTitle,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllProductsScreen(
                                title: localizations.categoriesTitle,
                                products: ProductService.getProducts(),
                              ),
                            ),
                          );
                        },
                        child: Text(localizations.seeAll),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 110,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return Container(
                        width: 90,
                        margin: const EdgeInsets.only(right: 12),
                        child: AnimatedCard(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryProductsScreen(category: category),
                              ),
                            );
                          },
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                category.icon,
                                style: const TextStyle(fontSize: 28),
                              ),
                              const SizedBox(height: 6),
                              Flexible(
                                child: Text(
                                  category.name,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    fontSize: 11,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
                // Featured Products
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        localizations.featured,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllProductsScreen(
                                title: localizations.categoriesTitle,
                                products: ProductService.getProducts(),
                              ),
                            ),
                          );
                        },
                        child: Text(localizations.seeAll),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 320,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: featuredProducts.length,
                    itemBuilder: (context, index) {
                      final product = featuredProducts[index];
                      final favoriteService = Provider.of<FavoriteService>(context);
                      return SizedBox(
                        width: 180,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: ProductCard(
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
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
                // New Arrivals
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        localizations.newArrivals,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllProductsScreen(
                                title: localizations.categoriesTitle,
                                products: ProductService.getProducts(),
                              ),
                            ),
                          );
                        },
                        child: Text(localizations.seeAll),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.62,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: newProducts.length > 4 ? 4 : newProducts.length,
                    itemBuilder: (context, index) {
                      final product = newProducts[index];
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
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

