class Product {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final String brand;
  final String category;
  final double? oldPrice;
  final int discountPercent;
  final double rating;
  final int reviews;
  bool isSelected;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.brand,
    required this.category,
    this.oldPrice,
    this.discountPercent = 0,
    this.rating = 4.0,
    this.reviews = 0,
    this.isSelected = false,
  });
}

