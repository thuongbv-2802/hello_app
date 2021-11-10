=begin
Active Record 
        - một ORM (Object Relational Mapping) nằm giữa database và ứng dụng web. 
        Nó cho phép bạn cấu trúc các model dữ liệu như user, blog, post, comment theo một cách rất logic và gần với tiếng Anh
        Điểm mạnh:
            Độc lập với Database
            Giảm số lượng dòng code
            Query Interface đa dạng
        Rails thực chất là tổng hợp của 7 gem Ruby hoạt động cùng nhau
        Active Record chính là gem đóng vai trò của một ORM
        Active Record giao tiếp với database, nó đóng vai trò là phần M trong MVC của Rails
-------------------------------------------------------------
    Active Record  Migration
        Bạn cần migration khi nào? Đó là khi bạn cần những sự thay đổi về cấu trúc database
        rake db:migrate
        rake db:rollback
        Là một tính năng của Active Record cho phép bạn thay đổi cấu trúc của database và cả dữ liệu trong database
        Syntax
            rails generate migration create_products name:string description:text
            rake db:migrate // thực thi
            rails generate migration add_price_to_products
            rake db:migrate
        rollback
            rake db:rollback  STEP=1
--------------------------------------------------------------
    Active Record  Validations
        Validations là cách để đảm bảo dữ liệu của bạn hợp lệ trước khi lưu vào database
        1_Validations
                Client-side validations
                DB constraints
                    add_index :users, :email , unique: true
                Controller-level validations
            Validations ở model level luôn chỉ chạy khi quá trình create hoặc update 1 bản ghi thông qua ActiveRecord được diễn ra
            Các method dưới đây sẽ gọi vào validations:
                create
                create!
                save
                save!
                update
                update!
            Các method sau sẽ skip validations: save(validate: false)
                decrement!
                decrement_counter
                increment!
                increment_counter
                toggle!
                touch
                update_all
                update_attribute
                update_column
                update_columns
                update_counters

            valid? method sẽ gây nên validations và trả về giá trị false nếu errors.messages rỗng. 
            invalid? chỉ đơn giản là method đảo của valid? . Nó cũng triggers validations với object và trả về giá trị boolean ngược lại với valid?
        2_Validation helper
            acceptance: 
            inclusion: dùng để kiểm tra attribute nhập vào có nằm trong 1 tập hợp các giá trị cho trước không.
                validates :name, inclusion: { in: ["Hiep", "Hieu"] }
            exclusion: Nếu attribute nhập vào không nằm trong tập các giá trị cho trước thì được coi là valid()> false
            presence, absence
            numericality: Helper này dùng để đảm bảo các thuộc tính phải là kiểu Numeric nếu không sẽ rollback
                :greater_than
                :greater_than_or_equal_to
                :equal_to
                :odd
                :even
            uniqueness
        3_option trong validate helper
            allow_nil
            allow_blank
            :on
                validates :age, numericality: { greater_than: 16 }, on: :update
        4_Custom validation
            Custom method
                class Relationship < ApplicationRecord
                    validate :cannot_follow_yourself
                    belongs_to :follower, class_name: User.name
                    belongs_to :followed, class_name: User.name
                    
                    private
                        def cannot_follow_yourself
                        if followed_id == follower_id
                            errors.add(:you, Settings.relationship.cannot_follow_yourself )
                        end
                    end
                end
            Custom validator
--------------------------------------------------------------
    Active Record Callback
        Nó cho phép chúng ta chạy các method tại một thời điểm được định trước.
        Callback tác động trực tiếp đến các thao tác (create, update, destroy)
            ex: before_save :set_name
                def set_name
                    self.name = “Cuong”
                end
        Syntax
            before_validation / after_validation
            before_save / around_save / after_save
            before_create / around_create / after_create
            before_update / around_update / after_update
            before_destroy / around_destroy / after_destroy
            after_initialize và after_find
        Bỏ qua Callbacks
            decrement
            delete
            update_all ...
        Callbacks có điều kiện
            before_save :normalize_card_number, if: :paid_with_card?
            Trước khi save sẽ gọi callback normalize_card_number nếu paid_with_card? trả về true
        Custom Callbacks
--------------------------------------------------------------
    Active Record Associations
        association là một kết nối giữa hai Active Record models
            belongs_to : 1-1
            has_one: 1-1
            has_many: 1-n
            has_many :through n-n
            has_one :through 1-1
            has_and_belongs_to_many n-n
        EX: 
            class Category < ApplicationRecord
                has_many :products, dependent: :destroy   
            end
            ---
            class Product < ApplicationRecord
                belongs_to :category 
            end 
            ---
            // select tất cả product của một category bất kỳ
            @products = Category.first.products
            ---
            // delete category (những products của nó cũng phải được xóa)
            @category.destroy
--------------------------------------------------------------
    ActiveRecord Query Interface
        Retrieving : truy vấn
            find : Truy xuất một hoặc nhiều record tương ứng với primary key
            take: Lấy ra một record (hoặc n records nếu truyền thêm tham số n) ngẫu nhiên không kèm theo order
            first: Lấy ra một record đầu tiên được order theo primary key
            find_by: Tìm record đầu tiên phù hợp với các conditions, return nil nếu không tìm thấy record ngược lại với method find_by! gây ra exception
            pluck: đưa ra array giá trị 1 cột của các records
            first_or_initialize: Muốn lấy ra record nào đó, nếu nó không tồn tại thì tạo mới nó
            first_or_create: Tương tự như first_or_initialize nhưng khi muốn tạo mới 1 record và save luôn vào database thì có thể dùng first_or_create
        Scopes
            

=end