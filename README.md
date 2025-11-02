# 🧠 Dự án Kho Dữ Liệu và Phân Tích (Data Warehouse and Analytics Project)

**Dự án Kho Dữ Liệu và Phân Tích** mô phỏng quy trình **xây dựng kho dữ liệu hiện đại (Data Warehouse)** và **phân tích dữ liệu (Analytics)** từ đầu đến cuối — bao gồm nạp dữ liệu thô, xử lý, mô hình hóa và tạo báo cáo phân tích.

Dự án được phát triển với mục đích **học tập và thực hành**, dựa trên video hướng dẫn của [**Data with Baraa**](https://youtu.be/9GVqKuTVANE?si=gFq-K-7zP8DcsA8B).  
Thông qua dự án này, người thực hiện áp dụng kiến trúc **Medallion Architecture** gồm 3 lớp: **Bronze → Silver → Gold**.

---

## 🏗️ Kiến trúc Dữ liệu (Data Architecture)

Dự án được xây dựng theo mô hình **Medallion Architecture**:

![Data Architecture](docs/data_architecture.png)

1. **Bronze Layer** – Lưu trữ dữ liệu thô (raw data) được nạp trực tiếp từ các file CSV vào cơ sở dữ liệu SQL Server.  
2. **Silver Layer** – Lớp làm sạch, chuẩn hóa và biến đổi dữ liệu, chuẩn bị cho quá trình phân tích.  
3. **Gold Layer** – Lưu trữ dữ liệu đã sẵn sàng cho nghiệp vụ, được mô hình hóa theo **Star Schema** phục vụ báo cáo và phân tích kinh doanh.

---

## 📖 Nội dung Dự án

Các hạng mục chính trong dự án:

1. **Thiết kế kiến trúc dữ liệu** – Xây dựng mô hình kho dữ liệu theo 3 lớp chuẩn công nghiệp.  
2. **ETL Pipelines** – Thực hiện quy trình trích xuất, biến đổi và nạp dữ liệu vào từng lớp.  
3. **Mô hình dữ liệu (Data Modeling)** – Thiết kế các bảng chiều (dimension) và bảng sự kiện (fact) tối ưu cho truy vấn phân tích.  
4. **Phân tích dữ liệu (Analytics)** – Viết các truy vấn SQL để phân tích hành vi khách hàng, hiệu suất sản phẩm và xu hướng doanh số.

🎯 Kỹ năng được áp dụng và rèn luyện:
- Viết và tối ưu **SQL**  
- Thiết kế **mô hình dữ liệu (Star Schema)**  
- Xây dựng **ETL pipelines**  
- Hiểu rõ quy trình vận hành **Data Warehouse & Analytics** hiện đại  

---

## 🛠️ Công cụ Sử dụng

- **SQL Server / SSMS** – Lưu trữ và xử lý dữ liệu.  
- **Draw.io** – Thiết kế sơ đồ kiến trúc và mô hình dữ liệu.  
- **GitHub** – Quản lý mã nguồn và tài liệu dự án.  

---

## 📂 Cấu trúc Thư mục

data-warehouse-project/
│
├── datasets/ # Dữ liệu gốc (ERP và CRM)
│
├── docs/ # Tài liệu dự án và sơ đồ kiến trúc
│ ├── data_architecture.png
│ ├── data_catalog_gold.md
│ ├── data_models.drawio
│
├── scripts/ # Các script SQL cho ETL và mô hình hóa dữ liệu
│ ├── bronze/
│ ├── silver/
│ ├── gold/
│
├── README.md # Giới thiệu dự án
└── LICENSE

yaml
Sao chép mã

---

## 🌟 Ghi chú

Dự án được thực hiện **với mục đích học tập cá nhân**, dựa trên hướng dẫn từ kênh [**Data with Baraa**](https://www.youtube.com/@datawithbaraa).  
Tác giả video đã mang đến nguồn kiến thức thực tế, rõ ràng và hữu ích cho cộng đồng học dữ liệu.

---

📚 *Trong tương lai, dự án sẽ được mở rộng thêm các thành phần như tự động hóa pipeline bằng Airflow/dbt, bổ sung lineage và metadata cho lớp Gold để hoàn thiện hơn.*
