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
  <img src="https://github.com/user-attachments/assets/9642354c-d384-4587-a6ea-89b5363a0127" width="220" alt="Ekran główny"/>
  <img src="https://github.com/user-attachments/assets/6903da69-e6b8-477e-bb78-d49b31ddad38" width="220" alt="Ekran pogody"/>
  <img src="https://github.com/user-attachments/assets/91384b2c-1788-4f0c-af92-59df90a33529" width="220" alt="Ekran jakości powietrza"/>
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/01af0474-b032-4ad7-bfaa-cf2aa44e4ed5" width="220" alt="Ekran zgody na lokalizację"/>
  <img src="https://github.com/user-attachments/assets/90063d3f-6ab1-4600-ab26-1de1a8c54da3" width="220" alt="Splash screen"/>
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
