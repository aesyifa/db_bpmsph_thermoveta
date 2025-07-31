
# ThermoVeta: Sistem Monitoring Suhu Berbasis IoT

**ThermoVeta** adalah sistem monitoring suhu berbasis Internet of Things (IoT) yang dikembangkan di Balai Pengujian Mutu dan Sertifikasi Produk Hewan (BPMSPH). Sistem ini dirancang untuk memantau suhu ruangan (seperti ruang pendingin) secara real-time dan memberikan peringatan dini ketika suhu melewati ambang batas yang ditentukan.

---

## 🔧 Fitur Utama

- Monitoring suhu real-time menggunakan sensor DS18B20
- Mikrokontroler ESP32 untuk mengirim data melalui Wi-Fi
- Website dan aplikasi mobile untuk dashboard suhu, riwayat, grafik statistik, dan manajemen pengguna
- Alarm otomatis (buzzer) jika suhu melewati ambang batas
- Notifikasi melalui aplikasi mobile dan WhatsApp
- Sistem manajemen pengguna (admin dan user)
- CRUD data suhu dan riwayat notifikasi

---

## 📂 Struktur Database (`bpmsph_thermoveta.sql`)

File ini berisi struktur dan isi awal database `suhu_db` yang mencakup:

- **suhu_data**: Data suhu yang terekam oleh sensor
- **suhu_terkini**: Data suhu terakhir tiap device
- **device_status**: Status alarm dan ambang batas suhu per perangkat
- **log_hapus**: Log riwayat penghapusan data
- **users**: Data pengguna sistem (admin/user)
- **login_attempts**: Riwayat percobaan login
- **whatsapp_recipients**: Penerima notifikasi WhatsApp

---

## ⚙️ Cara Menggunakan

1. Import file SQL:
   ```
   phpMyAdmin → Import → bpmsph_thermoveta.sql
   ```
2. Jalankan backend API (Laravel/Node.js/other)
3. Jalankan aplikasi mobile (Flutter)
4. Jalankan antarmuka website
5. Hubungkan ESP32 ke Wi-Fi dan pastikan server menerima data via API

---

## 🛡️ Hak Akses

| Role   | Akses Website      | Akses Mobile App    |
|--------|--------------------|---------------------|
| Admin  | Full CRUD data     | Full fitur          |
| User   | View data & riwayat| Kontrol alarm, profil|

---

## 📱 Teknologi yang Digunakan

- **ESP32** + Sensor Suhu DS18B20
- **MySQL** (phpMyAdmin)
- **Flutter** (Aplikasi Mobile)
- **PHP/HTML/CSS/JS** (Website)
- **API RESTful** untuk komunikasi

---

## 🤝 Kontributor

- Mahasiswa Magang BPMSPH
- Pembimbing Lapangan & Dosen Pembimbing

---

## 📄 Lisensi

Proyek ini dikembangkan untuk tujuan edukasi dan pengujian. Silakan modifikasi dan gunakan sesuai kebutuhan dengan menyertakan kredit.
