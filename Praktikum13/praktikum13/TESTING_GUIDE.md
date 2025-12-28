# 📸 Screenshot & Testing Guide

## Cara Menjalankan Aplikasi

### 1. Persiapan
```bash
cd "d:\Kuliah\Semester 3\Praktikum_DPPB\Praktikum13\praktikum13"
flutter pub get
```

### 2. Check Available Devices
```bash
flutter devices
```

Output example:
```
Chrome (web)    • chrome    • web-javascript • Google Chrome
Windows (desktop) • windows  • windows-x64    • Microsoft Windows
```

### 3. Run Application
**Untuk Web (Chrome):**
```bash
flutter run -d chrome
```

**Untuk Windows Desktop:**
```bash
flutter run -d windows
```

**Untuk Android/iOS:**
```bash
flutter run -d <device-id>
```

---

## 📱 Testing Flow

### Test 1: HomePage
**Expected Result:**
1. ✅ Muncul icon Home (biru navy)
2. ✅ Text "Selamat Datang 👋"
3. ✅ Loading indicator (sebentar)
4. ✅ Card muncul dengan "100 Posts"
5. ✅ Text "dari JSONPlaceholder API"
6. ✅ Button "Menuju Profil"

**Action:**
- Click button "Menuju Profil"
- ✅ SnackBar muncul: "Menuju halaman Profil..."
- ✅ Navigate ke ProfilePage

---

### Test 2: ProfilePage
**Expected Result:**
1. ✅ CircleAvatar dengan icon person
2. ✅ Text "Profil Pengguna"
3. ✅ Loading indicator (sebentar)
4. ✅ Card dengan data user:
   - 👤 Nama: Leanne Graham
   - @ Username: Bret
   - ✉ Email: Sincere@april.biz
   - 📱 Phone: 1-770-736-8031 x56442
   - 🌐 Website: hildegard.org
5. ✅ Button "Kembali ke Home"

**Action:**
- Click button "Kembali ke Home"
- ✅ Navigate kembali ke HomePage

---

### Test 3: SettingsPage
**Via Bottom Navigation:**
- Click tab "Pengaturan" di bottom bar

**Expected Result:**
1. ✅ Icon Settings (biru navy)
2. ✅ Text "Pengaturan Aplikasi"
3. ✅ Card "Status API" dengan:
   - ☁ Icon cloud
   - 🟢 Dot hijau (connected)
   - Text "Terhubung (10 users)"
4. ✅ Button "Refresh Data API"
5. ✅ Button "Logout" (warna merah)

**Action 1: Refresh Data**
- Click "Refresh Data API"
- ✅ SnackBar muncul: "Memperbarui data dari API..."
- ✅ Data ter-refresh

**Action 2: Logout**
- Click "Logout"
- ✅ AlertDialog muncul dengan:
   - Title: "Konfirmasi Logout"
   - Content: "Apakah Anda yakin ingin keluar..."
   - Button: "Batal" dan "Ya"

**Sub-test 2a: Cancel Logout**
- Click "Batal"
- ✅ Dialog tertutup
- ✅ Tetap di SettingsPage

**Sub-test 2b: Confirm Logout**
- Click "Ya"
- ✅ Dialog tertutup
- ✅ Navigate ke HomePage
- ✅ SnackBar: "Logout berhasil!"

---

### Test 4: Bottom Navigation
**Test semua tab:**

1. Click "Home" tab → ✅ HomePage tampil
2. Click "Profil" tab → ✅ ProfilePage tampil
3. Click "Pengaturan" tab → ✅ SettingsPage tampil

**Expected:**
- ✅ Active tab highlighted (biru navy)
- ✅ AppBar title berubah sesuai halaman
- ✅ Smooth transition

---

## 🧪 Error Testing

### Test 5: Error Handling (Tanpa Internet)
**Setup:**
1. Matikan internet/WiFi
2. Restart aplikasi

**Expected di ProfilePage:**
- ✅ Loading indicator
- ✅ Icon error (⚠)
- ✅ Text error message
- ✅ Button "Coba Lagi"

**Action:**
- Nyalakan kembali internet
- Click "Coba Lagi"
- ✅ Data berhasil dimuat

---

## 📋 Checklist Testing Lengkap

### HomePage
- [ ] Icon dan text ditampilkan
- [ ] Loading indicator muncul sebentar
- [ ] Jumlah posts (100) ditampilkan
- [ ] Button "Menuju Profil" berfungsi
- [ ] SnackBar muncul saat click button
- [ ] Navigate ke ProfilePage

### ProfilePage
- [ ] CircleAvatar ditampilkan
- [ ] Loading indicator muncul
- [ ] Data user ditampilkan lengkap:
  - [ ] Nama
  - [ ] Username
  - [ ] Email
  - [ ] Phone
  - [ ] Website
- [ ] Button "Kembali ke Home" berfungsi
- [ ] Navigate kembali ke HomePage

### SettingsPage
- [ ] Icon settings ditampilkan
- [ ] Card "Status API" ditampilkan
- [ ] Indicator status (hijau = connected)
- [ ] Jumlah users ditampilkan
- [ ] Button "Refresh" berfungsi
- [ ] SnackBar muncul saat refresh
- [ ] Button "Logout" berfungsi
- [ ] AlertDialog muncul
- [ ] Button "Batal" menutup dialog
- [ ] Button "Ya" logout dan navigate

### Navigation
- [ ] Bottom navigation bar ditampilkan
- [ ] 3 tabs (Home, Profil, Pengaturan)
- [ ] Active tab ter-highlight
- [ ] AppBar title berubah per page
- [ ] Click setiap tab berfungsi

### Error Handling
- [ ] Tanpa internet: error message
- [ ] Button "Coba Lagi" muncul
- [ ] Retry berfungsi setelah internet ON

### UI/UX
- [ ] Theme biru navy konsisten
- [ ] Icons ditampilkan dengan benar
- [ ] Text readable dan aligned
- [ ] Cards memiliki elevation
- [ ] Buttons memiliki ripple effect
- [ ] Loading smooth, tidak blocking
- [ ] No UI glitches atau overflow

---

## 🎥 Recording Testing

**Recommended:**
1. Record screen saat testing
2. Capture setiap halaman
3. Tunjukkan semua interaksi:
   - Button clicks
   - SnackBars
   - AlertDialogs
   - Navigation
   - Loading states
   - Error states

**Tools:**
- Windows: Game Bar (Win + G)
- OBS Studio (free)
- Screen recorder apps

---

## 📊 Expected API Responses

### Users API
```json
[
  {
    "id": 1,
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "Sincere@april.biz",
    "phone": "1-770-736-8031 x56442",
    "website": "hildegard.org"
  },
  // ... 9 more users
]
```

### Posts API
```json
[
  {
    "userId": 1,
    "id": 1,
    "title": "sunt aut facere repellat...",
    "body": "quia et suscipit..."
  },
  // ... 99 more posts
]
```

---

## 🐛 Common Issues & Solutions

### Issue 1: "Waiting for another flutter command to release the startup lock"
**Solution:**
```bash
flutter clean
# Tunggu selesai
flutter pub get
flutter run
```

### Issue 2: Chrome not opening
**Solution:**
```bash
flutter devices  # Check if chrome available
flutter run -d chrome
```

### Issue 3: Cannot find Chrome
**Solution:**
```bash
# Set Chrome path (Windows)
$env:CHROME_EXECUTABLE = "C:\Program Files\Google\Chrome\Application\chrome.exe"
flutter run -d chrome
```

### Issue 4: API timeout
**Solution:**
- Check internet connection
- Try different network
- Wait and retry

### Issue 5: "Bad state: Cannot emit new states"
**Solution:**
- Restart the app
- Check cubit close lifecycle

---

## 💡 Tips untuk Demo

1. **Persiapan:**
   - Test semua flow sebelum demo
   - Pastikan internet stabil
   - Close apps yang tidak perlu

2. **Saat Demo:**
   - Explain setiap action
   - Tunjukkan loading states
   - Demonstrate error handling
   - Show SnackBars dan Dialogs

3. **Highlight Features:**
   - REST API integration
   - State management (Cubit)
   - Error handling
   - Smooth navigation
   - Clean UI/UX

---

## 📝 Report Template

### Testing Report
**Tanggal:** [Date]
**Tester:** [Name]
**Device:** [Chrome/Windows/Android]

**Results:**
- HomePage: ✅ Pass / ❌ Fail
- ProfilePage: ✅ Pass / ❌ Fail
- SettingsPage: ✅ Pass / ❌ Fail
- Navigation: ✅ Pass / ❌ Fail
- Error Handling: ✅ Pass / ❌ Fail

**Issues Found:**
1. [Issue description]
2. [Issue description]

**Screenshots:** [Attached]
**Video:** [Link]

---

**Good luck with your testing! 🚀**
