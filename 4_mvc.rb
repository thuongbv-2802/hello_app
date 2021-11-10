=begin
    BROWER > ROUTERS > CONTROLLER > MODEL > VIEW

    - ROUTER 
        config/router
        resources:name
        root "name_controller/method"
    - CONTROLLER
        render json: @users
        before_action: [gọi hành động trước khi thực hiện 1 hành động khác]
        respond_to do |format|: [thực thi 1 block, chuyển 1 phản hồi thành 1 đối số]
    - MODEL
        has_many :microposts [1-N]
        belongs_to :user [1-1]
        validates :content, length: { maximum: 140 }, presence: true [check null]
=end

=begin
1_resources
    - Resources : lệnh tạo ra 7 routers ánh sạ tới controller    (index, new, create, show, edit, update, destroy)
        HTTP Verb	Path	        Controller#Action	User for
        GET	        /users	        users#index	    Hiển thị tất cả user
        GET	        /users/new	    users#new	    Trả về form HTML để tạo mới user
        POST	    /users	        users#create	Tạo mới user
        GET	        /users/:id	    users#show	    Hiển thị một user
        GET	        /users/:id/edit	users#edit	    Trả về form HTML để sửa user
        PATCH/PUT	/users/:id	    users#update	Cập nhật một user
        DELETE	    /users/:id	    users#destroy	Xóa một user

    - Resource : lệnh tạo ra 6 routers ánh sạ tới controller (new, create, show, edit, update, destroy)
        Các route không sử dụng đến id 
        Sử dụng cho người dùng xem thông tin của chính họ 

    - Việc tạo ra resourceful route cũng tạo ra 1 số helper cho controller (path và url)
        users_path:             trả về tất cả các user
        new_user_path:            trả về user/new
        edit_user_path(:id):    Trả về /user/:id/edit
        user_path(:id)            Trả về /users/:id

    - Namespace : nhóm các controller lại 
        ex: namespace :admin do 
                resources :articles, :comments
            end

    - Giới hạn route muốn sử dụng 
        ex: resources :posts, only: [:index, :show] // chỉ cho phép 2 route
            resources :users, except : [:index] // cho phép tất cả route chỉ trừ 

    - Non-restful route 
        ex: get "/help", to: "static_pages#help" // tạo route riêng và ánh sạ nó vào controller
    
    - Nested Resources (lồng nhau): phản ánh mối quan hệ has_many(1-n) giữa các model trong routes và sau đó thể hiện nó qua urls
        DRY (don't repeat yourself)
        ex: Một club có nhiều fighter và 1 fighter thuộc về 1 club
                #app/models/club.rb
                class Club < ActiveRecord::Base
                    has_many :fighters
                end

                #app/models/fighter.rb
                class Fighter < ActiveRecord::Base
                    belongs_to :club
                end
            In Router
                resources :clubs do
                    resources :fighters
                end

=end