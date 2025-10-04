void main() {
  var prodi = {
    'Sistem Informasi',
    'Teknologi Rekayasa Multimedia',
    'Sistem Informasi Kota Cerdas',
    'Sistem Informasi',
  };

  Set<String> prodiSet = prodi;

  prodiSet.add("Nama: Salsabila Rahmadina");
  prodiSet.addAll({"Kelas: D4SIKC-48-01", "NIM: 707012400067"});

  print(prodiSet);
}