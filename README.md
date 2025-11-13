# 🌤️ Aplikasi Flutter Multi-Halaman (Biodata, Kontak, Kalkulator, Cuaca, Berita)

## 📱 Deskripsi Umum
Aplikasi ini merupakan proyek Flutter yang menampilkan berbagai fitur dasar aplikasi mobile dengan **navigasi modern** dan **desain elegan**.  
Aplikasi terdiri dari beberapa halaman (fragment) yang saling terhubung melalui **Bottom Navigation Bar**.

---

## 🚀 Fitur Aplikasi

### 🕒 1. Splash Screen
- Tampil selama **5 detik** sebelum masuk ke Dashboard.
- Menampilkan:
  - Judul aplikasi  
  - Foto pengguna  
  - Nama pengguna  
  - NIM pengguna  
- Memiliki efek animasi **fade-in** yang halus.

---

### 🏠 2. Dashboard
- Berfungsi sebagai halaman utama setelah Splash Screen.
- Menggunakan **Bottom Navigation Bar** untuk berpindah antar menu:
  - **Biodata**
  - **Kontak**
  - **Kalkulator**
  - **Cuaca**
  - **Berita**
- Setiap menu ditampilkan dalam bentuk **fragment** (tanpa berpindah halaman penuh).

---

### 👤 3. Halaman Biodata
- Menampilkan informasi pribadi berupa:
  - Foto profil
  - Nama
  - NIM
  - Program studi / fakultas
- Dilengkapi dengan **form input interaktif**, seperti:
  - Text field (nama, alamat)
  - Dropdown (jurusan)
  - Radio button (jenis kelamin)
  - Date picker (tanggal lahir)
- Desain dibuat dengan **layout modern, bersih, dan elegan**.
- Data belum disimpan ke database (statis saja).

---

### 📇 4. Halaman Kontak
- Menampilkan daftar **15 kontak statis**.
- Setiap item kontak terdiri dari:
  - Foto (circle image)
  - Nama kontak
  - Nomor telepon
  - Ikon telepon di sisi kanan
- Menggunakan **ListView.builder()** untuk menampilkan data dinamis.
- Desain elegan dengan **Card dan efek bayangan lembut**.

---

### 🧮 5. Halaman Kalkulator
- Mode **kalkulator sederhana** yang mendukung operasi:
  - Penjumlahan (+)
  - Pengurangan (−)
  - Perkalian (×)
  - Pembagian (÷)
  - Kuadrat (x²)
  - Akar kuadrat (√x)
  - Hapus (C)
- Hasil perhitungan ditampilkan secara real-time.
- Desain modern dengan **tombol bulat dan animasi sentuhan ringan**.

---

### 🌦️ 6. Halaman Cuaca
- Menampilkan data cuaca statis, meliputi:
  - Nama kota
  - Suhu (°C)
  - Kelembapan (%)
  - Kecepatan angin (km/jam)
  - Kondisi cuaca (contoh: Cerah, Hujan, Berawan)
- Dilengkapi dengan animasi **Lottie** seperti:
  - `sunny.json` ☀️
  - `rainy.json` 🌧️ (bisa dipilih sesuai kondisi)
- Memiliki desain **glassmorphism** dengan efek transparan lembut.
- Animasi **fade-in transition** ketika halaman dibuka.

---

### 📰 7. Halaman Berita
- Menampilkan daftar berita statis (minimal 2 berita).
- Setiap berita terdiri dari:
  - Gambar berita
  - Judul berita
  - Deskripsi singkat
- Menggunakan layout **card bergambar** dengan radius dan bayangan halus.
- Mengimplementasikan konsep tampilan berulang seperti halaman kontak.

---

## 💡 Teknologi yang Digunakan
- **Flutter 3.35.5**
- **Dart**
- **Lottie Animations**
- **Material Design 3**
- **Custom Widget & Animation (FadeTransition)**

---
