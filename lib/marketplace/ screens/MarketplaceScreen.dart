import 'package:flutter/material.dart';

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

class MarketplaceScreen extends StatefulWidget {
  @override
  State<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {
  List<Product> allProducts = [
    Product(
      id: '1',
      name: 'Lenovo V30a Business',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSwi5YNEj7W1WXxZ4dHDraUMZwvnV2RJg-dT_z5hcFP4tCJCjxu4imhAXR4zA749FbgQQjizOH7D2GxOKceYXK-ETa2QRxj1eMVrlJ9DG-Uwl1kwfhJgCNu4aI',
      price: 579.00,
      oldPrice: 699.00,
      brand: 'Lenovo',
      category: 'PC',
      discountPercent: 17,
      rating: 4.2,
      reviews: 16,
    ),
    Product(
      id: '2',
      name: 'Acer Chromebook Spin 311',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcS02rJKgRMhX_svV35Nu8KCSxABz-OgeBrHOwzyY3OsY5UchGh0RITjwDVufiZkG5fRITAzcrWEIoZD_1s-1Gus2dd3NDvor0zNa3tzvGk',
      price: 309.99,
      oldPrice: 399.99,
      brand: 'Acer',
      category: 'Laptop',
      discountPercent: 23,
      rating: 4.0,
      reviews: 9,
    ),
    Product(
      id: '3',
      name: 'StarTech.com USB 3.0 Hub',
      imageUrl: 'https://i.imgur.com/5Aqgz7o.png',
      price: 53.81,
      oldPrice: 63.81,
      brand: 'StarTech',
      category: 'Accessories',
      discountPercent: 16,
      rating: 4.5,
      reviews: 11,
    ),
    Product(
      id: '4',
      name: 'Razer Naga Pro Wireless',
      imageUrl: 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRQge4a3FqVjNVUqERC3kq69-WI0nQqBUXQko3eG61uGOlQmPAYsh84BdFmmfjmE6DBE8XcLuV-N2-iywtLSxQrqvEgQIqV8Ff3mSrpwdC31L27-_aPPbba',
      price: 83.74,
      oldPrice: 99.99,
      brand: 'Razer',
      category: 'Accessories',
      discountPercent: 16,
      rating: 4.8,
      reviews: 21,
    ),
  ];

  List<Product> selectedProducts = [];
  String? selectedCategory;
  String? selectedBrand;
  String searchQuery = '';

  List<String> get categories => allProducts.map((p) => p.category).toSet().toList();
  List<String> get brands => allProducts.map((p) => p.brand).toSet().toList();

  void _showProductSelectionModal() async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.85,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          expand: false,
          builder: (context, scrollController) {
            return StatefulBuilder(
              builder: (context, setModalState) {
                List<Product> filtered = allProducts.where((product) {
                  final matchesCategory = selectedCategory == null || product.category == selectedCategory;
                  final matchesBrand = selectedBrand == null || product.brand == selectedBrand;
                  final matchesSearch = searchQuery.isEmpty ||
                      product.name.toLowerCase().contains(searchQuery.toLowerCase());
                  return matchesCategory && matchesBrand && matchesSearch;
                }).toList();

                return CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Select Products',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            // Search bar with shadow
                            Material(
                              elevation: 3,
                              borderRadius: BorderRadius.circular(12),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search by product name/barcode',
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                                  isDense: true,
                                ),
                                onChanged: (val) {
                                  setModalState(() => searchQuery = val);
                                },
                              ),
                            ),
                            SizedBox(height: 12),
                            // Filters with shadow
                            Row(
                              children: [
                                Expanded(
                                  child: Material(
                                    elevation: 3,
                                    borderRadius: BorderRadius.circular(12),
                                    child: DropdownButtonFormField<String>(
                                      value: selectedCategory,
                                      isExpanded: true,
                                      decoration: InputDecoration(
                                        hintText: 'Search',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                      ),
                                      items: [
                                        DropdownMenuItem(value: null, child: Text('All')),
                                        ...categories.map((cat) => DropdownMenuItem(value: cat, child: Text(cat))),
                                      ],
                                      onChanged: (val) {
                                        setModalState(() => selectedCategory = val);
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Material(
                                    elevation: 3,
                                    borderRadius: BorderRadius.circular(12),
                                    child: DropdownButtonFormField<String>(
                                      value: selectedBrand,
                                      isExpanded: true,
                                      decoration: InputDecoration(
                                        hintText: 'Select',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                      ),
                                      items: [
                                        DropdownMenuItem(value: null, child: Text('All')),
                                        ...brands.map((b) => DropdownMenuItem(value: b, child: Text(b))),
                                      ],
                                      onChanged: (val) {
                                        setModalState(() => selectedBrand = val);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                    filtered.isEmpty
                        ? SliverFillRemaining(
                      hasScrollBody: false,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Center(child: Text('No products found.')),
                      ),
                    )
                        : SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                              (context, idx) {
                            final product = filtered[idx];
                            final isSelected = selectedProducts.contains(product);
                            return _buildProductCard(
                              product,
                              isSelected: isSelected,
                              onTap: () {
                                setModalState(() {
                                  if (isSelected) {
                                    selectedProducts.remove(product);
                                  } else {
                                    selectedProducts.add(product);
                                  }
                                });
                                // Show the dialog immediately after selection
                                _showSelectedProductsDialog();
                              },
                            );
                          },
                          childCount: filtered.length,
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 0.65,
                        ),
                      ),
                    ),
                    // Removed the bottom "Save" button
                  ],
                );
              },
            );
          },
        );
      },
    );
    setState(() {});
  }

  void _showSelectedProductsDialog() async {
    if (selectedProducts.isEmpty) return;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            margin: EdgeInsets.only(bottom: 20, left: 8, right: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 16,
                  offset: Offset(0, -4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Bell icon with notification dot
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Icon(Icons.notifications_rounded, size: 48, color: Colors.black),
                      Positioned(
                        right: 2,
                        top: 6,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18),
                  Text(
                    'Products Selected',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black87),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${selectedProducts.length} product${selectedProducts.length > 1 ? 's' : ''} selected.',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'You can save your selection or cancel to clear all.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  SizedBox(height: 28),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              selectedProducts.clear();
                            });
                            Navigator.of(context).pop();
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black,
                            side: BorderSide(color: Colors.black),
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text('Cancel'),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            setState(() {}); // Update the main screen
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text('Save', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    // No need to call setState here as the dialog itself triggers a rebuild when popped.
  }


  @override
  Widget build(BuildContext context) {
    final pureBlack = Colors.black;
    final pureWhite = Colors.white;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: pureBlack,
          title: Text('Marketplace', style: TextStyle(color: pureWhite)),
          elevation: 2,
        ),
        backgroundColor: pureWhite,
        body: Padding(
        padding: const EdgeInsets.all(18.0),
    child: Column(
    children: [
    Container(
    width: double.infinity,
    child: DropdownButtonFormField<String>(
    value: null,
    decoration: InputDecoration(
    filled: true,
    fillColor: Colors.grey[100],
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
    contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
    ),
    hint: Text('Walk In Customer'),
    items: [
    DropdownMenuItem(value: null, child: Text('Walk In Customer')),
    ],
    onChanged: (_) {},
    ),
    ),
    SizedBox(height: 18),
    Expanded(
    child: selectedProducts.isEmpty
    ? Center(
    child: InkWell(
    onTap: _showProductSelectionModal,
    borderRadius: BorderRadius.circular(16),
    child: Container(
    width: double.infinity,
    height: 250,
    decoration: BoxDecoration(
    color: Colors.grey[200],
    borderRadius: BorderRadius.circular(16),
    ),
    child: Center(
    child: Icon(Icons.add, size: 56, color: Colors.black45),
    ),
    ),
    ),
    )
        : ListView(
    children: [
    GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: selectedProducts.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 12,
    crossAxisSpacing: 12,
    childAspectRatio: 0.65,
    ),
    itemBuilder: (context, idx) {
    final product = selectedProducts[idx];
    return _buildProductCard(product, isSelected: false);
    },
    ),
    SizedBox(height: 24),
    Divider(),
    Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
    children: [
    _summaryRow('Sub Total', _calcTotal(selectedProducts)),
    _summaryRow('Tax', 0),
    _summaryRow('Shipping Cost', 0),
      _summaryRow('Discount', 0),
      Divider(),
      _summaryRow('Total', _calcTotal(selectedProducts)),
    ],
    ),
    ),
      Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              child: Text('Shipping'),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              child: Text('Discount'),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 14),
              ),
              child: Text('Place Order', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    ],
    ),
    ),
    ],
    ),
        ),
    );
  }

  Widget _buildProductCard(Product product, {bool isSelected = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 300,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (product.discountPercent > 0)
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.red[400],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '-${product.discountPercent}%',
                            style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      Spacer(),
                      Icon(Icons.favorite_border, color: Colors.grey[400], size: 22),
                    ],
                  ),
                  SizedBox(height: 8),
                  AspectRatio(
                    aspectRatio: 1.1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(product.imageUrl, fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(width: 6),
                      if (product.oldPrice != null)
                        Text(
                          '\$${product.oldPrice!.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 2),
                      Text(
                        product.rating.toStringAsFixed(1),
                        style: TextStyle(fontSize: 13, color: Colors.black87),
                      ),
                      SizedBox(width: 4),
                      Text('(${product.reviews})', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                    ],
                  ),
                ],
              ),
            ),
            if (isSelected)
              Positioned(
                top: 10,
                left: 10,
                child: CircleAvatar(
                  radius: 13,
                  backgroundColor: Colors.black,
                  child: Icon(Icons.check, color: Colors.white, size: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _summaryRow(String label, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black87)),
          Text('\$${value.toStringAsFixed(2)}', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
        ],
      ),
    );
  }

  double _calcTotal(List<Product> products) =>
      products.fold(0, (sum, p) => sum + p.price);
}