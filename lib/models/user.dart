class User {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? avatarUrl;
  final List<Address> addresses;
  final List<String> favoriteProductIds;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.avatarUrl,
    this.addresses = const [],
    this.favoriteProductIds = const [],
  });
}

class Address {
  final String id;
  final String title;
  final String fullAddress;
  final String city;
  final String district;
  final String postalCode;
  final bool isDefault;

  Address({
    required this.id,
    required this.title,
    required this.fullAddress,
    required this.city,
    required this.district,
    required this.postalCode,
    this.isDefault = false,
  });
}

