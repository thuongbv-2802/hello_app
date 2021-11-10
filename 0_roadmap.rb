=begin
1_ Create app
    a_ create app
        $ rails new my_project
        $ cd my_project 
        $ rails server / $ rails server -b localhost -p 8000
        bundle install --without production
    b_ setup git
        $ git init
        $ git add .
        $ git commit -m 'create app'
        $ git log
        $ git remote add [my_project] [url_git]
        $ git checkout -b my_project    // create new branch
        $ git push --set-upstream my_project my_project    // push server
2_create generate scaffold
    rails g model User name:string password_digest:string
    create has_many/ belongs_to
3_ static_page
4_filling layout
    gem 'bootstrap-sass', '~> 3.4.1'
    gem 'sassc-rails', '>= 2.1.0'
=end