# **Question 7 - Identification of the problem you are trying to solve by building this particular marketplace app.**

The problem I’m trying to solve is the sometimes confusing and frustrating task of completing a gen 1 pokémon set collection.

# **Question 8 - Why is it a problem that needs solving?**

My Marketplace app solves this by only having gen 1 cards. So, there’s no getting confused by all the different generations and sets, like on other pokémon marketplaces.


# **Question 9 - A link (URL) to your deployed app (i.e. website)**


[PokeMart](https://rails-marketplace-app-t2a2.herokuapp.com/)


# **Question 10 - A link to your GitHub repository (repo)**


[GitHub](https://github.com/Tia-Koenig/TiaKoenig-T2A2)


# **Question 11 - Description of your marketplace app (website).**

## **Purpose**

The purpose of this app is to help people complete their first-generation pokemon sets; my app allows the user to look through, sell and purchase only first-generation pokemon cards. My app makes it easy because there aren't any other card generations to potentially confuse the user.

## **Functionality / features**

- My application allows anyone to view the home page and listings page, though, if you're not logged in or signed up, you can not select and view a Card, instead if you click the card you will be redirected to the login page where you can sign in, or sign up if you're not a User. 

- When someone signs up, they will be assigned the Role of User and will be able to Buy Cards, and create their own, with the ability to delete or edit their listing. 

- A User will not be able to see the Buy now button on their own listings, to prevent a User from buying their own listing.

- When a User buys a card, they will be redirected to Stripe checkout where they will be able to pay for their Card, once the purchase is successful, they'll be redirected to a payment successful page, if the User cancels the purchase, they will be redirected to a cancelled order page.

- Admin User is able to perform all CRUD functionality on listings.

- A User has the ability to add an image to their listing and can change the image by editing the listing.

## **Sitemap**

![image](docs/sitemap.png)

## **Screenshots**
![screenshot](docs/home-screenshot.png)
![screenshot](docs/login-screenshot.png)
![screenshot](docs/signup-screenshot.png)
![screenshot](docs/listing-screenshot.png)
![screenshot](docs/card-view-screenshot.png)

## **Target audience**

My target audience is people looking to complete their generation one pokemon card set, or sell their collection.

## **Tech stack (e.g. html, css, deployment platform, etc)**

- Ruby on rails
- Ruby
- HTML
- CSS
- PostgreSQL
- Cloudinary
- Stripe
- Github


# **Question 12 - User Stories**

- A user that is not logged in can view the homepage and listings page, if they try to view a card, they will be redirected to the Login page and can either signup or login.
- A user that is logged in can create listings
- A user can upload an image of the card they're selling when creating a listing
- A user can edit or delete their own card listing
- A user can click on the card title of any listing to view more details
- A user can buy a listing, after completing payment in stripe they will be redirected to the successful purchase page, if the order is cancelled, they will be redirected to the cancelled purchase page.

# **Question 13 - Wireframes for your app**

## **Desktop**

![desktop](docs/home-desktop.png)
![desktop](docs/listings-desktop.png)
![desktop](docs/card-view-desktop.png)
![desktop](docs/create-edit-desktop.png)
<!-- ![desktop](docs/account-desktop.png) -->


## **Tablet**

![tablet](docs/home-tablet.png)
![tablet](docs/listings-tablet.png)
![tablet](docs/card-view-tablet.png)
![tablet](docs/creat-edit-tablet.png)
<!-- ![tablet](docs/account-tablet.png) -->

## **Mobile**
![mobile](docs/home-mobile.png)
![mobile](docs/listings-mobile.png)
![mobile](docs/card-view-mobile.png)
![mobile](docs/create-edit-mobile.png)
<!-- ![mobile](docs/account-mobile.png) -->



# **Question 14 - An ERD for your app**

![image](docs/PokeMart_ERD_T2A2.PNG)

# **Question 15 - Explain the different high-level components (abstractions) in your app**

- Using an .order method in cards controller index action to order the cards in ascending order based on their title.

- Using the update.(card_params) method in cards controller update action to update the cards information and then redirecting the user back to the card they edited based on the cards ID.

- Using the .delete method in cards controller destroy action to delete the card and then redirect the user to the cards index page.

- Using the .has_role? method in card policy to check if the current user has a role.


# **Question 16 - Detail any third party services that your app will use**

### **Heroku**

Heroku is a container-based cloud platform that developers use to deploy and manage apps.

### **Stripe**

Stripe is a payment processing platform that is used to set up efficient and safe payments in applications. 

### **Cloudinary**

Cloudinary provides a cloud based management system for images on my application.

### **PostgreSQL**

PostgreSQL is an open source DBMS, it's being used to store information from the application.


# **Question 17 - Describe your projects models in terms of the relationships (active record associations) they have with each other**

### **Cards**

belongs_to :user, dependent: :destroy
has_one :genset, dependent: :destroy
has_one :card_condition, dependent: :destroy
has_one_attached :card_image, dependent: :purge

### **Users**

has_many :cards, dependent: :destroy
has_one :role

### **GenSet**

has_many :cards

### **CardCondition**

has_many :cards

### **Role**

has_and_belongs_to_many :users, :join_table => :users_roles

# **Question 18 - Discuss the database relations to be implemented in your application**

### **Devise**

Devise creates the User Model and allows for user authentication.

### **User**

A User can have many Card listings or none at all.
A User can have a Role of :user or :admin, a user can edit or delete their listings, but knowone elses, and admin can edit any listing.

### **Card**

A Card belongs to the User who created it, they can edit, and delete their card.
A Card has one Genset, which provides the card with a list of Set names the User can choose from.
A Card has one CardCondition, this provides the card with a list of Condition names the User can choose from.
A Card can have one image attached for their Card listing.

### **GenSet**

Genset has many cards, it is a foreign key for Users so that they have a list of Set names to choose from in the drop down options when they create or edit a card.

### **CardCondition**

CardCondition has many cards, it is a foreign key for Users so that they have a list of Condition names to choose from in the drop down options when they create or edit a card.

### **Role**

Role has and belongs to many users, when a User signs up, they will be assigned a role of :user. 

# **Question 19 - Provide your database schema design**

ActiveRecord::Schema.define(version: 2021_11_24_110228) do

  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "card_conditions", force: :cascade do |t|
    t.string "condition"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cards", force: :cascade do |t|
    t.string "title"
    t.integer "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "price"
    t.bigint "genset_id", null: false
    t.bigint "card_condition_id", null: false
    t.bigint "user_id", null: false
    t.index ["card_condition_id"], name: "index_cards_on_card_condition_id"
    t.index ["genset_id"], name: "index_cards_on_genset_id"
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "gensets", force: :cascade do |t|
    t.string "set"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cards", "card_conditions"
  add_foreign_key "cards", "gensets"
  add_foreign_key "cards", "users"
end

# **Question 20 - Describe the way tasks are allocated and tracked in your project**

I used Trello as a reference of what needed to be done in my app, this was helpful when writing my todo list with details. I decided to use a notebook to track my progress and write down errors or extra things that came up during the building process that needed fixing/doing.

[Trello](https://trello.com/b/eJm25yxF/marketplace)

