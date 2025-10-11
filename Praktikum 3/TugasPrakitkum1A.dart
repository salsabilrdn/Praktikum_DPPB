class Mahasiswa {
 String? nama;
 int? nim;
 String? jurusan;
 // Method untuk menampilkan data
 void tampilkanData() {
 print("Nama    : $nama");
 print("NIM     : $nim");
 print("Jurusan : $jurusan");
 }
}
void main() {
 var m1 = Mahasiswa();
 m1.nama = "Salsabila Rahmadina";
 m1.nim = 707012400067;
 m1.jurusan = "SIKC";
 // Memanggil method untuk print
 m1.tampilkanData();
}