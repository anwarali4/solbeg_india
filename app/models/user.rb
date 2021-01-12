class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :address, dependent: :destroy
  has_one_attached :profile_image

  accepts_nested_attributes_for :address, allow_destroy: true
  ROLE = %w(Admin Customer)  

  validates :name, presence: true
  validates :type, inclusion: { in: ROLE }

  ROLE.each do |method|
    define_method "#{method.downcase}?" do
      type == method
    end
  end

end
