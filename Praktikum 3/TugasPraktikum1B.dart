class Mahasiswa {
 String nama;
 int nim;
 String jurusan;
 Mahasiswa(this.nama, this.nim, this.jurusan);
 void tampilkanData() {
 print("Nama    : $nama");
 print("NIM     : $nim");
 print("Jurusan : $jurusan");
 }
}
void main() {
 var m1 = Mahasiswa("Salsabila Rahmadina", 707012400067 , "SIKC");
 m1.tampilkanData();
}
