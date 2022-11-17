# Tugas 7: Elemen Dasar Flutter

Reference 
1. [Tambah button](https://www.fluttercampus.com/guide/19/how-to-add-multiple-floating-action-buttons-in-one-screen-flutter-app/)
2. [Referensi alignment button](https://stackoverflow.com/questions/72152176/how-to-put-buttons-on-two-ends-of-screen-in-flutter)
3. [Referensi change color](https://programmingwithswift.com/change-button-color-on-press-with-flutter/)
4. [Referensi change color](https://www.flutterbeads.com/change-text-color-in-flutter/#:~:text=its%20color%20parameter.-,Steps,the%20color%20of%20your%20choice.)
5. [Hide button](https://stackoverflow.com/questions/44489804/how-to-show-hide-widgets-programmatically-in-flutter)

 ## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
  
  stateful widget -> tampilannya akan berubah saat terjadi sebuah action yang dibuat oleh user 
  example : text yang akan ditampilkan akan disesuaikan dengan nilai counter

  stateless widget -> tampilan yang tidak dapat berubah 
  example : increment button

 ## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

 - Text -> menampikan text bertulisan "genap", "ganjil" dan counter 
 - Icons -> menampilkan icon "+" dan "-" pada button
 - Floatingactionbutton -> menampilkan button "+" dan "-" jika button "+"  ditekan maka counter akan bertambah 1 dan jika button "-" ditekan maka counter akan berkurang 1

 ## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
 setState() -> untuk memanggil framework bahwa value dari method yang dipanggil telah berubah

 varibel yang terdapat di dalam setState akan terpengaruhi 

 ## Jelaskan perbedaan antara const dengan final.

 const - > akan di initialized ketika compile - time  yang dimana variable akan di assign ketika run time

 final -> akan di initialized ketika runtime yang dimana variable akan di assign sekali saja


 ## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

 Pertama membuat method _decrementCounter() yang akan melakukan decrement setiap method tersebut dipanggil, Kemudian membuat method setText yang akan menyesuaikan _text dengan counter jika counter merupakan genap maka _text akan bertulisan genap dan _currentColorIndex akan bernilai 0 dan jika ganjil maka _text akan bertulisan ganjil _currentColorIndex akan bernilai 1

 Kemudian membuat button remove yang jika button tersebut ditekan maka counter akan di decrement dan 


 # Tugas 8: Flutter Form


 ## Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.
    Navigator.push -> Metode Navigator.push digunakan untuk menambahkan rute lain ke atas tumpukan screen (stack) saat ini. Halaman baru ditampilkan di atas halaman sebelumnya.
    Navigator.pushReplacement -> Metode Navigator.pushReplacement sama seperti Navigator.push tetapi bedanya Navigator.pushReplacement akan membuang route sebelumnya


 ## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
    - Form ->  menghimpun elemen-elemen pada halaman input budget. 
    - Text -> menampilkan text
    - Container -> sebagai tempat untuk mengampung dropdown menu 
    - Card -> menampilkan informasi budget dalam bentuk kotak baru
    - Textbutton -> menambahkan button submisi budget
    - DropdownButtonFormField -> untuk menampilkan menu dropdown berisi tipe budget
    - Drawer -> navigasi antar halaman

 ## Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).
   - onPressed
   - onTap
   - onSaved
   - onChange
   - onEnter
   - onExit
   - onHover

 ## Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.
   Tujuannya adalah untuk menampilkan halaman yang ada pada aplikasi. yang dimana jika ditekan akan route ke halaman yang lain. Dan untuk pindah halaman maka perlu method push dan pop.
   push -> Metode Navigator.push digunakan untuk menambahkan rute lain ke atas tumpukan screen (stack) saat ini. Halaman baru ditampilkan di atas halaman sebelumnya.
   pop -> melepas royte yang ada di paling atas Navigator dan kembali ke route sebelumnya


 ## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
        1 membuat drawer yang berguna sebagai navigator antar halaman pada app
        2 membuat  file bernama form dan sebuah form yang untuk menginput data - data yang diperlukan pada halaman tambah budget dengan data yang diperlukan input judul, nominal dan jenis input pada dropdown menu. Dan membuat class Budget yang berisi atribut - atribut yang diperlukan dalam input data 
        3 membuat file bernama data yang menampilkan isi - isi dari data yang telah diinput dengan cara membuat Listview untuk menampilkan setiap elemen pada List data budget dengan setiap data ditampilkan dalam bentuk cards

