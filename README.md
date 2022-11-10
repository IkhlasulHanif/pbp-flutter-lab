# counter_7

A new Flutter project.

## TUGAS 7
1. Stateless Widget dapat diartikan sebagai Widget yang tidak dapat dirubah atau tidak akan pernah berubah. Stateful Widget merupakan widget yang dinamis atau dapat berubah. Berbanding terbalik dengan stateless, stateful widget dapat mengupdate tampilan, merubah warna, menambah jumlah baris dll.
2. Column, Row, Align, Visibility, FloatingActionButton, Padding. Column widget digunakan untuk menempatkan widget secara menurun atau vertical. Row widget adalah widget yang digunakan untuk memposisikan widget-widget lainnya secara horizontal. Align widget adalah widget yang digunakan untuk meng-alignkan child-nya di dalam dirinya sendiri dan secara opsional mengukur dirinya sendiri berdasarkan ukuran childnya. Visibility widget adalah widget yang digunakan untuk menghilakan child-nya. Padding widget sesuai dengan namanya adalah widget yang memberikan padding kepada childnya.
3. setState() adalah cara flutter untuk mengubah tampilan secara dinamis atau dapat dikatakan "ajax"nya flutter. Pada tugas ini variabel yang terpengaruh adalah counter, tetapi secara umum dapat dilakukan kepada widget dan variabel yang kita sudah declare. FloatingActionButton widget adalah widget yang digunakan sebagai tombol untuk menjalankan action.
4. Suatu variable yang dideclare Final tidak dapat diubah lagi jika sudah diassign ke suatu value, sedangkan const dapat berubah-ubah.
5. Pertama, menambahkan tombol kurang dan tambah pada child row dengan widget Align. Kemudian, membuat fungsi increment dan decrement dan menyambungkannya pada "onPressed" pada widget align. Selanjutnya perlu mengubah isi text pada widget Text saat kondisi ganjil dan genap menggunakan bantuan conditional statement. Terakhir untuk bonus saya menggunakan bantuan Visibility dengan kondisi counter = 0 maka visibility akan di set true.
