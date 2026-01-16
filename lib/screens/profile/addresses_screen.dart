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
    final titleController = TextEditingController();
    final addressController = TextEditingController();
    final cityController = TextEditingController();
    final districtController = TextEditingController();
    final postalController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Address'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title (e.g., Home, Work)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: 'Full Address',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: cityController,
                decoration: const InputDecoration(
                  labelText: 'City',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: districtController,
                decoration: const InputDecoration(
                  labelText: 'District',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: postalController,
                decoration: const InputDecoration(
                  labelText: 'Postal Code',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (titleController.text.isNotEmpty &&
                  addressController.text.isNotEmpty) {
                setState(() {
                  _addresses.add({
                    'id': DateTime.now().millisecondsSinceEpoch.toString(),
                    'title': titleController.text,
                    'fullAddress': addressController.text,
                    'city': cityController.text,
                    'district': districtController.text,
                    'postalCode': postalController.text,
                    'isDefault': _addresses.isEmpty,
                  });
                });
                Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showEditAddressDialog(BuildContext context, Map<String, dynamic> address) {
    final titleController = TextEditingController(text: address['title']);
    final addressController = TextEditingController(text: address['fullAddress']);
    final cityController = TextEditingController(text: address['city']);
    final districtController = TextEditingController(text: address['district']);
    final postalController = TextEditingController(text: address['postalCode']);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Address'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: 'Full Address',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: cityController,
                decoration: const InputDecoration(
                  labelText: 'City',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: districtController,
                decoration: const InputDecoration(
                  labelText: 'District',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: postalController,
                decoration: const InputDecoration(
                  labelText: 'Postal Code',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                final index = _addresses.indexWhere(
                  (a) => a['id'] == address['id'],
                );
                if (index != -1) {
                  _addresses[index] = {
                    ..._addresses[index],
                    'title': titleController.text,
                    'fullAddress': addressController.text,
                    'city': cityController.text,
                    'district': districtController.text,
                    'postalCode': postalController.text,
                  };
                }
              });
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmDialog(BuildContext context, String addressId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Address'),
        content: const Text('Are you sure you want to delete this address?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _addresses.removeWhere((a) => a['id'] == addressId);
              });
              Navigator.pop(context);
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
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
                            onPressed: () {
                              _showEditAddressDialog(context, address);
                            },
                            icon: const Icon(Icons.edit, size: 18),
                            label: Text(localizations.edit),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              _showDeleteConfirmDialog(context, address['id'] as String);
                            },
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

