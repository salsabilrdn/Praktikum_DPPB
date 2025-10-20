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
void main() {
 var k = Kendaraan();
 k.jalan();
 var m = Mobil();
 m.jalan(); 
 m.klakson();
}
