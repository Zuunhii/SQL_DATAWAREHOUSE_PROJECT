# Metadata cho Lớp Gold

## Tổng quan
**Lớp Gold** là lớp dữ liệu ở cấp độ nghiệp vụ, được cấu trúc nhằm phục vụ các nhu cầu **phân tích và báo cáo**. Lớp này bao gồm **các bảng chiều (dimension tables)** và **các bảng sự kiện (fact tables)** cho các chỉ số kinh doanh cụ thể.

---

### 1. **gold.dim_customers**
- **Mục đích:** Lưu trữ thông tin chi tiết về khách hàng, được làm giàu thêm bằng dữ liệu nhân khẩu học và địa lý.
- **Các cột:**

| Tên cột           | Kiểu dữ liệu    | Mô tả                                                                                         |
|-------------------|-----------------|-----------------------------------------------------------------------------------------------|
| customer_key      | INT             | Khóa thay thế (surrogate key) định danh duy nhất cho từng bản ghi khách hàng trong bảng chiều. |
| customer_id       | INT             | Mã định danh duy nhất được gán cho từng khách hàng.                                           |
| customer_number   | NVARCHAR(50)    | Mã định danh chữ và số đại diện cho khách hàng, dùng để theo dõi và tham chiếu.               |
| first_name        | NVARCHAR(50)    | Tên của khách hàng, được ghi nhận trong hệ thống.                                             |
| last_name         | NVARCHAR(50)    | Họ của khách hàng.                                                                            |
| country           | NVARCHAR(50)    | Quốc gia cư trú của khách hàng (ví dụ: 'Australia').                                          |
| marital_status    | NVARCHAR(50)    | Tình trạng hôn nhân của khách hàng (ví dụ: 'Married', 'Single').                              |
| gender            | NVARCHAR(50)    | Giới tính của khách hàng (ví dụ: 'Male', 'Female', 'n/a').                                   |
| birthdate         | DATE            | Ngày sinh của khách hàng, định dạng YYYY-MM-DD (ví dụ: 1971-10-06).                          |
| create_date       | DATE            | Ngày và giờ khi bản ghi khách hàng được tạo trong hệ thống.                                   |

---

### 2. **gold.dim_products**
- **Mục đích:** Cung cấp thông tin về sản phẩm và các thuộc tính liên quan.
- **Các cột:**

| Tên cột              | Kiểu dữ liệu    | Mô tả                                                                                           |
|----------------------|-----------------|--------------------------------------------------------------------------------------------------|
| product_key          | INT             | Khóa thay thế định danh duy nhất cho từng bản ghi sản phẩm trong bảng chiều.                   |
| product_id           | INT             | Mã định danh duy nhất được gán cho sản phẩm để theo dõi và tham chiếu nội bộ.                  |
| product_number       | NVARCHAR(50)    | Mã sản phẩm dạng chữ và số, thường được sử dụng để phân loại hoặc quản lý tồn kho.             |
| product_name         | NVARCHAR(50)    | Tên mô tả sản phẩm, bao gồm các chi tiết như loại, màu sắc, kích cỡ,...                        |
| category_id          | NVARCHAR(50)    | Mã định danh duy nhất cho danh mục sản phẩm, liên kết với phân loại cấp cao hơn.               |
| category             | NVARCHAR(50)    | Phân loại chính của sản phẩm (ví dụ: Bikes, Components) để nhóm các sản phẩm liên quan.        |
| subcategory          | NVARCHAR(50)    | Phân loại chi tiết hơn của sản phẩm trong danh mục chính, như loại sản phẩm cụ thể.             |
| maintenance_required | NVARCHAR(50)    | Cho biết sản phẩm có cần bảo trì hay không (ví dụ: 'Yes', 'No').                               |
| cost                 | INT             | Giá gốc hoặc chi phí cơ bản của sản phẩm, tính theo đơn vị tiền tệ.                             |
| product_line         | NVARCHAR(50)    | Dòng sản phẩm hoặc bộ sản phẩm cụ thể mà sản phẩm thuộc về (ví dụ: Road, Mountain).            |
| start_date           | DATE            | Ngày sản phẩm bắt đầu được bán hoặc sử dụng.                                                   |

---

### 3. **gold.fact_sales**
- **Mục đích:** Lưu trữ dữ liệu giao dịch bán hàng phục vụ phân tích.
- **Các cột:**

| Tên cột         | Kiểu dữ liệu    | Mô tả                                                                                           |
|-----------------|-----------------|--------------------------------------------------------------------------------------------------|
| order_number    | NVARCHAR(50)    | Mã đơn hàng duy nhất, dạng chữ và số (ví dụ: 'SO54496').                                        |
| product_key     | INT             | Khóa thay thế liên kết đơn hàng với bảng chiều sản phẩm.                                         |
| customer_key    | INT             | Khóa thay thế liên kết đơn hàng với bảng chiều khách hàng.                                       |
| order_date      | DATE            | Ngày đơn hàng được tạo.                                                                         |
| shipping_date   | DATE            | Ngày đơn hàng được giao cho khách hàng.                                                         |
| due_date        | DATE            | Ngày đến hạn thanh toán cho đơn hàng.                                                           |
| sales_amount    | INT             | Tổng giá trị tiền tệ của giao dịch, tính theo đơn vị tiền tệ (ví dụ: 25).                       |
| quantity        | INT             | Số lượng sản phẩm được đặt trong dòng giao dịch (ví dụ: 1).                                     |
| price           | INT             | Giá bán mỗi đơn vị sản phẩm trong dòng giao dịch, tính theo đơn vị tiền tệ (ví dụ: 25).         |
