class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :account

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\z/

  after_create do |user|
    Account.create(user_id: user.id)
  end

  def full_name
    "#{first_name}" + " " + "#{last_name}"
  end

end



