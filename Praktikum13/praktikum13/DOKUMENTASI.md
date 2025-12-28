# 📚 Dokumentasi Lengkap Praktikum 13

## Overview
Aplikasi Flutter ini mendemonstrasikan integrasi REST API dengan State Management menggunakan Cubit/BLoC pattern.

---

## 🔧 Penjelasan Setiap Komponen

### 1. Models (lib/models/)

#### **user.dart**
```dart
class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
}
```
- Model untuk merepresentasikan data User dari API
- Method `fromJson()` untuk parsing JSON dari API
- Method `toJson()` untuk convert object ke JSON

#### **post.dart**
```dart
class Post {
  final int id;
  final int userId;
  final String title;
  final String body;
}
```
- Model untuk merepresentasikan data Post dari API
- Memiliki method serialization sama seperti User

---

### 2. Services (lib/services/)

#### **api_service.dart**
Service layer untuk komunikasi dengan REST API:

**Methods:**
- `getUsers()` - Fetch semua users
- `getUserById(int id)` - Fetch user by ID
- `getPosts()` - Fetch semua posts
- `getPostsByUserId(int userId)` - Fetch posts by user ID

**Error Handling:**
- Try-catch untuk menangkap exceptions
- Status code checking (200 = success)
- Throw Exception dengan pesan error

---

### 3. Cubit/State Management (lib/cubit/)

#### **page_cubit.dart**
- Simple cubit untuk menghandle navigation antar halaman
- State: integer (0, 1, 2) untuk index halaman

#### **user_cubit.dart & user_state.dart**
**States:**
- `UserInitial` - State awal
- `UserLoading` - Sedang fetch data
- `UserLoaded` - Data berhasil diload
- `UserError` - Terjadi error

**Methods:**
- `fetchUsers()` - Memanggil API untuk fetch users

#### **post_cubit.dart & post_state.dart**
**States:**
- `PostInitial` - State awal
- `PostLoading` - Sedang fetch data
- `PostLoaded` - Data berhasil diload
- `PostError` - Terjadi error

**Methods:**
- `fetchPosts()` - Fetch semua posts
- `fetchPostsByUserId(int userId)` - Fetch posts by user

---

### 4. Pages (lib/pages/)

#### **dashboard_page.dart**
- Container utama dengan BottomNavigationBar
- Menggunakan `BlocBuilder<PageCubit, int>` untuk listen page changes
- Menampilkan page sesuai dengan currentIndex

#### **home_page.dart**
- Menampilkan welcome message
- Fetch posts dari API menggunakan `PostCubit`
- Menampilkan jumlah posts yang berhasil diload
- Button navigasi ke ProfilePage dengan SnackBar

**BLoC Integration:**
```dart
context.read<PostCubit>().fetchPosts();  // Trigger fetch
BlocBuilder<PostState>()                  // Listen state changes
```

#### **profile_page.dart**
- Menampilkan data user dari API
- Fetch users menggunakan `UserCubit`
- Loading indicator saat fetch
- Error handling dengan retry button
- Display user info dalam Card dengan icons

**Features:**
- CircleAvatar untuk profile picture
- ListTile style untuk menampilkan info
- Retry button jika error

#### **settings_page.dart**
- Menampilkan status koneksi API
- Indikator online/offline berdasarkan UserState
- Refresh button untuk fetch ulang data
- Logout button dengan AlertDialog

**API Status Indicator:**
- 🟢 Green: API connected (UserLoaded)
- 🟠 Orange: Connecting (UserLoading)
- 🔴 Red: Disconnected (Error/Initial)

---

### 5. Main App (lib/main.dart)

#### **MultiBlocProvider**
```dart
MultiBlocProvider(
  providers: [
    BlocProvider(create: (_) => PageCubit()),
    BlocProvider(create: (_) => UserCubit(ApiService())),
    BlocProvider(create: (_) => PostCubit(ApiService())),
  ],
  child: const MyApp(),
)
```
- Menyediakan multiple cubits ke seluruh widget tree
- ApiService di-inject ke UserCubit dan PostCubit

#### **Theme**
```dart
theme: ThemeData(
  primaryColor: const Color(0xFF0A1E3F),  // Navy Blue
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF0A1E3F),
    foregroundColor: Colors.white,
  ),
)
```

---

## 🔄 Flow Aplikasi

### 1. **App Startup**
```
main() 
  → MultiBlocProvider created
  → All Cubits initialized
  → MyApp builds
  → MaterialApp with DashboardPage as home
```

### 2. **HomePage Flow**
```
HomePage builds
  → context.read<PostCubit>().fetchPosts()
  → PostCubit emits PostLoading
  → BlocBuilder rebuilds with loading indicator
  → API call completes
  → PostCubit emits PostLoaded(posts)
  → BlocBuilder rebuilds with data
```

### 3. **ProfilePage Flow**
```
User clicks Profil tab
  → PageCubit.changePage(1)
  → DashboardPage rebuilds with ProfilePage
  → ProfilePage builds
  → context.read<UserCubit>().fetchUsers()
  → Similar flow to HomePage
```

### 4. **SettingsPage Flow**
```
User clicks Settings tab
  → PageCubit.changePage(2)
  → DashboardPage rebuilds with SettingsPage
  → SettingsPage listens to UserState
  → Displays API status based on state
```

---

## 📊 State Management Pattern

### **Cubit Pattern:**
```
User Action 
  → Call Cubit method
  → Cubit emits Loading state
  → API Service called
  → Success: emit Loaded state
  → Error: emit Error state
  → BlocBuilder rebuilds UI
```

### **Benefits:**
✅ Separation of concerns (UI vs Logic)
✅ Testable business logic
✅ Reactive UI updates
✅ Centralized state management
✅ Easy error handling

---

## 🌐 API Integration

### **JSONPlaceholder API:**
- Free fake REST API for testing
- No authentication required
- Returns realistic data

### **Endpoints Used:**
```
GET https://jsonplaceholder.typicode.com/users
    → Returns array of 10 users

GET https://jsonplaceholder.typicode.com/posts
    → Returns array of 100 posts

GET https://jsonplaceholder.typicode.com/posts?userId=1
    → Returns posts filtered by user
```

### **Response Format:**
**User:**
```json
{
  "id": 1,
  "name": "Leanne Graham",
  "username": "Bret",
  "email": "Sincere@april.biz",
  "phone": "1-770-736-8031 x56442",
  "website": "hildegard.org"
}
```

**Post:**
```json
{
  "userId": 1,
  "id": 1,
  "title": "sunt aut facere...",
  "body": "quia et suscipit..."
}
```

---

## 🎯 Key Concepts

### 1. **BLoC Pattern**
- Business Logic Component
- Separates UI from business logic
- Uses streams for state management

### 2. **Cubit (Simplified BLoC)**
- Lighter alternative to BLoC
- Uses methods instead of events
- Simpler API, easier to learn

### 3. **Reactive Programming**
- UI reacts to state changes
- BlocBuilder listens to stream
- Automatic UI updates

### 4. **Dependency Injection**
- ApiService injected to Cubits
- Makes testing easier
- Loose coupling

---

## 🚀 Cara Testing

### **Test HomePage:**
1. Buka aplikasi
2. Lihat loading indicator (sebentar)
3. Pastikan jumlah posts (100) muncul
4. Click "Menuju Profil"
5. Pastikan SnackBar muncul

### **Test ProfilePage:**
1. Click tab "Profil"
2. Lihat loading indicator
3. Pastikan data user "Leanne Graham" muncul
4. Check semua field (name, email, phone, etc)

### **Test SettingsPage:**
1. Click tab "Pengaturan"
2. Check status API (harus hijau/connected)
3. Click "Refresh Data API"
4. Pastikan SnackBar muncul
5. Click "Logout"
6. Pastikan AlertDialog muncul
7. Click "Ya" untuk confirm

---

## 🔧 Troubleshooting

### **Problem: Data tidak muncul**
**Solution:**
- Check internet connection
- Check console untuk error messages
- Pastikan API JSONPlaceholder online

### **Problem: Error state terus menerus**
**Solution:**
- Check log error di console
- Coba click retry button
- Restart aplikasi

### **Problem: Build error**
**Solution:**
```bash
flutter clean
flutter pub get
flutter run
```

---

## 📝 Best Practices Implemented

✅ **Clean Architecture**
- Models, Services, Cubits, Pages terpisah

✅ **Error Handling**
- Try-catch di semua API calls
- User-friendly error messages

✅ **Loading States**
- Loading indicators untuk better UX
- Prevent multiple simultaneous calls

✅ **Code Organization**
- Clear folder structure
- Meaningful naming conventions

✅ **User Feedback**
- SnackBars untuk notifikasi
- AlertDialogs untuk konfirmasi

---

## 🎓 Yang Dipelajari

1. **REST API Integration**
   - HTTP requests dengan package `http`
   - JSON parsing
   - Error handling

2. **State Management**
   - Cubit/BLoC pattern
   - State classes
   - BlocBuilder widget

3. **Flutter Widgets**
   - BottomNavigationBar
   - Card, ListTile
   - CircularProgressIndicator
   - SnackBar, AlertDialog

4. **Architecture**
   - Separation of concerns
   - Dependency injection
   - Clean code practices

---

## 📚 References

- [Flutter BLoC Documentation](https://bloclibrary.dev/)
- [JSONPlaceholder API](https://jsonplaceholder.typicode.com/)
- [Flutter HTTP Package](https://pub.dev/packages/http)
- [Flutter Documentation](https://docs.flutter.dev/)

---

**Dibuat oleh:** Salsabila Rahmadina (707012400067)  
**Tanggal:** Desember 2025  
**Mata Kuliah:** Praktikum Pemrograman Perangkat Bergerak
