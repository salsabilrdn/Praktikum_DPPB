class Mobil {
  String merk;
  String warna;
  int kecepatan;

  // Constructor
  Mobil(this.merk, this.warna, this.kecepatan);

  // Method jalan
  void jalan() {
    print("Mobil $merk melaju dengan kecepatan $kecepatan km/jam");
  }

  // (a) Method ubahKecepatan
  void ubahKecepatan(int nilai) {
    if (nilai >= 0) {
      kecepatan = nilai;
      print("Kecepatan mobil $merk diubah menjadi $kecepatan km/jam");
    } else {
      print("Error: Kecepatan tidak boleh bernilai negatif!");
    }
  }

  // (b) Method berhenti
  void berhenti() {
    kecepatan = 0;
    print("Mobil $merk berhenti.");
  }
}

void main() {
  // (c) Membuat 2 objek mobil
  var mobil1 = Mobil("Toyota", "Merah", 100);
  var mobil2 = Mobil("Honda", "Hitam", 80);

  print("=== Uji Mobil 1 ===");
  mobil1.jalan();
  mobil1.ubahKecepatan(150); // ubah kecepatan ke nilai positif
  mobil1.ubahKecepatan(-30); // input negatif (error)
  mobil1.berhenti();

  print("\n=== Uji Mobil 2 ===");
  mobil2.jalan();
  mobil2.ubahKecepatan(120); // ubah kecepatan ke nilai baru
  mobil2.berhenti();
}