class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,  :trackable
  
  
  #has_many :exercices
  has_many :materials
  has_many :levels  
  has_many :classrooms  
  #has_many :schoolNames  
  #has_many :cityAreas
  has_many :courses
  attr_writer :logged
#


    ################## VALIDATES  ###############
   #validates :first_name, :last_name, :full_name, :email, :city, :contact, :role,  presence: true
   #validates :full_name,  length: { minimum:5, message: "%{value} verifier votre nom complet"}
   #validates :contact, uniqueness: true, length: { minimum:10, message: "%{ value} verifier votre nom numéro est 10 chiffres"}
   #validates :matricule, uniqueness: true, length: { minimum:9, message: "%{ value} verifier votre nom matricule"}
   #validates :role, inclusion: { in: %w(Student Teacher Team), message: "%{value} acces non identifier" }
    
    
  ############# CUSTOMIZE ###############"" 
  
 
end
