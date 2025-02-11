# 📱 Phone Dialer App  

This is a **Phone Dialer App** built using **Flutter** that allows users to:  
✅ Dial and make phone calls  
✅ View recent call history  
✅ Manage contacts (save, search, and list)  
✅ Toggle between **light and dark mode**  

---

## 🚀 Features  

### 1️⃣ **Dial Pad**  
- A user-friendly dial pad interface  
- Allows users to input numbers and initiate calls  
- Backspace functionality to delete digits  

### 2️⃣ **Call History**  
- Displays recent call logs (incoming, outgoing, missed calls)  
- Fetches call logs using **device permissions**  

### 4️⃣ **Dark Mode Toggle 🌙**  
- Users can switch between **light mode** and **dark mode**  

### 5️⃣ **Error Handling & Debugging**  
- Handles device permissions gracefully  
- Displays appropriate error messages when necessary  

---

## 🛠️ Technologies Used  

- **Flutter** (Dart)  
- **Provider** (for state management)  
- **Flutter Call Log Plugin** (for call history)  
- **Url Launcher** (for making calls)  

---

## 📂 Folder Structure  

📦 phone_dialer_app ┣ 📂 lib ┃  ┣ 📜 dial_pad_screen.dart ┃ ┃ ┣ 📜 call_history_screen.dart ┃ ┃ ┣ 📜 contacts_screen.dart ┃ ┣ 📜 main.dart ┣ 📜 pubspec.yaml ┣ 📜 README.md ┗ 📜 .gitignore



---

## ⚡ Installation & Setup  

### **1️⃣ Clone the Repository**  
```sh
git clone https://github.com/Aashich64/phone-dialer-app.git
cd phone-dialer-app

2️⃣ Install Dependencies
flutter pub get

3️⃣ Run the App
flutter run
Make sure to enable the required device permissions!

🔑 Required Permissions
To fetch call logs and make calls, add the following permissions in AndroidManifest.xml:

<uses-permission android:name="android.permission.CALL_PHONE" />
<uses-permission android:name="android.permission.READ_CONTACTS" />
<uses-permission android:name="android.permission.WRITE_CONTACTS" />
<uses-permission android:name="android.permission.READ_CALL_LOG" />

📝 Notes
This app is tested on Android API 24 and above
Only basic contact management is implemented
📌 Future Enhancements
🔹 Block/Unblock numbers
🔹 Google Contacts API integration
🔹 More advanced UI/UX improvements

🤝 Contributing
Feel free to contribute! Fork this repo and submit a pull request.

