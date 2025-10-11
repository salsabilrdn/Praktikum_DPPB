class Mahasiswa {
 String nama;
 int nim;
 String jurusan;

 //Contructor
 Mahasiswa(this.nama, this.nim, this.jurusan);

 void tampilkanData() {
 print("Nama    : $nama");
 print("NIM     : $nim");
 print("Jurusan : $jurusan");
 print("");
 }
}
void main() {
var m1 = Mahasiswa("Salsabila Rahmadina", 707012400067 , "SIKC");
var m2 = Mahasiswa("Salwa Nafisah", 707012400112 , "SIKC");
 m1.tampilkanData();
 m2.tampilkanData();
}