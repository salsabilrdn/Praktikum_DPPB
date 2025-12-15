import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  // Constructor: Set state awal dengan CartState kosong (const)
  CartCubit() : super(const CartState());

  // Fungsi tambah barang ke keranjang
  void addToCart(Product product) {
    // Buat list baru dari state yang lama, lalu tambahkan produk baru
    final updated = List<Product>.from(state.items)..add(product);
    // Emit state baru dengan list yang sudah diupdate
    emit(state.copyWith(items: updated));
  }

  // Fungsi hapus barang berdasarkan index
  void removeAt(int index) {
    // Buat list baru, hapus item di index tertentu
    final updated = List<Product>.from(state.items)..removeAt(index);
    // Emit state baru
    emit(state.copyWith(items: updated));
  }

  // Fungsi kosongkan keranjang
  void clearCart() {
    // Emit state baru dengan list kosong
    emit(const CartState(items: []));
  }
}