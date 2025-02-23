# 📚 Database Perpustakaan Sekolah

Sistem database **Perpustakaan Sekolah** menggunakan **MySQL** dan dikelola melalui **phpMyAdmin**.  
Database ini mencakup tiga tabel utama:  
- **📖 buku** → Data buku di perpustakaan  
- **👨‍🎓 siswa** → Data siswa yang meminjam buku  
- **🏛️ peminjaman** → Catatan peminjaman dan pengembalian buku  

## ✨ Fitur Utama
✅ **CRUD Data Buku, Siswa, dan Peminjaman**  
✅ **Stored Procedure untuk Insert, Update, Delete & Query Khusus**  
✅ **Trigger Otomatis untuk Update Stok Buku**  
✅ **Menampilkan Siswa & Buku yang Tidak Pernah Bertransaksi**  

---

## 📌 Struktur Database
### **1️⃣ Tabel `buku`**
| ID | Judul Buku | Penulis | Kategori | Stok |
|----|-----------|---------|----------|------|
| 1  | Algoritma dan Pemrograman | Andi Wijaya | Teknologi | 5 |

### **2️⃣ Tabel `siswa`**
| ID | Nama Siswa | Kelas |
|----|-----------|-------|
| 1  | Andi Saputra | X-RPL |

### **3️⃣ Tabel `peminjaman`**
| ID | ID Siswa | ID Buku | Tanggal Pinjam | Tanggal Kembali | Status |
|----|---------|--------|---------------|---------------|--------|
| 1  | 11      | 2      | 2025-02-01    | 2025-02-08    | Dipinjam |

---

## 📥 Cara Menggunakan
1️⃣ **Clone repository ini ke komputer kamu:**
   ```sh
   git clone https://github.com/username/Database-Perpustakaan-Sekolah.git
   ```
2️⃣ **Import database ke MySQL/phpMyAdmin:**  

3️⃣ **Jalankan setiap query sesuai yang kamu mau**  

4️⃣ **Pastikan MySQL/MariaDB sudah terinstall di komputer kamu.**  

---
## 🤖 Kontributor
  Dibuat Oleh Faiz Zaenal Muttaqin
