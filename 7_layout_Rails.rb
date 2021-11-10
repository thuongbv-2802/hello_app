=begin
 -  layout là tập tin định nghĩa các đoạn html bao quanh template được render bởi action của các controller.
    Các loại layout
----------------------------------
    Application layout 
        <%= yield %> sẽ chỉ định nơi template của action của các controller được render bên trong layout.
    Controller specific layout
        Khi một file layout được tạo ra có tên trùng với tên của controller thì tập tin đó sẽ được sử dụng như layout của controller có tên tương ứng thay cho file layouts/application.html.erb
    Dynamic layout
        class UsersController < ApplicationController
            layout :dynamic_layout

            private
            def dynamic_layout
                if true # replace for if current_user.admin?
                    "admin" #layout admin
                else
                    "users" #layout user
                end
            end
        end    
    
=end