class Classroom < ApplicationRecord
 
    #VALIDATIONS
  #validates_with ClassroomValidator
    
  belongs_to :user
  belongs_to :level
  #has_many :exercices, dependent: :destroy
  has_one :classroom_admin, dependent: :delete
  
  validates :name, :slug, :user_id, :level_id,  presence: true #:school_name_id, 


  #has_one :teacher, through: :classroom_admin, source: :user #un prof est admin

    has_and_belongs_to_many :students, #plusieurs eleves peuvent rejoindre une classe
        :class_name => 'User',
        :join_table => 'classrooms_users',
        :foreign_key => 'user_id',
        :association_foreign_key => 'classroom_id'

#SLUG
  extend FriendlyId
  friendly_id :slugged_custom, use: :slugged

  def should_generate_new_friendly_id?
    name_changed? || super
  end

  def slugged_custom
    #{school_name.nick_name} #
    "from #{name}"
  end
end