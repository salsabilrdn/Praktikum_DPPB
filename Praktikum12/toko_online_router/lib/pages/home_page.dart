import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../chart/cart_cubit.dart'; // Pastikan sesuai nama folder kamu (chart atau cart)
import '../chart/cart_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Daftar produk statis
  List<Product> get products => const [
        Product(name: 'Kaos', price: 75000),
        Product(name: 'Celana', price: 150000),
        Product(name: 'Topi', price: 50000),
        Product(name: 'Sepatu', price: 100000),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toko Online'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
          _buildCartIcon(context),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final p = products[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(p.name),
              subtitle: Text('Rp ${p.price}'),
              trailing: ElevatedButton(
                onPressed: () {
                  // Menambahkan produk ke keranjang via Cubit
                  context.read<CartCubit>().addToCart(p);
                  // Menampilkan notifikasi SnackBar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Produk ${p.name} ditambahkan ke keranjang',
                      ),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                child: const Text('Tambah'),
              ),
            ),
          );
        },
      ),
    );
  }

  // Widget untuk membuat ikon keranjang dengan badge notifikasi
  Widget _buildCartIcon(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/cart');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return Stack(
              alignment: Alignment.center,
              children: [
                const Icon(Icons.shopping_cart),
                if (state.totalItems > 0)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 1,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(minWidth: 16),
                      child: Text(
                        state.totalItems.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}