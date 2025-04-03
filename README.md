# 🌤 SkyPulse

SkyPulse to aplikacja mobilna stworzona we Flutterze, która pozwala na monitorowanie jakości powietrza oraz pogody w Twojej okolicy. Łączy dane pogodowe z informacjami o zanieczyszczeniach, oferując przejrzysty interfejs i spersonalizowane porady zdrowotne.

---

## ✨ Funkcje

✅ Wyświetlanie jakości powietrza:  
&nbsp;&nbsp;&nbsp;&nbsp;• CAQI  
&nbsp;&nbsp;&nbsp;&nbsp;• PM2.5 i PM10  
&nbsp;&nbsp;&nbsp;&nbsp;• Nazwa stacji pomiarowej  

✅ Informacje pogodowe:  
&nbsp;&nbsp;&nbsp;&nbsp;• Temperatura i temperatura odczuwalna  
&nbsp;&nbsp;&nbsp;&nbsp;• Ciśnienie atmosferyczne  
&nbsp;&nbsp;&nbsp;&nbsp;• Prędkość wiatru  
&nbsp;&nbsp;&nbsp;&nbsp;• Opady (jeśli dostępne)  

✅ Dynamiczne tła i ikony w zależności od warunków  
✅ Obsługa lokalizacji użytkownika (z ekranem zgody)  
✅ Ekran powitalny (SplashScreen)  
✅ Przejrzysty, nowoczesny design  

---

## 📸 Zrzuty ekranu

<p align="center">
  <img src="https://github.com/user-attachments/assets/bb0c16ba-d851-46c4-abc6-013b956cf830" width="220" alt="Ekran pierwszego uruchomienia"/>
  <img src="https://github.com/user-attachments/assets/3586f1ba-a4cd-42a8-9768-15ed44af8247" width="220" alt="Ekran uprawnień lokalizacji"/>
  <img src="https://github.com/user-attachments/assets/300e84e8-b17f-4327-bd88-3ebb5f2945a3" width="220" alt="Ekran ładowania (splash-screen)"/>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/7c8af30a-0a1f-4e8b-b5cd-46789143dafb" width="220" alt="Ekran jakości powietrza"/>
  <img src="https://github.com/user-attachments/assets/b1e68978-bba8-4706-8cad-f0a2952849e0" width="220" alt="Ekran pogody"/>
</p>

---

## 🚀 Jak uruchomić

1. Sklonuj repozytorium:
```bash
git clone https://github.com/TexablePlum/Sky_Pulse.git
cd SkyPulse
```

2. Zainstaluj zależności:
```bash
flutter pub get
```

3. Konfiguracja API:
Zaktualizuj klucze API w pliku SplashScreen.dart:
  - Weather API: Ustaw swój klucz w konstruktorze WeatherFactory.
  - WAQI API: Wstaw swój token przy budowaniu adresu URL pobierającego dane o jakości powietrza.

4. Uruchom aplikację na emulatorze/urządzeniu lub web:
```bash
flutter run
```

## 🧱 Technologie

  - Flutter + Dart
  - weather – dane pogodowe
  - geolocator – lokalizacja
  - Google Fonts
  - Sliding Up Panel

## 📁 Struktura projektu
```
lib/
├── main.dart                  # Punkt wejścia
├── SplashScreen.dart          # Ekran powitalny i logika pobierania danych
├── PermissionScreen.dart      # Prośba o zgodę na lokalizację
├── MyHomePage.dart            # Ekran główny z bottom navigation
├── AirScreen.dart             # Ekran jakości powietrza
└── WeatherScreen.dart         # Ekran pogody
```

## 📄 Licencja
Projekt objęty licencją MIT – możesz używać, kopiować i rozwijać jak tylko chcesz!
[LICENSE](LICENSE)
