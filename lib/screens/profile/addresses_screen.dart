import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/animated_card.dart';
import '../../utils/constants.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({super.key});

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  // Sample addresses
  final List<Map<String, dynamic>> _addresses = [
    {
      'id': '1',
      'title': 'Home',
      'fullAddress': '123 Main Street, Apt 4B',
      'city': 'New York',
      'district': 'Manhattan',
      'postalCode': '10001',
      'isDefault': true,
    },
    {
      'id': '2',
      'title': 'Work',
      'fullAddress': '456 Business Ave, Floor 10',
      'city': 'New York',
      'district': 'Brooklyn',
      'postalCode': '11201',
      'isDefault': false,
    },
  ];

  void _showAddAddressDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Address'),
        content: const Text('Address form will be here'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.addresses),
      ),
      body: _addresses.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No Addresses Yet',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              itemCount: _addresses.length,
              itemBuilder: (context, index) {
                final address = _addresses[index];
                return AnimatedCard(
                  onTap: () {},
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: theme.colorScheme.primary,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                address['title'] as String,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          if (address['isDefault'] as bool)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                'Default',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        address['fullAddress'] as String,
                        style: theme.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${address['city']}, ${address['district']} ${address['postalCode']}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.edit, size: 18),
                            label: Text(localizations.edit),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.delete_outline, size: 18),
                            label: Text(
                              localizations.delete,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddAddressDialog,
        icon: const Icon(Icons.add),
        label: const Text('Add Address'),
      ),
    );
  }
}

