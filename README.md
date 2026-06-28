# 🎮 Robo Dodge Shooter (PC & Android Prototype)

[TR] Bu proje, **Godot 4+ (Compatibility Mode)** kullanılarak geliştirilmiş, endüstri standardında klasörleme mimarisine ve temiz kod disiplinine sahip iki boyutlu (2D) bir **Twin-Stick Arcade Shooter** oyun prototipidir. Proje, portföy sunumu amacıyla tek bir repo altında hem **PC (Klavye)** hem de **Android (Yatay/Çift Sanal Joystick)** sürümlerini barındırmaktadır.

[EN] This project is a two-dimensional (2D) **Twin-Stick Arcade Shooter** game prototype developed using **Godot 4+ (Compatibility Mode)**, featuring industry-standard folder architecture and clean code discipline. For portfolio presentation purposes, it hosts both **PC (Keyboard)** and **Android (Landscape/Dual Virtual Joystick)** versions under a single repository.

---
## 📸 Gameplay & UI Preview



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

res://
 ├─ scenes/              # Modüler sahneler / Modular scenes
 │   ├─ main_menu.tscn   # Karakter seçimli ana menü / Main menu with character selection
 │   ├─ main.tscn        # Core gameplay dünyası / Core gameplay world
 │   ├─ player.tscn      # Oyuncu gövdesi / Player body
 │   ├─ enemy.tscn       # 15 varyasyonlu düşman şablonu / 15-variation enemy template
 │   └─ laser.tscn       # Lazer mermisi sahnesi / Laser projectile scene
 ├─ scripts/             # Sahnelerden ayrıştırılmış kodlar / Decoupled logic scripts
 │   ├─ global.gd        # Veri tutan Autoload / Global data Autoload
 │   ├─ main_menu.gd     # Menü arayüz mantığı / Menu UI logic
 │   ├─ game_manager.gd  # Skor ve zorluk yönetimi / Score and difficulty management
 │   ├─ player.gd        # Fizik motoru ve ateşleme / Physics and shooting mechanics
 │   ├─ enemy.gd         # Rastgele sprite atama / Random sprite assignment
 │   └─ virtual_joystick.gd # Akıllı ortak joystick kodu / Intelligent shared joystick code
 └─ assets/              # Dış kaynaklar / External resources
     ├─ sprites/         # Arka planı temizlenmiş PNG'ler / Transparent PNG sprites
     ├─ fonts/           # Retro yazı tipleri / Retro typography
     └─ sounds/          # SFX ve müzik kütüphanesi / SFX and music library

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
