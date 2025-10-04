import 'dart:collection';

void main() {
  String nim = '707012400067';

  Queue<int> antreanNIM = Queue<int>();
  antreanNIM.addAll(nim.split('').map(int.parse));

  print("Antrean NIM:");
  print(antreanNIM.toList()); 

  print("\nKeluarkan antrean NIM satu per satu:");
  while (antreanNIM.isNotEmpty) {
    print(antreanNIM.removeFirst());
  }
}
