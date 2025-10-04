import 'dart:collection';
void main() {
  Queue<String> antrean = Queue<String>();
  antrean.addAll(['Budi', 'Ani', 'Citra']);

  print("Daftar antrean awal:");
  print(antrean);

  antrean.add("Dewi");
  antrean.addFirst("Eko");

  print("Antrean setelah penambahan data:");
  print(antrean);

  // Soal d: antrean NIM dengan elemen terpisah
  Queue<int> antreanNIM = Queue<int>();
  antreanNIM.addAll([1, 2, 3, 4, 5]); // Ganti dengan NIM Anda, misal 12345
  print("Antrean NIM:");
  print(antreanNIM);

  print("Keluarkan antrean NIM satu per satu:");
  while (antreanNIM.isNotEmpty) {
    print(antreanNIM.removeFirst());
  }

}