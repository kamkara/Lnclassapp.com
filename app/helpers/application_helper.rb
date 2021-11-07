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

end
