=begin
    - Module : 
    Tương tự như các lớp 
    Chứa các phương thức
    Không thể khởi tạo nhanh 
    - Benefit 
    Với các module, bạn có thể chia sẻ phương thức giữa các lớp (các module có thể đưa vào các mới và làm cho các phương thức của chúng có sẵn trên lớp)
=end
module Cream
    def cream?
        true
    end
    end
    
    class Cookie
    include Cream
    end
    
    cookie = Cookie.new
    p cookie.cream?

