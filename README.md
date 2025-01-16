# Jupyter Lab Server with Docker

<!-- ตรวจสอบให้แน่ใจว่ารูปภาพอยู่ในโฟลเดอร์เดียวกับ README.md -->
<img src="./page1.jpg" alt="Image1" />
<img src="./page2.jpg" alt="Image2" />

## อ่านเพิ่มเติม
[อ่านบทความเพิ่มเติมที่นี่](https://medium.com/p/0059745f7df5/edit)

---

## วิธีการรัน

1. เปลี่ยนไดเรกทอรีไปยังโฟลเดอร์โปรเจกต์:
   ```bash
   cd "/data/miniconda_docker7705"
   ```

2. เรียกใช้งาน Docker Compose:
   ```bash
   sudo docker-compose up -d
   ```

---

## การอัปเดตใหม่หลังหยุดการทำงาน

- ใช้คำสั่งต่อไปนี้เพื่ออัปเดต:
  ```bash
  sudo docker-compose up -d
  ```

- หากต้องการสร้าง `temp image` ใหม่โดยไม่ใช้แคช:
  ```bash
  sudo docker-compose build --no-cache
  ```

---

## วิธีการหยุดเซิร์ฟเวอร์

- ใช้คำสั่งต่อไปนี้:
  ```bash
  sudo docker-compose down
  ```
