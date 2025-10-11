// Langkah 1 & 2: Membuat abstract class dengan method open()
abstract class Bottle {
  void open();

  // Langkah 4: Factory constructor untuk mengembalikan objek CokeBottle
  factory Bottle() {
    return CokeBottle();
  }
}

// Langkah 3: Implementasi class CokeBottle
class CokeBottle implements Bottle {
  @override
  void open() {
    print("Coke bottle is opened");
  }
}

// Langkah 5: Fungsi utama
void main() {
  var bottle = Bottle(); // Menggunakan factory constructor
  bottle.open();         // Memanggil method open()
}
