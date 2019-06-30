class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_one :role

  def after_save(current_user_id, role)
    Role.create(user_id: current_user_id, ability: role)
  end

  def check_role
    self.role.ability
  end

end