class Mahasiswa {
 String nama;
 Mahasiswa(this.nama);
}
class Universitas {
 List<Mahasiswa> daftarMhs = [];
}
class Mesin {
 void nyala() {
 print("Mesin menyala dan siap menjalankan mobil");
 }
}
class Mobil {
 final Mesin mesin = Mesin(); // Komposisi
 void nyalakanMobil() {
 mesin.nyala();
 print("Mobil siap jalan!");
 }
}
void main() {
  print("=== AGREGASI ===");
  Universitas? u = Universitas(); // pakai ? supaya bisa null
  var m1 = Mahasiswa("Sabil");
  var m2 = Mahasiswa("Awa");
  u.daftarMhs.addAll([m1, m2]);
  print("Mahasiswa: ${u.daftarMhs.map((m) => m.nama).toList()}");
  u = null; // sekarang aman
  print("Setelah Universitas dihapus, Mahasiswa tetap ada:");
  print("Nama Mahasiswa: ${m1.nama}, ${m2.nama}");

  print("\n=== KOMPOSISI ===");
  Mobil? mobil = Mobil(); // pakai ? supaya bisa null
  mobil.nyalakanMobil();
  mobil = null; // sekarang aman juga
  print("Jika Mobil dihapus, Mesin di dalamnya juga ikut dianggap tidak berguna.");
}
