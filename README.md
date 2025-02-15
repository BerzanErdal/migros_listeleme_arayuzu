Migros Uygulaması - Flutter ile Geliştirilmiş Mobil Uygulama

Bu proje, Migros'un çeşitli hizmetlerini (Sanal Market, Hemen, Yemek, Taze Direkt, Macro Online, Ekstra, Mion ve Müthiş Çekiliş) kullanıcıya listeleyen bir Flutter mobil uygulamasıdır. Uygulama, kullanıcı dostu bir arayüz sunar ve otomatik geçişli resim slider'ı, arama çubuğu ve mikrofon özellikleri gibi modern mobil uygulama özelliklerini içerir.



🚀 Özellikler

- Otomatik Resim Slider'ı:** Migros'un kampanyalarını ve hizmetlerini tanıtan resimler, otomatik olarak geçiş yapar.
- Arama Çubuğu:** Kullanıcılar, ürün, yemek veya hizmet aramak için arama çubuğunu kullanabilir.
- Mikrofon Desteği:** Arama çubuğunda mikrofon simgesi ile sesli arama yapılabilir.
- Grid View ile Hizmetler:** Migros hizmetleri, grid (ızgara) yapısında kullanıcıya sunulur.
- FutureBuilder ile Veri Yükleme:** Hizmetler asenkron olarak yüklenir ve kullanıcıya gösterilir.

---

🛠️ Kurulum

Projeyi yerel makinenizde çalıştırmak için aşağıdaki adımları izleyin:

1. Projeyi Klonlayın:
   ```bash
   git clone https://github.com/BerzanErdal/migros_listeleme_arayuzu.git
   ```

2. Proje Dizinine Gidin:
   ```bash
   cd migros_uygulamasi
   ```

3. Gerekli Paketleri Yükleyin:
   ```bash
   flutter pub get
   ```

4. Uygulamayı Çalıştırın:
   ```bash
   flutter run
   ```


📂 Proje Yapısı

Projenin dosya ve klasör yapısı aşağıdaki gibidir:

```
migros_uygulamasi/
├── lib/
│   ├── data/
│   │   └── entity/
│   │       └── migros.dart
│   ├── ui/
│   │   └── anasayfa.dart
│   └── main.dart
├── resimler/
│   ├── migrossanalmarket.png
│   ├── migroshemen.png
│   └── ...
├── screenshots/
│   ├── anasayfa.png
│   └── hizmetler.png
├── README.md
└── pubspec.yaml
```


🛠️ Kullanılan Teknolojiler

- **Flutter:** Modern ve hızlı mobil uygulama geliştirme framework'ü.
- **Dart:** Flutter'ın programlama dili.
- **FutureBuilder:** Verileri asenkron olarak yüklemek için kullanıldı.
- **AnimatedSwitcher:** Resimler arası geçişlerde animasyon sağlar.
- **ValueListenableBuilder:** Slider'ın otomatik geçişini yönetmek için kullanıldı.
