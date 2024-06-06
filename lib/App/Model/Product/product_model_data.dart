class Product {
  final int id;
  final String name;
  final String slug;
  final String permalink;
  final String dateCreated;
  final String dateModified;
  final String type;
  final String status;
  final bool featured;
  final String price;
  final String regularPrice;
  final String salePrice;
  final bool onSale;
  final int totalSales;
  final bool inStock;
  final String averageRating;
  final int ratingCount;
  final List<int> relatedIds;
  final String imageUrl;
  final String storeName;
  final String storeUrl;
  final String storeAvatar;

  Product({
    required this.id,
    required this.name,
    required this.slug,
    required this.permalink,
    required this.dateCreated,
    required this.dateModified,
    required this.type,
    required this.status,
    required this.featured,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.onSale,
    required this.totalSales,
    required this.inStock,
    required this.averageRating,
    required this.ratingCount,
    required this.relatedIds,
    required this.imageUrl,
    required this.storeName,
    required this.storeUrl,
    required this.storeAvatar,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      permalink: json['permalink'],
      dateCreated: json['date_created'],
      dateModified: json['date_modified'],
      type: json['type'],
      status: json['status'],
      featured: json['featured'],
      price: json['price'],
      regularPrice: json['regular_price'],
      salePrice: json['sale_price'],
      onSale: json['on_sale'],
      totalSales: json['total_sales'],
      inStock: json['in_stock'],
      averageRating: json['average_rating'],
      ratingCount: json['rating_count'],
      relatedIds: List<int>.from(json['related_ids']),
      imageUrl: json['images'][0]['src'],
      storeName: json['store']['name'],
      storeUrl: json['store']['url'],
      storeAvatar: json['store']['avatar'],
    );
  }
}
