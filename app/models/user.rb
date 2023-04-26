class User < ApplicationRecord
  attribute :permisos_comprar
  attribute :permisos_vender
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :phones
end
