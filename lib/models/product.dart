class Product {
  var price;
  final String id, name, description, image, unit;
  final List<String> subproducts;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.unit,
    required this.subproducts,
  });
}
