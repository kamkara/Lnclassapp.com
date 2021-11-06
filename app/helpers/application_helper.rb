module ApplicationHelper
  
  #onglet title
def title
 base_title = "Lnclass Education"
  if @title.nil?
  base_title
  else
  "#{@title} | #{base_title}"
  end
end
#site description
def description
  "Lnclass Education aide les élèves a apprendre facilement"
end

    #Sign in and up anywhere on app
    def resource_name
    :user
  end
  
  def resource
    @resource ||= User.new
  end
  
  def resource_class
    User
  end
  
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  

  def user_greeting
        if user_signed_in?
          "#{user_comming}, #{current_user.first_name}"
        else
            ""   
          end
    end
    
    def user_comming
      case Time.now.strftime("%H").to_i
        when 1..11
          "Bonjour"
        when 12..
            "Bonsoir"
          else
            'Bienvenue(e)'
          end
    end
    
    def logged_in?
    current_user.id === session[:user_id]
    end
    def student
    current_user.role == "Student"
    end
    def teacher
    current_user.role == "Teacher"
    end
    def Team
    current_user.role == "Teacher" || current_user.role == "Team" 
    end
end
