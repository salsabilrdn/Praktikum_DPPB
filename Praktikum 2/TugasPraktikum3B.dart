void main() {
  var identitas = {
    'Nama': 'Salsabila Rahmadina',
    'NIM': '707012400067',
    'Kelas': 'SIKC48-01'
  };

  var kampus = {
    1: 'Sistem Informasi Kota Cerdas',
    3: 'tel-U',
    'Kampus': 1
  };

  print(identitas);
  print(kampus);

  // Soal b: Membuat Map baru dari Map lain
  var mhs1 = Map<String, String>.from(
    identitas.map((key, value) => MapEntry(key, value.toString())),
  );
  mhs1['Nama'] = 'Salwa Nafisah';
  mhs1['NIM'] = '707012400112';
  mhs1['Kota'] = 'Bandung';

  var mhs2 = Map<dynamic, String>.from(
    kampus.map((key, value) => MapEntry(key, value.toString())),
  );
  mhs2[2] = 'Fakultas Ilmu Terapan';
  mhs2[218] = 'Telkom University';
  mhs2[18] = 'Kampus Utama';

  print(mhs1);
  print(mhs2);

  //soal c: tidak error
}
