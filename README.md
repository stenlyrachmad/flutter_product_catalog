# Flutter Product Catalog App
Flutter mobile app yang menampilkan product dari [FakeStore API](https://fakestoreapi.com/products).  
Menggunakan — BLoC, GetIt, Dio, Dartz, dan Cached Network Images.


## Features
• Fetch products dari API (`https://fakestoreapi.com/products`).
• Menampilkan list produk dengan cached image.
• Screen Detail Produk dengan data rating and description.
• Search products dengan title atau category (local filtering).
• Refresh dan error handling states.
• Dependency Injection dengan GetIt.
• Function error handling menggunakan Dartz Either.
• Clean architecture dengan BLoC state management.
• Flutter 3.35.7 / Dart 3.9.2


## Tech Stack
• Framework | Flutter 3.35.7<br/>
• Language | Dart 3.9.2 <br/>
• State Management | [flutter_bloc](https://pub.dev/packages/flutter_bloc) <br/>
• Dependency Injection | [get_it](https://pub.dev/packages/get_it) <br/>
• HTTP Client | [dio](https://pub.dev/packages/dio) <br/>
• Functional Programming | [dartz](https://pub.dev/packages/dartz) <br/>
• Image Caching | [cached_network_image](https://pub.dev/packages/cached_network_image)<br/>
• Formatting | [intl](https://pub.dev/packages/intl)<br/>


## Getting Started
```bash
git clone https://github.com/<your-username>/flutter_product_catalog.git
cd flutter_product_catalog
flutter pub get
flutter run
```


## API Source
https://fakestoreapi.com/products


## Architecture Overview
Aplikasi ini mengikuti kaidah sederhana dari clean dan layer arsitektur
• Data Layer : Menangani koneksi API dengan Dio & Pola Repository 
• Domain Layer : Mengembalikan return Function dengan Either<Failure, T> (kiri return type error, kanan return type success)
• Presentation Layer : Menggunakan BLoC untuk reaktif update di Ui

Semua Dependency tersentralisasi via GetIt di injector.dart


## Key Classes
• ProductRepository : Fetch product data dari API melalui Dio
• ProductsBloc : Manage product list, search, dan refresh events
• Product / Rating : Model class utk deserialize API response
• HomeScreen : Menampilkan product list dan search box
• DetailScreen : Menampilkan seluruh product info


