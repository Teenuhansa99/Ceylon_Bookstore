# 📚 Ceylon Bookstore

A simple Flutter Book Store App built for the CCS3351 Mobile Application Development – Mid Term Project at SLTC Research University.

**Project status:** Learning / Example project — ready to run locally.

---

## 🧩 Overview

Ceylon Bookstore is a Flutter app that displays a list of books and allows users to:

- Add books to a cart
- View cart items
- See account details

> Note: The project currently uses `provider` for state management. If you want, it can be migrated to `GetX`.

---

## 🖥️ Features

- 📘 Book list with **Add to Cart** functionality  
- 🛒 Cart page showing selected items  
- 👤 Account page with user info  
- 🎨 Custom color theme and modern layout  
- ⚡ Real-time cart updates using `provider`  

---

## 🧠 Tech Stack

- **Framework:** Flutter  
- **Language:** Dart  
- **State Management:** `provider` (current project)  

---

## Prerequisites

- Flutter SDK installed ([Flutter installation guide](https://flutter.dev/docs/get-started/install))  
- `flutter` available in your PATH  
- For iOS builds: macOS with Xcode required  

---

## 🚀 Quick Start (Windows PowerShell)

```powershell
# Navigate to project directory
cd 'C:\Users\teenu\Downloads\Ceylon_Bookstore-main (2)\Ceylon_Bookstore-main'

# Install dependencies
flutter pub get

# Run the app
flutter run
```

> Tip: Use `-d windows`, `-d chrome`, or `-d android` to target a specific device.

---

## 🔧 Build

* **Android APK:**

```powershell
flutter build apk --release
```

* **Windows Desktop:**

```powershell
flutter build windows
```

---

## 🧪 Testing

Run unit and widget tests:

```powershell
flutter test
```

---

## 📂 Project Structure (Important Files)

* `lib/main.dart` : App entry point
* `lib/home_page.dart` : Home / Book listing UI
* `lib/book_detail.dart` : Book detail view
* `lib/search_page.dart` : Search UI
* `lib/cart_page.dart` : Shopping cart UI
* `lib/*.dart` : Other screens, widgets, and providers

---


## 🤝 Contributing

Contributions are welcome!

* Open an issue or submit a PR with a clear description.
* If you want the app migrated from `provider` to `GetX`, open an issue and it can be assisted.
