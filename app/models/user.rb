class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :account

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>", minithumb: "70x70" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\z/

  USER_TYPE = ["citizen", "shop", "admin"]

  after_create do |user|
    Account.create(user_id: user.id)
    client = Twilio::REST::Client.new
    client.messages.create(
      from: '+32460200005',
      to: user.phone_number,
      body: 'Congratulations!'
    )
  end

  def full_name
    "#{first_name}" + " " + "#{last_name}"
  end

end



