class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post

  before_save :downcase_email, if: :email_present?
  before_save { self.role ||= :member }
  before_save :format_name

  validates :name, length:  { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: :password_digest_nil?
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }

  has_secure_password
  enum role: [:member, :admin, :moderator]

  def favorite_for(post)
     favorites.where(post_id: post.id).first
   end

   def avatar_url(size)
     gravatar_id = Digest::MD5::hexdigest(self.email).downcase
     "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
   end

  private

  def downcase_email
    email.downcase
  end

  def format_name
    if name.present?
      name_array = []
      name.split.each do |name_part|
        name_array << name_part[0].upcase + name_part[1..-1]
      end
      name = name_array.join(" ")
    end
  end

  def password_digest_nil?
    password_digest.nil?
  end

  def email_present?
    email.present?
  end
end
