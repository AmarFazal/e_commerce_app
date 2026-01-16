class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double? oldPrice;
  final String imageUrl;
  final List<String> images;
  final String category;
  final double rating;
  final int reviewCount;
  final bool isNew;
  final bool isFeatured;
  final int stock;
  final Map<String, String>? specifications;
  final List<String>? colors;
  final List<String>? sizes;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.oldPrice,
    required this.imageUrl,
    required this.images,
    required this.category,
    required this.rating,
    required this.reviewCount,
    this.isNew = false,
    this.isFeatured = false,
    required this.stock,
    this.specifications,
    this.colors,
    this.sizes,
  });

  bool get hasDiscount => oldPrice != null && oldPrice! > price;
  double get discountPercentage => hasDiscount
      ? ((oldPrice! - price) / oldPrice! * 100).roundToDouble()
      : 0.0;
}

