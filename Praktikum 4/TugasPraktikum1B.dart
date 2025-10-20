class Kendaraan {
 void jalan() {
 print("Kendaraan sedang berjalan");
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
void main() {
 var motor = Motor();
 motor.jalan(); 
 motor.bunyiMesin(); 
}