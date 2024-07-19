# CurrencyConverter Uygulaması

Bu Swift kodu, farklı para birimlerinin döviz kurlarını alıp kullanıcıya gösteren bir iOS uygulaması oluşturur. Uygulama, bir API kullanarak güncel döviz kurlarını alır ve etiketler aracılığıyla görüntüler. Kod, temel olarak bir `UIViewController` sınıfını genişletir ve API çağrıları ile JSON verilerini işler.

## Özellikler

- **Etiketler:**
  - `cadLabel`: Kanada Doları (CAD) kurunu gösterir.
  - `chfLabel`: İsviçre Frangı (CHF) kurunu gösterir.
  - `gbpLabel`: İngiliz Sterlini (GBP) kurunu gösterir.
  - `jpyLabel`: Japon Yeni (JPY) kurunu gösterir.
  - `usdLabel`: Amerikan Doları (USD) kurunu gösterir.
  - `tryLabel`: Türk Lirası (TRY) kurunu gösterir.

## View Did Load

- Uygulama başlatıldığında, temel yapılandırma ve etiketlerin ayarlanması yapılır.

## Döviz Kurlarını Getirme

- `getRatesClicked`: Butona tıklanarak API'den döviz kurlarını alma işlemi başlatılır.

### API Kullanımı

1. **Request & Session:**
   - API'ye bağlantı kurmak için URL oluşturulur ve bir oturum başlatılır.
   - `let url = URL(string: "http://data.fixer.io/api/latest?access_key=ac3cf451e543de55a8dd77f41845a3d9")`
   - `let session = URLSession.shared`

2. **Response & Data:**
   - API'den gelen veri, hata kontrolü ile işlenir.
   - `let task = session.dataTask(with: url!) { data, response, error in`

3. **Parsing & JSON Serialization:**
   - JSON verisi işlenir ve döviz kurları etiketlere atanır.
   - `let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>`

### Döviz Kurlarını Güncelleme

- API'den alınan döviz kurları, JSON verisinden ayrıştırılarak ilgili etiketlere atanır.
- `DispatchQueue.main.async { ... }`
- `if let cad = rates["CAD"] as? Double { self.cadLabel.text = "CAD : \(cad)" }`

### Hata Yönetimi

- Hata durumunda, kullanıcıya bir uyarı gösterilir.
- `let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)`
- `self.present(alert, animated: true, completion: nil)`

## Kullanım

- Uygulamayı başlattığınızda, döviz kurlarını görmek için "Get Rates" butonuna tıklayabilirsiniz.
- API'den alınan güncel döviz kurları, ilgili etiketlerde görüntülenecektir.





- ![Simulator Screen Recording - iPhone 15 Pro - 2024-07-19 at 22 32 24](https://github.com/user-attachments/assets/2edecd84-7277-48e1-ba53-ce3dcb5ba429)
