# 🎮 Robo Dodge Shooter (PC & Android Prototype)

[TR] Bu proje, **Godot 4+ (Compatibility Mode)** kullanılarak geliştirilmiş, endüstri standardında klasörleme mimarisine ve temiz kod disiplinine sahip iki boyutlu (2D) bir **Twin-Stick Arcade Shooter** oyun prototipidir. Proje, portföy sunumu amacıyla tek bir repo altında hem **PC (Klavye)** hem de **Android (Yatay/Çift Sanal Joystick)** sürümlerini barındırmaktadır.

[EN] This project is a two-dimensional (2D) **Twin-Stick Arcade Shooter** game prototype developed using **Godot 4+ (Compatibility Mode)**, featuring industry-standard folder architecture and clean code discipline. For portfolio presentation purposes, it hosts both **PC (Keyboard)** and **Android (Landscape/Dual Virtual Joystick)** versions under a single repository.

---

## 📸 Gameplay & UI Preview

<img width="1280" height="720" alt="01-Open-screen" src="https://github.com/user-attachments/assets/86a0ebfe-3db8-4cbf-96c2-83db7cd22860" />
<img width="1280" height="720" alt="02-Open-screen" src="https://github.com/user-attachments/assets/3081cd8c-3ff9-45c0-b532-5e257e94c04f" />
<img width="1280" height="720" alt="03-In-game-pc" src="https://github.com/user-attachments/assets/f1709b43-7ea2-498f-b22e-68ba17baa652" />
<img width="1280" height="720" alt="04-In-game-pc" src="https://github.com/user-attachments/assets/27d56f9e-87c1-454a-a868-7662722ac32a" />
<img width="1280" height="720" alt="05-In-game-android" src="https://github.com/user-attachments/assets/59d995e6-6732-4e17-85b8-15b133ae6d2d" />
<img width="1280" height="720" alt="06-In-game-android" src="https://github.com/user-attachments/assets/24eb72e0-3bd2-41bd-a997-94a0e7a13951" />
<img width="1366" height="781" alt="07-gameover" src="https://github.com/user-attachments/assets/e4f05871-25dc-4e09-a84d-93c19e194483" />

---

## 🎯 Projenin Temel Özellikleri & Game Loop / Core Features & Game Loop

### [TR] Türkçe
* **Sonsuz Arcade Döngüsü:** Oyna → Skor Kazan → Zorluk Artışı → Çarpışma (Game Over) → Yeniden Başlat (Restart).
* **Dinamik Zorluk Eğrisi (DDA):** Süre ilerledikçe düşmanların doğma sıklığı (`Timer`) matematiksel olarak kısalır (`0.25` saniye limitine kadar) ve oyun kademeli olarak zorlaşır.
* **Karakter Seçim Sistemi (Autoload):** Ana menüde seçilen 5 farklı gemiden hangisi seçilirse, global hafıza (`global.gd`) sayesinde oyun sahnesine o gemi aktarılır.
* **Dengeli Skor & Başarım Sistemi:** Hayatta geçirilen süre boyunca bir miktar puan kazanılır. Robot vurulduğunda ise +10 puan eklenir. Skor her 100 ve katlarına ulaştığında özel bir başarım sesi tetiklenir.
* **Ses Tasarımı (5'li Set):** Ateş, patlama, arka plan müziği, 100 puan barajı ve elenme (Game Over) sesleri sahneler arası kesintisiz şekilde yönetilir.

### [EN] English
* **Infinite Arcade Loop:** Play → Score Points → Dynamic Difficulty → Collision (Game Over) → Restart.
* **Dynamic Difficulty Adjustment (DDA):** As time progresses, the enemy spawn interval (`Timer`) mathematically shrinks (down to a `0.25`-second limit), making the game progressively harder.
* **Character Selection System (Autoload):** Whichever of the 5 unique ships is selected in the main menu, that specific asset is dynamically spawned into the game scene via global memory (`global.gd`).
* **Balanced Scoring & Milestones:** Points are earned throughout the time spent alive. Destroying a robot rewards +10 points. A unique milestone sound triggers every time the score reaches multiples of 100.
* **Audio Design (5-Piece Set):** SFX and music for shooting, explosions, background loop, 100-point milestones, and elimination (Game Over) are seamlessly managed across scenes.

---

## 📁 Proje Mimarisi / Project Architecture

[TR] Proje, asset üretiminden kodlamaya geçiş sürecinde karmaşayı önlemek adına tamamen modüler ve ölçeklenebilir bir klasörleme yapısıyla kurgulanmıştır. Görseller değişken çözünürlüklerde (organik boyutlarda) olmasına rağmen, tamamı şeffaf arka planlı (transparent PNG) olarak optimize edilmiştir.

[EN] The project is structured with a modular and scalable directory layout to ensure a clean transition from asset creation to coding. Although the sprites feature variable, organic pixel resolutions, they are fully optimized with transparent backgrounds (PNG format).

### 💻 PC Sürümü / PC Version (`PC_Version`)
res://

├─ scenes/                   # Modüler sahneler / Modular scenes

│      ├─ main_menu.tscn        # Ana menü / Main menu

│      ├─ main.tscn             # Oyun dünyası / Core gameplay

│      ├─ player.tscn           # Oyuncu gövdesi / Player body

│      ├─ enemy.tscn            # Düşman şablonu / Enemy template

│      ├─ laser.tscn            # Lazer mermisi / Laser scene

│      └─ music_controller.tscn # Müzik yöneticisi / Music controller

├─ scripts/                  # İş mantığı kodları / Decoupled logic scripts

│      ├─ global.gd             # Hafıza Autoload / Data Autoload

│      ├─ main_menu.gd          # Menü mantığı / Menu logic

│      ├─ game_manager.gd       # Skor ve zorluk / Score and difficulty

│      ├─ player.gd             # Fizik motoru / Physics motor

│      ├─ enemy.gd              # Rastgele sprite atama / Random sprite

│      ├─ laser.gd              # Mermi hareketi / Projectile movement

│      └─ input_manager.gd      # Girdi yöneticisi / Keyboard input manager

└─ assets/                   # Dış kaynaklar / External resources

│      ├─ sprites/              # Arka planı temizlenmiş PNG'ler / Transparent PNG sprites

│      ├─ fonts/                # Retro yazı tipi / Retro typography

│      └─ sounds/               # SFX ve müzik kütüphanesi / SFX and music library



### 📱 Android Sürümü / Android Version (`Android_Version`)
res://

├─ scenes/              # Modüler sahneler / Modular scenes

│   ├─ main_menu.tscn   # Karakter seçimli ana menü / Main menu with character selection

│   ├─ main.tscn        # Oyun dünyası / Core gameplay

│   ├─ player.tscn      # Oyuncu gövdesi / Player body

│   ├─ enemy.tscn       # 15 varyasyonlu düşman / 15-variation enemy template

│   ├─ laser.tscn       # Lazer mermisi sahnesi / Laser projectile scene

│   └─ music_controller.tscn # Müzik yöneticisi / Music controller

├─ scripts/             # İş mantığı kodları / Decoupled logic scripts

│   ├─ global.gd        # Veri tutan Autoload / Global data Autoload

│   ├─ main_menu.gd     # Menü arayüz mantığı / Menu UI logic

│   ├─ game_manager.gd  # Skor ve zorluk yönetimi / Score and difficulty management

│   ├─ player.gd        # Fizik motoru ve ateşleme / Physics and shooting mechanics

│   ├─ enemy.gd         # Rastgele sprite atama / Random sprite assignment

│   ├─ laser.gd         # Mermi hareketi / Projectile movement

│   ├─ input_manager.gd # Girdi yöneticisi / Touch input manager

│   └─ virtual_joystick.gd # Akıllı ortak joystick kodu / Intelligent shared joystick code

└─ assets/              # Dış kaynaklar / External resources

│   ├─ sprites/         # Arka planı temizlenmiş PNG'ler / Transparent PNG sprites

│   ├─ fonts/           # Retro yazı tipi / Retro typography

│   └─ sounds/          # SFX ve müzik kütüphanesi / SFX and music library


---

## 🕹️ Platform Kontrolleri / Platform Controls

### 💻 PC Sürümü (`PC_Version`)
* **[TR]** Hareket için `WASD` veya `Yön Tuşları`. Ateş etmek için `SPACE` tuşuna basılı tutarak doğrusal dikey lazer yağmuru. Yeniden başlama için `R` tuşu veya UI butonu.
* **[EN]** Movement via `WASD` or `Arrow Keys`. Continuous linear vertical laser fire by holding the `SPACE` key. Restart via the `R` key or UI button on elmination.

### 📱 Android Sürümü (`Android_Version`)
* **[TR]** Yatay (Landscape) başparmak ergonomisi. Sol Sanal Joystick pürüzsüz hareketi sağlar. Sağ Sanal Joystick, itildiği andan itibaren yukarı yönlü seri ateşleme başlatır; parmak çekilince ateş kesilir.
* **[EN]** Landscape orientation for optimal thumb ergonomics. Left Virtual Joystick handles smooth physical movement. Right Virtual Joystick triggers rapid upward fire when pushed and ceases fire when released.

---

## 🛠️ Teknik Çözümler ve Optimizasyonlar / Technical Solutions & Optimizations

1. **Pixel Art Crispness / Piksel Sanatı Netliği:**
   * **[TR]** Farklı çözünürlükteki görsellerin ekranda büyütüldüğünde bulanıklaşmasını engellemek için `Default Texture Filter` ayarı `Nearest` olarak kilitlenmiştir.
   * **[EN]** To prevent multi-resolution sprites from blurring when scaled on high-res displays, the `Default Texture Filter` is strictly locked to `Nearest`.

2. **Memory Management / Hafıza Yönetimi (`queue_free`):**
   * **[TR]** Ekran sınırlarından taşan tüm düşman robotlar ve mermiler, işlemciyi yormaması için anında hafızadan tamamen imha edilir.
   * **[EN]** All enemy units and projectiles that exit screen boundaries are instantly wiped from memory using `queue_free()` to prevent CPU leaks and sustain high frame rates.

3. **Flexible Collision / Esnek Çarpışma Algılama:**
   * **[TR]** Düşman görsellerinin boyutları sabit (64x64) olmadığı için, çarpışma algılaması dairesel (`CircleShape2D`) ve grup sistemi (`mobs`) üzerinden dinamik hale getirilmiştir. Bu sayede her boyuttaki robot mermiler tarafından kusursuzca vurulabilir.
   * **[EN]** Since the enemy sprites vary in resolution rather than being uniform (64x64), collision detection is calculated dynamically via circular shapes (`CircleShape2D`) and the Godot Group system (`mobs`). This ensures pixel-perfect projectile hits regardless of the sprite size.

4. **Collision Layers Optimization / Çarpışma Katmanları:**
   * **[TR]** Performansı korumak için nesneler sadece ilgili çarpışma maskelerini (`Monitoring / Monitorable`) dinleyecek şekilde optimize edilmiştir.
   * **[EN]** Physics performance is maximized by tuning specific Collision Layers and Masks, enforcing strict `Monitoring` rules so nodes only listen to essential interactive objects.
