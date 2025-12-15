class Product {
  final String name;
  final int price;

  const Product({required this.name, required this.price});
}

class CartState {
  final List<Product> items;

  // Constructor dengan nilai default list kosong
  const CartState({this.items = const []});

  // Menghitung total jumlah barang
  int get totalItems => items.length;

  // Menghitung total harga semua barang
  int get totalPrice =>
      items.fold(0, (total, product) => total + product.price);

  // Fungsi untuk membuat salinan state dengan data baru
  CartState copyWith({List<Product>? items}) {
    return CartState(items: items ?? this.items);
  }
}
