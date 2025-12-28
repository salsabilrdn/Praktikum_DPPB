# Praktikum 13 - Flutter REST API

Aplikasi Flutter dengan 3 halaman yang terintegrasi dengan REST API menggunakan State Management (Cubit/Bloc).

## 📱 Fitur Aplikasi

### 1. **Halaman Utama (HomePage)**
- Menampilkan welcome message
- Menampilkan jumlah posts dari API JSONPlaceholder
- Tombol navigasi ke halaman profil dengan SnackBar
- Menggunakan BLoC untuk state management

### 2. **Halaman Profil (ProfilePage)**
- Menampilkan data user dari REST API
- Informasi: Nama, Username, Email, Phone, Website
- Data diambil dari JSONPlaceholder API
- Loading indicator saat fetch data
- Error handling dengan tombol retry

### 3. **Halaman Pengaturan (SettingsPage)**
- Status koneksi API (online/offline indicator)
- Tombol refresh untuk memperbarui data API
- Tombol logout dengan AlertDialog konfirmasi
- Menampilkan jumlah users yang terload

## 🏗️ Struktur Aplikasi

```
lib/
├── main.dart                 # Entry point aplikasi
├── cubit/
│   ├── page_cubit.dart       # Cubit untuk navigasi halaman
│   ├── user_cubit.dart       # Cubit untuk state management user
│   ├── user_state.dart       # State untuk user data
│   ├── post_cubit.dart       # Cubit untuk state management post
│   └── post_state.dart       # State untuk post data
├── models/
│   ├── user.dart             # Model class User
│   └── post.dart             # Model class Post
├── services/
│   └── api_service.dart      # Service untuk REST API calls
└── pages/
    ├── dashboard_page.dart   # Dashboard dengan bottom navigation
    ├── home_page.dart        # Halaman utama
    ├── profile_page.dart     # Halaman profil
    └── settings_page.dart    # Halaman pengaturan
```

## 🔌 REST API

Aplikasi ini menggunakan **JSONPlaceholder** sebagai REST API:
- Base URL: `https://jsonplaceholder.typicode.com`
- Endpoints yang digunakan:
  - `GET /users` - Mendapatkan daftar users
  - `GET /users/{id}` - Mendapatkan user by ID
  - `GET /posts` - Mendapatkan daftar posts
  - `GET /posts?userId={id}` - Mendapatkan posts by user ID

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  flutter_bloc: ^8.1.6        # State management
  http: ^1.2.2                # HTTP requests
```

## 🚀 Cara Menjalankan

1. **Install dependencies:**
   ```bash
   flutter pub get
   ```

2. **Jalankan aplikasi:**
   ```bash
   flutter run
   ```

3. **Pilih device:**
   - Chrome (Web)
   - Android Emulator
   - iOS Simulator
   - Windows Desktop

## 💡 Fitur State Management

- **Cubit/BLoC Pattern** untuk manajemen state
- **MultiBlocProvider** untuk menyediakan multiple cubits
- **BlocBuilder** untuk rebuild UI berdasarkan state changes
- Separation of concerns: UI, Business Logic, dan Data Layer

## 🎨 UI Features

- **Bottom Navigation Bar** untuk navigasi antar halaman
- **SnackBar** untuk notifikasi user actions
- **AlertDialog** untuk konfirmasi logout
- **Loading Indicators** saat fetch data dari API
- **Error Handling** dengan retry button
- **Responsive Design** dengan Card dan proper spacing
- **Theme Navy Blue** konsisten di seluruh aplikasi

## 📝 Catatan

- Data profil menggunakan user pertama dari API (id: 1)
- Aplikasi menangani error dengan baik (try-catch)
- State management memisahkan UI dari business logic
- Loading state ditampilkan saat fetching data

## 👤 Developer

**Salsabila Rahmadina**
- NIM: 707012400067
- Prodi: D4 Sistem Informasi Kota Cerdas

---

Dibuat untuk memenuhi Tugas Praktikum 13 - Pemrograman Perangkat Bergerak

