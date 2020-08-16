# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_816_094_828) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'comments', force: :cascade do |t|
    t.text     'text'
    t.integer  'course_id'
    t.integer  'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['course_id'], name: 'index_comments_on_course_id', using: :btree
    t.index ['user_id'], name: 'index_comments_on_user_id', using: :btree
  end

  create_table 'course_join_requests', force: :cascade do |t|
    t.integer  'student_id'
    t.integer  'course_id'
    t.datetime 'request_time'
    t.boolean  'approve'
    t.datetime 'created_at',   null: false
    t.datetime 'updated_at',   null: false
    t.index ['course_id'], name: 'index_course_join_requests_on_course_id', using: :btree
    t.index ['student_id'], name: 'index_course_join_requests_on_student_id', using: :btree
  end

  create_table 'courses', force: :cascade do |t|
    t.text     'information'
    t.string   'title'
    t.text     'content'
    t.datetime 'start_datetime'
    t.datetime 'end_datetime'
    t.integer  'students_length'
    t.datetime 'created_at',                      null: false
    t.datetime 'updated_at',                      null: false
    t.boolean  'approve', default: false
    t.integer  'teacher_id'
    t.index ['teacher_id'], name: 'index_courses_on_teacher_id', using: :btree
  end

  create_table 'users', force: :cascade do |t|
    t.string   'email',                  default: '', null: false
    t.string   'encrypted_password',     default: '', null: false
    t.string   'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at',                          null: false
    t.datetime 'updated_at',                          null: false
    t.string   'name'
    t.string   'type'
    t.index ['email'], name: 'index_users_on_email', unique: true, using: :btree
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true, using: :btree
  end
end
