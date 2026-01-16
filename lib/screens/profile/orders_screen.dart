import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/animated_card.dart';
import '../../utils/constants.dart';
import 'order_detail_screen.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);

    // Sample orders data
    final orders = [
      {
        'id': '#ORD-001',
        'date': 'Jan 15, 2024',
        'status': 'Delivered',
        'total': 1299.99,
        'items': 2,
      },
      {
        'id': '#ORD-002',
        'date': 'Jan 10, 2024',
        'status': 'Shipped',
        'total': 399.99,
        'items': 1,
      },
      {
        'id': '#ORD-003',
        'date': 'Jan 5, 2024',
        'status': 'Delivered',
        'total': 249.99,
        'items': 1,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.myOrders),
      ),
      body: orders.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No Orders Yet',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return AnimatedCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderDetailScreen(order: order),
                      ),
                    );
                  },
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            order['id'] as String,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: _getStatusColor(order['status'] as String)
                                  .withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              order['status'] as String,
                              style: TextStyle(
                                color: _getStatusColor(order['status'] as String),
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Date: ${order['date']}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Items: ${order['items']}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '\$${(order['total'] as double).toStringAsFixed(2)}',
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'delivered':
        return Colors.green;
      case 'shipped':
        return Colors.blue;
      case 'processing':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}

