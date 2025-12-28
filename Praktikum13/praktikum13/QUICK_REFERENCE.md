# 🚀 Quick Reference - Praktikum 13

## Commands

### Install Dependencies
```bash
flutter pub get
```

### Run Application
```bash
flutter run
# atau pilih device:
flutter run -d chrome          # Web
flutter run -d windows         # Windows
flutter run -d <device-id>     # Specific device
```

### Check Devices
```bash
flutter devices
```

### Clean Build
```bash
flutter clean
flutter pub get
flutter run
```

---

## File Structure Quick View

```
lib/
├── main.dart                    # Entry point + MultiBlocProvider
├── cubit/
│   ├── page_cubit.dart         # Navigation: emit(newPageIndex)
│   ├── user_cubit.dart         # fetchUsers() → emit states
│   ├── user_state.dart         # Initial, Loading, Loaded, Error
│   ├── post_cubit.dart         # fetchPosts() → emit states
│   └── post_state.dart         # Initial, Loading, Loaded, Error
├── models/
│   ├── user.dart               # User model + fromJson/toJson
│   └── post.dart               # Post model + fromJson/toJson
├── services/
│   └── api_service.dart        # HTTP calls to JSONPlaceholder
└── pages/
    ├── dashboard_page.dart     # Main container + BottomNavBar
    ├── home_page.dart          # Displays posts count
    ├── profile_page.dart       # Displays user data
    └── settings_page.dart      # API status + logout
```

---

## Key Code Snippets

### 1. Fetch Data from API
```dart
// In cubit
context.read<UserCubit>().fetchUsers();

// In page - listen to changes
BlocBuilder<UserState>(
  builder: (context, state) {
    if (state is UserLoading) return CircularProgressIndicator();
    if (state is UserLoaded) return Text('Data: ${state.users}');
    if (state is UserError) return Text('Error: ${state.message}');
    return Text('Initial');
  },
)
```

### 2. Navigate Between Pages
```dart
context.read<PageCubit>().changePage(1); // Go to ProfilePage
```

### 3. Show SnackBar
```dart
ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(content: Text('Message here')),
);
```

### 4. Show AlertDialog
```dart
showDialog(
  context: context,
  builder: (_) => AlertDialog(
    title: const Text('Title'),
    content: const Text('Message'),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Cancel'),
      ),
      TextButton(
        onPressed: () {
          Navigator.pop(context);
          // Do action
        },
        child: const Text('OK'),
      ),
    ],
  ),
);
```

---

## API Endpoints

```
Base URL: https://jsonplaceholder.typicode.com

GET /users              → All users (10 items)
GET /users/1            → User by ID
GET /posts              → All posts (100 items)
GET /posts?userId=1     → Posts by user ID
```

---

## State Flow

```
Initial State
    ↓
User triggers action (e.g., open page)
    ↓
Cubit method called (e.g., fetchUsers())
    ↓
emit(LoadingState)
    ↓
API Service called
    ↓
Success: emit(LoadedState(data))
Error: emit(ErrorState(message))
    ↓
BlocBuilder rebuilds UI automatically
```

---

## Common Cubit Methods

### PageCubit
```dart
changePage(int index) // Navigate to page
```

### UserCubit
```dart
fetchUsers() // Get all users from API
```

### PostCubit
```dart
fetchPosts()              // Get all posts
fetchPostsByUserId(int)   // Get posts by user
```

---

## BLoC Widgets Cheat Sheet

### BlocProvider
```dart
BlocProvider(
  create: (context) => MyCubit(),
  child: MyWidget(),
)
```

### MultiBlocProvider
```dart
MultiBlocProvider(
  providers: [
    BlocProvider(create: (_) => Cubit1()),
    BlocProvider(create: (_) => Cubit2()),
  ],
  child: MyApp(),
)
```

### BlocBuilder
```dart
BlocBuilder<MyCubit, MyState>(
  builder: (context, state) {
    return Text('State: $state');
  },
)
```

### Read Cubit
```dart
context.read<MyCubit>().myMethod();
```

### Watch Cubit (auto rebuild)
```dart
final state = context.watch<MyCubit>();
```

---

## Debugging Tips

### Check Console Output
```dart
print('Debug: $variable');
debugPrint('Debug message');
```

### Inspect State
```dart
BlocBuilder<MyCubit, MyState>(
  builder: (context, state) {
    print('Current state: $state');
    return YourWidget();
  },
)
```

### Common Errors & Solutions

**Error: Bad state: Cannot emit new states after calling close**
- Solution: Don't emit after cubit is closed

**Error: type 'Null' is not a subtype of type**
- Solution: Check null safety, use nullable types

**Error: Connection refused**
- Solution: Check internet connection, API URL

**Error: setState() called after dispose()**
- Solution: Check if widget is mounted before setState

---

## Keyboard Shortcuts (VS Code)

- `Ctrl + Space` - Auto-complete
- `Ctrl + .` - Quick fix / Import
- `Shift + Alt + F` - Format document
- `F5` - Start debugging
- `Ctrl + C` - Stop running app
- `r` - Hot reload (in terminal)
- `R` - Hot restart (in terminal)

---

## Testing Checklist

- [ ] HomePage loads and displays posts count
- [ ] Loading indicator appears briefly
- [ ] ProfilePage shows user data correctly
- [ ] SettingsPage shows API status
- [ ] Navigation works (bottom bar)
- [ ] SnackBar appears on button click
- [ ] AlertDialog appears on logout
- [ ] Refresh button updates data
- [ ] Error handling works (turn off internet)
- [ ] Retry button works on error state

---

## Performance Tips

✅ Use `const` constructors where possible
✅ Avoid unnecessary rebuilds with BlocBuilder
✅ Use `context.read()` for actions (no rebuild)
✅ Use `context.watch()` for state (with rebuild)
✅ Dispose controllers and close streams
✅ Use ListView.builder for large lists

---

## Next Steps / Improvements

💡 Add pull-to-refresh functionality
💡 Implement search feature
💡 Add pagination for posts
💡 Cache API data locally
💡 Add animations and transitions
💡 Implement dark mode
💡 Add user authentication
💡 Store favorites locally (SharedPreferences)

---

## Dependencies Used

```yaml
flutter_bloc: ^8.1.6   # State management
http: ^1.2.2           # HTTP requests
```

---

## Contact & Support

**Developer:** Salsabila Rahmadina  
**NIM:** 707012400067  
**Prodi:** D4 Sistem Informasi Kota Cerdas

**Resources:**
- [Flutter Docs](https://docs.flutter.dev/)
- [BLoC Library](https://bloclibrary.dev/)
- [Dart Packages](https://pub.dev/)

---

*Last updated: Desember 2025*
