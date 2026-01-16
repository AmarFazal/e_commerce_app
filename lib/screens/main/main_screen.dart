import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home/home_screen.dart';
import '../search/search_screen.dart';
import '../cart/cart_screen.dart';
import '../profile/profile_screen.dart';
import '../../services/cart_service.dart';
import '../../l10n/app_localizations.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final cartService = Provider.of<CartService>(context);

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: theme.colorScheme.primary,
            unselectedItemColor: Colors.grey[600],
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _currentIndex == 0
                        ? theme.colorScheme.primary.withOpacity(0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    _currentIndex == 0 ? Icons.home : Icons.home_outlined,
                    size: 24,
                  ),
                ),
                label: localizations.home,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _currentIndex == 1
                        ? theme.colorScheme.primary.withOpacity(0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    _currentIndex == 1 ? Icons.search : Icons.search_outlined,
                    size: 24,
                  ),
                ),
                label: localizations.search,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _currentIndex == 2
                        ? theme.colorScheme.primary.withOpacity(0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    children: [
                      Icon(
                        _currentIndex == 2
                            ? Icons.shopping_cart
                            : Icons.shopping_cart_outlined,
                        size: 24,
                      ),
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
                              '${cartService.itemCount > 99 ? '99+' : cartService.itemCount}',
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
                ),
                label: localizations.cart,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _currentIndex == 3
                        ? theme.colorScheme.primary.withOpacity(0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    _currentIndex == 3 ? Icons.person : Icons.person_outline,
                    size: 24,
                  ),
                ),
                label: localizations.profile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

