# Port Listener Tool

Bu araç, Linux sunucularında dinlenen bağlantı noktalarını ve ilgili süreçleri kolayca bulmanızı sağlar. Bash script'i, sisteminizdeki açık olan portları ve bu portları kullanan süreçlerin adlarını ve PID'lerini listeler.

## Başlarken

Bu script'i çalıştırmadan önce, sisteminizde `ss` ve `lsof` komutlarının kurulu olduğundan emin olun. Bu araçlar, bağlantı noktaları ve süreç bilgilerini toplamak için gereklidir.

### Önkoşullar

- `ss`: Bu komut, soket istatistiklerini görüntülemek için kullanılır.
- `lsof`: Açık dosyaları ve onları kullanan süreçleri listeleyen bir araçtır.

Bu komutları yüklemek için genellikle aşağıdaki komutları kullanabilirsiniz:

```bash
sudo apt-get update
sudo apt-get install net-tools lsof
```

### Kurulum

Script'i kullanabilmek için, aşağıdaki adımları izleyin:

1. Script dosyasını bilgisayarınıza indirin.
2. Dosyaya çalıştırma izni verin:

```bash
chmod +x port_listener.sh
```

3. Script'i çalıştırın:

```bash
./port_listener.sh
```

## Kullanım

Script çalıştırıldığında, sistemdeki tüm dinlenen portları ve bu portlarla ilişkili süreçleri listeler. Çıktı, her port için bir bölüm içerir ve her bölümde bağlantı noktası numarası, süreç adı ve süreç ID'si (PID) yer alır.

Örneğin:

```
Open Ports on your-hostname:
===========================
Port: 22
Process: sshd (PID: 1953)

Port: 80
Process: apache2 (PID: 504)
```

### Notlar

- Bazı portlar ve süreçler yüksek ayrıcalıklar gerektirebilir. Eğer yeterli izne sahip değilseniz, script bazı süreçleri "Not found or requires elevated permissions." olarak listeler.

