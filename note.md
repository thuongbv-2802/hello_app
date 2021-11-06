# Rails

https://www.railstutorial.org/book/toy_app

## Scaffolding: Quicker, easier, more seductive

- Ngăn cài đặt Gem từ production 
    bundle config set --local without production

### Data model

#### User model 

- Table user

    ![alt_text](imgs/01_data_model.png)

#### Micropost model 

- Table micropost

    ![alt_text](imgs/02_data_model.png)

#### The user resource :

- scaffold

    <pre>$ rails generate scaffold User name:string email:string </pre>
> Create db/migrate <br>
> Create model user<br>
> Create router : resources (7 method) <br>
> Create users_controller<br>
> Create views users<br>
> Create helpers users_helps<br>
> Create assets/stylesheets/*.css<br>

   <pre>$ rails db: migrate</pre>
 - Migrating the database.

#### MVC 

- Model controller view

    ![alt_text](imgs/03_mvc.png)

Dưới đây là tóm tắt các bước được hiển thị trong Hình  2.12 :

- Trình duyệt đưa ra yêu cầu đối với URL / users.
- Rails định tuyến / người dùng đến indexhành động trong bộ điều khiển Người dùng.
- Các indexhành động yêu cầu mô hình tài khoản để lấy tất cả người dùng ( User.all).
- Mô hình Người dùng lấy tất cả người dùng từ cơ sở dữ liệu.
- Mô hình Người dùng trả về danh sách người dùng cho bộ điều khiển.
- Bộ điều khiển nắm bắt người dùng trong @usersbiến, biến này được chuyển đến indexchế độ xem.
- Chế độ xem sử dụng Ruby được nhúng để hiển thị trang dưới dạng HTML.
- Bộ điều khiển chuyển HTML trở lại trình duyệt. 4

Representational State Transfer.

    ![alt_text](imgs/04_rest_api.png)


