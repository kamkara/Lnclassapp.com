class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,  :trackable, authentication_keys: [:logged]
  
  
  #has_many :answers
  has_many :exercices
  #has_many :questions
  has_many :materials
  has_many :levels  
  has_many :classrooms  
  #has_many :schoolNames  
  #has_many :cityAreas
  has_many :courses
  attr_writer :logged
#

before_create :user_is_student?
before_create :build_user_full_name

    ################## VALIDATES  ###############
   validates :first_name, :last_name, :full_name, :email, :city, :contact, :role,  presence: true
   validates :full_name,  length: { minimum:5, message: "%{value} verifier votre nom complet"}
   validates :contact, uniqueness: true, length: { minimum:10, message: "%{ value} verifier votre nom numéro est 10 chiffres"}
   validates :role, inclusion: { in: %w(Student Teacher Team), message: "%{value} acces non identifier" }
   validates :matricule, presente: true, uniqueness: true,
              length: { minimum:9, message: "%{ value} verifier votre nom matricule"},
              if: :user_is_student?
    
  ####USER ROLE #####
 
  
def user_is_student?
  if self.role == "Student" && self.email.blanck? && self.password.blank?
    #matricule to build email and Contact to build password
    self.email = "#{self.matricule}@gmail.com"
    self.password = "#{self.contact}"
  end
end


  ############# CUSTOMIZE ###############"" 
  def build_user_full_name
    self.full_name = "#{self.first_name} #{self.last_name}" 
  end

  ################## SLUG ###############
  extend FriendlyId
  friendly_id :full_name, use: :slugged
  
  def should_generate_new_friendly_id?
    full_name_changed?
  end

  ################## LOGGED  #########
   
  def logged
    @logged || self.matricule || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if logged = conditions.delete(:logged)
      where(conditions.to_h).where(["lower(matricule) = :value OR lower(email) = :value", { :value => logged.downcase }]).first
    elsif conditions.has_key?(:matricule) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
 
end
