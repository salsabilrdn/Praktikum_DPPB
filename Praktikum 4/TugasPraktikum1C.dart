class Kendaraan {
  void jalan() {
    print("Kendaraan sedang berjalan");
  }
}

class Mobil extends Kendaraan {
  void klakson() {
    print("Mobil membunyikan klakson: Tin tin!");
  }
}

class Motor extends Kendaraan {
  @override
  void jalan() {
    print("Motor melaju di jalan raya");
  }

  void bunyiMesin() {
    print("Motor berbunyi: Brummm!");
  }
}

class Pesawat extends Kendaraan {
  @override
  void jalan() {
    print("Pesawat berjalan di landasan");
  }

  void terbang() {
    print("Pesawat mulai terbang di udara");
  }
}

void main() {
  print("=== Kendaraan dan Mobil ===");
  var k = Kendaraan();
  k.jalan();
  var m = Mobil();
  m.jalan();
  m.klakson();

  print("\n=== Motor ===");
  var motor = Motor();
  motor.jalan();
  motor.bunyiMesin();

  print("\n=== Pesawat ===");
  var pesawat = Pesawat();
  pesawat.jalan();
  pesawat.terbang();
}
