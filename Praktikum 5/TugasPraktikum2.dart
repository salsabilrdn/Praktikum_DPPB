void main() {
 print("\n******** PROGRAM DENGAN EXCEPTION HANDLING********\n");
 try {
 int hasil = 9 ~/ 0;
 print("Hasil pembagian = $hasil");
 print("Pernyataan dalam blok try setelah bebas dari exception.");
 } catch (e) {
 print("Exception tertangkap: $e");
 print("Exception terjadi karena pembagian dengan nol.");
 }
 }