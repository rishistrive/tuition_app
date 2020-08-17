# README

This README would normally document whatever steps are necessary to get the
application up and running.

## Install

### Clone the repository

```shell
git clone https://github.com/rishistrive/tuition_app.git
cd project
```

Things you may want to cover:

* Ruby version

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby-2.7.0`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 2.5.1
```

* Rails version

### Check your Rails version

```shell
rails -v
```

The ouput should start with something like `5.0.7.2`

If not, install the right rails version using [rbenv](https://rubygems.org/gems/rails/versions) (it could take a while):

```shell
gem install rails -v '5.0.7.2'
```


* System dependencies

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```shell
bundle install
```


* Database creation

* Database initialization

```shell
rails db:create db:migrate db:seed
```

You can login as super admin with cred.
Email:   admin@tutionapp.com
Password:   123456'

You can login as teacher.
Email:   teacher@tutionapp.com
Password:   123456

You can login as student.
Email:   student@tutionapp.com
Password:   123456

* How to run the test suite

* Run rspec

rspec .

For getting more information of running [rspec](https://github.com/rspec/rspec-rails)

* Run cucumber


rake cucumber

For getting more information of running [rspec](https://github.com/cucumber/cucumber-rails)

