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

ActiveRecord::Schema.define(version: 2019_09_19_013510) do

  create_table "addresses", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "mail", null: false
    t.integer "tel"
    t.integer "postal_code", null: false
    t.string "region", null: false
    t.string "city", null: false
    t.string "street", null: false
    t.string "building"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "bank_accounts", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "bank", null: false
    t.string "account_type", null: false
    t.integer "branch_code", null: false
    t.integer "account_number", null: false
    t.string "account_holder_sei", null: false
    t.string "account_holder_mei", null: false
    t.text "adress", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bank_accounts_on_user_id"
  end

  create_table "brands", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "customer_id", null: false
    t.string "card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry"
  end

  create_table "comments", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "comment", null: false
    t.integer "user_id", null: false
    t.integer "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_comments_on_product_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "contacts", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "product_id"
    t.text "content", null: false
    t.integer "user_id", null: false
    t.integer "information_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "position"
    t.string "category", null: false
    t.index ["information_id"], name: "index_contacts_on_information_id"
    t.index ["product_id"], name: "index_contacts_on_product_id"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "informations", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "content", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "contact_id", null: false
    t.integer "notice_id", null: false
    t.index ["contact_id"], name: "index_informations_on_contact_id"
    t.index ["notice_id"], name: "index_informations_on_notice_id"
    t.index ["user_id"], name: "index_informations_on_user_id"
  end

  create_table "likes", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_likes_on_product_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "notices", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content", null: false
    t.integer "comment_id", null: false
    t.boolean "checked"
    t.integer "user_id", null: false
    t.integer "information_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_notices_on_comment_id"
    t.index ["information_id"], name: "index_notices_on_information_id"
    t.index ["user_id"], name: "index_notices_on_user_id"
  end

  create_table "orders", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "use_point"
    t.integer "payment"
    t.string "payment_way"
    t.integer "delivery_fee"
    t.string "adress"
    t.integer "sell_fee"
    t.integer "sell_gain"
    t.string "buyer_rank"
    t.string "buyer_review"
    t.string "seller_rank"
    t.string "seller_reveiw"
    t.boolean "payment_check"
    t.boolean "delivery_check"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "buyer_id", null: false
    t.index ["buyer_id"], name: "index_orders_on_buyer_id"
    t.index ["product_id"], name: "index_orders_on_product_id"
  end

  create_table "points", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "point", null: false
    t.text "reason", null: false
    t.integer "user_id", null: false
    t.integer "order_id", null: false
    t.integer "dead_line", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_points_on_order_id"
    t.index ["user_id"], name: "index_points_on_user_id"
  end

  create_table "product_images", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id"
    t.index ["product_id"], name: "index_product_images_on_product_id"
  end

  create_table "products", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.integer "category_id", null: false
    t.integer "user_id"
    t.integer "brand_id", default: 1
    t.string "size", null: false
    t.string "state", null: false
    t.string "delivery_burden", null: false
    t.string "delivery_way", null: false
    t.string "delivery_from", null: false
    t.string "delivery_time", null: false
    t.text "detail"
    t.integer "likes_count"
    t.boolean "sold", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0, null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["delivery_burden"], name: "index_products_on_delivery_burden"
    t.index ["name"], name: "index_products_on_name"
    t.index ["size"], name: "index_products_on_size"
    t.index ["sold"], name: "index_products_on_sold"
    t.index ["state"], name: "index_products_on_state"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "sales", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "price", null: false
    t.string "reason", null: false
    t.integer "user_id"
    t.integer "dead_line"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sales_on_user_id"
  end

  create_table "todo_lists", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "order_id", null: false
    t.text "content", null: false
    t.integer "transaction_message_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_todo_lists_on_order_id"
    t.index ["transaction_message_id"], name: "index_todo_lists_on_transaction_message_id"
    t.index ["user_id"], name: "index_todo_lists_on_user_id"
  end

  create_table "transaction_messages", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "user_id", null: false
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_transaction_messages_on_order_id"
    t.index ["user_id"], name: "index_transaction_messages_on_user_id"
  end

  create_table "users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: ""
    t.string "encrypted_password", default: ""
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "first_name"
    t.string "last_name"
    t.string "first_kana_name"
    t.string "last_kana_name"
    t.string "nickname"
    t.text "profile"
    t.string "payment_way"
    t.string "birthday"
    t.text "confirmation_document"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["first_name"], name: "index_users_on_first_name"
    t.index ["last_name"], name: "index_users_on_last_name"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "bank_accounts", "users"
  add_foreign_key "comments", "products"
  add_foreign_key "comments", "users"
  add_foreign_key "contacts", "informations"
  add_foreign_key "contacts", "products"
  add_foreign_key "contacts", "users"
  add_foreign_key "informations", "contacts"
  add_foreign_key "informations", "users"
  add_foreign_key "likes", "products"
  add_foreign_key "likes", "users"
  add_foreign_key "notices", "comments"
  add_foreign_key "notices", "informations"
  add_foreign_key "notices", "users"
  add_foreign_key "orders", "products"
  add_foreign_key "points", "orders"
  add_foreign_key "points", "users"
  add_foreign_key "product_images", "products"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "users"
  add_foreign_key "sales", "users"
  add_foreign_key "todo_lists", "orders"
  add_foreign_key "todo_lists", "transaction_messages"
  add_foreign_key "todo_lists", "users"
  add_foreign_key "transaction_messages", "orders"
  add_foreign_key "transaction_messages", "users"
end
