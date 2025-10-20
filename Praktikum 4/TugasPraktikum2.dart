class RekeningBank {
  double _saldo = 0;

  // Method setor() ditambah validasi agar hanya menerima nilai positif
  void setor(double jumlah) {
    if (jumlah > 0) { // Tambahan validasi
      _saldo += jumlah; // kalau positif, saldo ditambah
    } else {
      print("Jumlah setor harus positif!"); // kalau negatif, beri peringatan
    }
  }

  void tarik(double jumlah) {
    if (_saldo >= jumlah) {
      _saldo -= jumlah;
    } else {
      print("Saldo tidak cukup!");
    }
  }

  double get saldo => _saldo;
}

void main() {
  var r = RekeningBank();
  r.setor(1000); // setor valid
  print("Saldo: ${r.saldo}");

  r.tarik(500); // tarik valid
  print("Saldo: ${r.saldo}");

  r.setor(-200); // contoh setor negatif (akan tampil pesan error)
}