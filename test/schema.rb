ActiveRecord::Migration.verbose = false

ActiveRecord::Schema.define do

  create_table :assets, :force => true do |t|
    t.string :caption
    t.string :resource_type
    t.integer :resource_id
    t.integer :position
  end

  create_table :categories, :force => true do |t|
    t.string :name
    t.string :permalink
    t.text :description
    t.integer :position
  end

  create_table :comments, :force => true do |t|
    t.string :email, :name
    t.text :body
    t.integer :post_id
  end

  add_index :comments, :post_id

  create_table :pages, :force => true do |t|
    t.string :title
    t.text :body
    t.boolean :status
    t.integer :parent_id
  end

  create_table :posts, :force => true do |t|
    t.string :title
    t.text :body
    t.boolean :status
    t.timestamps
    t.datetime :published_at
  end

  create_table :typus_users, :force => true do |t|
    t.string :email, :first_name, :last_name
    t.string :salt, :crypted_password
    t.boolean :status, :default => false
    t.string :roles
    t.string :token
    t.timestamps
  end

  create_table :categories_posts, :force => true, :id => false do |t|
    t.column :category_id, :integer
    t.column :post_id, :integer
  end

  add_index :categories_posts, :category_id
  add_index :categories_posts, :post_id

end