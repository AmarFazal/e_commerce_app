import '../models/product.dart';
import '../models/category.dart';

class ProductService {
  static final List<Category> categories = [
    Category(id: '1', name: 'Electronics', icon: '📱', productCount: 45),
    Category(id: '2', name: 'Fashion', icon: '👕', productCount: 120),
    Category(id: '3', name: 'Home', icon: '🏠', productCount: 80),
    Category(id: '4', name: 'Sports', icon: '⚽', productCount: 60),
    Category(id: '5', name: 'Books', icon: '📚', productCount: 35),
    Category(id: '6', name: 'Beauty', icon: '💄', productCount: 50),
    Category(id: '7', name: 'Toys', icon: '🧸', productCount: 40),
    Category(id: '8', name: 'Food', icon: '🍔', productCount: 25),
  ];

  static List<Product> getProducts() {
    return [
      Product(
        id: '1',
        name: 'iPhone 15 Pro Max',
        description: 'Latest iPhone with A17 Pro chip, titanium design, and advanced camera system. Experience the future of smartphones.',
        price: 1299.99,
        oldPrice: 1499.99,
        imageUrl: 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=500',
        images: [
          'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=500',
          'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=500',
          'https://images.unsplash.com/photo-1580910051074-3eb694886505?w=500',
        ],
        category: 'Electronics',
        rating: 4.8,
        reviewCount: 1250,
        isNew: true,
        isFeatured: true,
        stock: 50,
        colors: ['Natural Titanium', 'Blue Titanium', 'White Titanium', 'Black Titanium'],
        specifications: {
          'Display': '6.7" Super Retina XDR',
          'Chip': 'A17 Pro',
          'Storage': '256GB',
          'Camera': '48MP Main + 12MP Ultra Wide',
        },
      ),
      Product(
        id: '2',
        name: 'Samsung Galaxy S24 Ultra',
        description: 'Premium Android flagship with S Pen, 200MP camera, and AI-powered features. The ultimate productivity device.',
        price: 1199.99,
        imageUrl: 'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=500',
        images: [
          'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=500',
          'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?w=500',
        ],
        category: 'Electronics',
        rating: 4.7,
        reviewCount: 980,
        isNew: true,
        isFeatured: true,
        stock: 35,
        colors: ['Titanium Black', 'Titanium Gray', 'Titanium Violet'],
        specifications: {
          'Display': '6.8" Dynamic AMOLED 2X',
          'Chip': 'Snapdragon 8 Gen 3',
          'Storage': '256GB',
          'Camera': '200MP Main',
        },
      ),
      Product(
        id: '3',
        name: 'Nike Air Max 270',
        description: 'Comfortable running shoes with Air Max cushioning. Perfect for daily runs and casual wear.',
        price: 129.99,
        oldPrice: 159.99,
        imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500',
        images: [
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500',
          'https://images.unsplash.com/photo-1460353581641-37baddab0fa2?w=500',
        ],
        category: 'Sports',
        rating: 4.6,
        reviewCount: 450,
        isFeatured: true,
        stock: 100,
        sizes: ['38', '39', '40', '41', '42', '43', '44', '45'],
        colors: ['Black/White', 'White/Blue', 'Gray/Orange'],
      ),
      Product(
        id: '4',
        name: 'MacBook Pro 16" M3',
        description: 'Powerful laptop for professionals. M3 chip, 16GB RAM, stunning Liquid Retina XDR display.',
        price: 2499.99,
        imageUrl: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=500',
        images: [
          'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=500',
          'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=500',
        ],
        category: 'Electronics',
        rating: 4.9,
        reviewCount: 320,
        isNew: true,
        isFeatured: true,
        stock: 20,
        specifications: {
          'Display': '16.2" Liquid Retina XDR',
          'Chip': 'Apple M3 Pro',
          'RAM': '18GB',
          'Storage': '512GB SSD',
        },
      ),
      Product(
        id: '5',
        name: 'Sony WH-1000XM5 Headphones',
        description: 'Industry-leading noise cancellation with exceptional sound quality. Premium comfort for long listening sessions.',
        price: 399.99,
        oldPrice: 449.99,
        imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500',
        images: [
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500',
          'https://images.unsplash.com/photo-1484704849700-f032a568e944?w=500',
        ],
        category: 'Electronics',
        rating: 4.8,
        reviewCount: 890,
        isFeatured: true,
        stock: 75,
        colors: ['Black', 'Silver'],
      ),
      Product(
        id: '6',
        name: 'Designer Leather Jacket',
        description: 'Premium genuine leather jacket with modern design. Perfect for any occasion.',
        price: 299.99,
        imageUrl: 'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=500',
        images: [
          'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=500',
          'https://images.unsplash.com/photo-1591047139829-d91aecb6caea?w=500',
        ],
        category: 'Fashion',
        rating: 4.5,
        reviewCount: 210,
        stock: 30,
        sizes: ['S', 'M', 'L', 'XL', 'XXL'],
        colors: ['Black', 'Brown', 'Navy'],
      ),
      Product(
        id: '7',
        name: 'Smart Watch Pro',
        description: 'Advanced fitness tracking, heart rate monitoring, and smartphone connectivity. Your health companion.',
        price: 249.99,
        oldPrice: 299.99,
        imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500',
        images: [
          'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500',
          'https://images.unsplash.com/photo-1434493789847-2f02dc6ca35d?w=500',
        ],
        category: 'Electronics',
        rating: 4.6,
        reviewCount: 560,
        isNew: true,
        stock: 60,
        colors: ['Black', 'Silver', 'Rose Gold'],
      ),
      Product(
        id: '8',
        name: 'Wireless Earbuds Pro',
        description: 'Crystal clear sound with active noise cancellation. Perfect for music lovers and professionals.',
        price: 179.99,
        imageUrl: 'https://images.unsplash.com/photo-1590658268037-6bf12165a8df?w=500',
        images: [
          'https://images.unsplash.com/photo-1590658268037-6bf12165a8df?w=500',
        ],
        category: 'Electronics',
        rating: 4.7,
        reviewCount: 720,
        isNew: true,
        stock: 90,
        colors: ['White', 'Black'],
      ),
      Product(
        id: '9',
        name: 'Gaming Laptop RTX 4080',
        description: 'High-performance gaming laptop with RTX 4080 GPU. Dominate every game at max settings.',
        price: 1999.99,
        imageUrl: 'https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=500',
        images: [
          'https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=500',
          'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=500',
        ],
        category: 'Electronics',
        rating: 4.8,
        reviewCount: 180,
        isFeatured: true,
        stock: 15,
        specifications: {
          'Display': '15.6" QHD 165Hz',
          'GPU': 'RTX 4080',
          'CPU': 'Intel i9-13900HX',
          'RAM': '32GB DDR5',
        },
      ),
      Product(
        id: '10',
        name: 'Premium Coffee Maker',
        description: 'Professional-grade coffee maker with multiple brewing options. Start your day right.',
        price: 199.99,
        imageUrl: 'https://images.unsplash.com/photo-1517487881594-2787fef5ebf7?w=500',
        images: [
          'https://images.unsplash.com/photo-1517487881594-2787fef5ebf7?w=500',
        ],
        category: 'Home',
        rating: 4.5,
        reviewCount: 340,
        stock: 45,
        colors: ['Black', 'Stainless Steel'],
      ),
      Product(
        id: '11',
        name: 'Yoga Mat Premium',
        description: 'Eco-friendly yoga mat with superior grip and cushioning. Perfect for all yoga practices.',
        price: 49.99,
        oldPrice: 69.99,
        imageUrl: 'https://images.unsplash.com/photo-1601925260368-ae2f83d34dc0?w=500',
        images: [
          'https://images.unsplash.com/photo-1601925260368-ae2f83d34dc0?w=500',
        ],
        category: 'Sports',
        rating: 4.6,
        reviewCount: 280,
        stock: 120,
        colors: ['Purple', 'Blue', 'Pink', 'Green'],
      ),
      Product(
        id: '12',
        name: 'Designer Sunglasses',
        description: 'Stylish UV protection sunglasses with polarized lenses. Look good while protecting your eyes.',
        price: 89.99,
        imageUrl: 'https://images.unsplash.com/photo-1511499767150-a48a237f0083?w=500',
        images: [
          'https://images.unsplash.com/photo-1511499767150-a48a237f0083?w=500',
        ],
        category: 'Fashion',
        rating: 4.4,
        reviewCount: 190,
        stock: 80,
        colors: ['Black', 'Brown', 'Blue'],
      ),
    ];
  }

  static List<Product> getFeaturedProducts() {
    return getProducts().where((p) => p.isFeatured).toList();
  }

  static List<Product> getNewProducts() {
    return getProducts().where((p) => p.isNew).toList();
  }

  static List<Product> getProductsByCategory(String category) {
    return getProducts().where((p) => p.category == category).toList();
  }

  static Product? getProductById(String id) {
    try {
      return getProducts().firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }
}

