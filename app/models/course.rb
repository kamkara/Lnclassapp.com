class Course < ApplicationRecord
  
  #RICH_TEXTT EDITOR
  has_rich_text :content

  #RELATIONS
  belongs_to :level
  belongs_to :material
  belongs_to :user
  has_many_attached :img
  #VALIDATIONS
  validates :title,
            :content,
            :level_id,
            :material_id,
            :user_id,
            :slug, 
            presence: true
  

Course.all.with_rich_text_content # Preload the body without attachments.
Course.all.with_rich_text_content_and_embeds # Preload both body and attachments.


  #SLUG
  extend FriendlyId
    friendly_id :slugged_custom, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end

  def slugged_custom
    #Apprendre-a-calculer-les-limites-math-tleD
    "#{title} #{material.title} #{level.title}"
  end
end
