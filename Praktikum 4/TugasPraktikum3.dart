class Pegawai {
  void kerja() {
    print("Pegawai bekerja agar menarik dan mudah digunakan");
  }
}

class Programmer extends Pegawai {
  @override
  void kerja() {
    print("Programmer menulis kode program untuk aplikasi");
  }
}

class Designer extends Pegawai {
  @override
  void kerja() {
    print("Designer membuat UI/UX agar menarik dan mudah digunakan");
  }
}

class Manager extends Pegawai { //Menambhakan kelas Manager
  @override
  void kerja() {
    print("Manager mengatur tim agar proyek berjalan lancar");
  }
}

void main() {
  List<Pegawai> daftar = [Programmer(), Designer(), Pegawai(), Manager()];
  for (var p in daftar) {
    p.kerja();
  }
}
