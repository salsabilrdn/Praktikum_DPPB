// Implementasi: Tebas Tebang Pohon dengan OOP + binary search.

import 'dart:io';

// Enkapsulasi: setiap Tree menyimpan tinggi secara private.
class Tree {
  final int _height;
  Tree(this._height);
  int get height => _height;

  // Mengembalikan panjang kayu yang dihasilkan bila dipotong pada batas x.
  int cutAt(int x) => _height > x ? _height - x : 0;
}

// Agregasi: Forest menyimpan referensi ke banyak Tree.
class Forest {
  final List<Tree> _trees;
  Forest(this._trees);

  // Total kayu yang dihasilkan bila semua pohon dipotong pada batas x.
  int totalWoodAt(int x) {
    var sum = 0;
    for (var t in _trees) {
      sum += t.cutAt(x);
    }
    return sum;
  }

  // Maksimum tinggi di hutan, diperlukan untuk batas atas binary search.
  int maxHeight() {
    var mx = 0;
    for (var t in _trees) {
      if (t.height > mx) mx = t.height;
    }
    return mx;
  }

  // Jumlah total seluruh tinggi (untuk cepat cek impossibility).
  int totalHeights() {
    var s = 0;
    for (var t in _trees) s += t.height;
    return s;
  }
}

// Polimorfisme: abstraksi Cutter.
abstract class Cutter {
  int collect(Forest f, int x);
}

// SimpleCutter: langsung memanfaatkan Forest.totalWoodAt
class SimpleCutter implements Cutter {
  @override
  int collect(Forest f, int x) => f.totalWoodAt(x);
}

// AdvancedCutter menunjukkan komposisi: memiliki Logger internal.
class Logger {
  void log(String msg) {
    // Untuk tugas ini cukup cetak jika diperlukan; biarkan ringkas.
    // print("[LOG] $msg");
  }
}

class AdvancedCutter implements Cutter {
  final Logger _logger =
      Logger(); // komposisi: Logger diciptakan di dalam AdvancedCutter
  @override
  int collect(Forest f, int x) {
    final result = f.totalWoodAt(x);
    _logger.log('collect at $x => $result');
    return result;
  }
}

// Binary search mencari X maksimum sehingga collected >= M.
int findMaxHeight(Forest f, int M, Cutter cutter) {
  if (f.totalWoodAt(0) < M)
    return -1; // bahkan jika potong habis (X=0) tidak cukup
  int low = 0;
  int high = f.maxHeight();
  int ans = -1;
  while (low <= high) {
    int mid = (low + high) >> 1;
    int collected = cutter.collect(f, mid);
    if (collected >= M) {
      ans = mid; // mid valid, coba naikkan batas
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }
  return ans;
}

void main() {
  // Interactive-friendly input:
  // 1) baca baris pertama yang mengandung N dan M
  // 2) kemudian baca baris/garis tambahan sampai kita punya N angka tinggi
  final first = stdin.readLineSync();
  if (first == null) return;
  final header = first.trim();
  if (header.isEmpty) return;
  final headerParts = header.split(RegExp(r'\s+'));
  if (headerParts.length < 2) return;
  final N = int.parse(headerParts[0]);
  final M = int.parse(headerParts[1]);

  final heights = <int>[];
  // Jika baris header sudah mengandung beberapa tinggi setelah N and M
  if (headerParts.length > 2) {
    for (var i = 2; i < headerParts.length && heights.length < N; i++) {
      heights.add(int.parse(headerParts[i]));
    }
  }

  while (heights.length < N) {
    final line = stdin.readLineSync();
    if (line == null) break; // EOF
    final parts = line.trim().split(RegExp(r'\s+'));
    for (var p in parts) {
      if (p.isEmpty) continue;
      heights.add(int.parse(p));
      if (heights.length >= N) break;
    }
  }
  if (heights.length < N) return; // not enough data

  // Buat objek Tree dan Forest (agregasi)
  final trees = heights.map((h) => Tree(h)).toList();
  final forest = Forest(trees);

  // Pilih cutter (polimorfisme): bisa diganti ke AdvancedCutter
  final Cutter cutter = SimpleCutter();

  final result = findMaxHeight(forest, M, cutter);
  print(result);
}