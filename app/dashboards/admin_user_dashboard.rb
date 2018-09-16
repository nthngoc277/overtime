require "administrate/base_dashboard"

class AdminUserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    posts: Field::HasMany,
    id: Field::Number,
    email: Field::String,
    encrypted_password: Field::String,
    password: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    first_name: Field::String,
    last_name: Field::String,
    type: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    # :posts,
    :id,
    :email,
    # :encrypted_password,
    :first_name,
    :last_name,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    # :posts,
    :id,
    :email,
    # :encrypted_password,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :first_name,
    :last_name,
    :type,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    # :posts,
    :email,
    :password,
    # :encrypted_password,
    # :reset_password_token,
    # :reset_password_sent_at,
    # :remember_created_at,
    :first_name,
    :last_name,
    :type,
  ].freeze

  # Overwrite this method to customize how admin users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(admin_user)
  #   "AdminUser ##{admin_user.id}"
  # end
end
