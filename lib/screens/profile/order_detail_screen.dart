import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class OrderDetailScreen extends StatelessWidget {
  final Map<String, dynamic> order;

  const OrderDetailScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(order['id'] as String),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order Information',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow('Order ID', order['id'] as String, theme),
                    const SizedBox(height: 8),
                    _buildInfoRow('Date', order['date'] as String, theme),
                    const SizedBox(height: 8),
                    _buildInfoRow('Status', order['status'] as String, theme),
                    const SizedBox(height: 8),
                    _buildInfoRow('Items', '${order['items']}', theme),
                    const SizedBox(height: 8),
                    _buildInfoRow('Total', '\$${(order['total'] as double).toStringAsFixed(2)}', theme),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shipping Address',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '123 Main Street, Apt 4B',
                      style: theme.textTheme.bodyLarge,
                    ),
                    Text(
                      'New York, NY 10001',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: Colors.grey[600],
          ),
        ),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

