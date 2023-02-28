# Movme

Movme adalah aplikasi informatif sederhana mengenai film-film terbaru, rating tertinggi, hingga yang akan datang.
Aplikasi sederhana ini dibuat sebagai requirement tugas open registration Ristek 2023.

## Fitur
1. Database film terupdate dari [The Movie Database](https://developers.themoviedb.org/3).
2. Kategori film yang trending, top rated, hingga yang akan datang.
3. Simpan profile pengguna seperti foto, nama, jurusan (sekarang terbatas pada IK & SI), angkatan, hobi, email, instagram, dan about me.
4. Detail setiap film seperti nama, rating, tahun rilis, deskripsi, hingga film yang mirip dengan film tersebut.
5. Favorite Movie dimana pengguna dapat menyimpan dan menghapus film favoritnya.
6. Data Profile dan Favorite Movie tersimpan secara lokal.

## Package Used
Flutter Framework beserta package lainnya, diantaranya:
- `http` untuk get data dari API TMDB.
- `intl` untuk menghandle format penaanggalan.
- `SharedPreferences` untuk menghandle penyimpanan data secara lokal.
- `ImagePicker` untuk membantu menghubungkan app dengan galeri pengguna.
- `PathProvider` untuk menghandle path data di device storage pengguna.
