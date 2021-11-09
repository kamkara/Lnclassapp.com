class QuestionValidator < ActiveModel::Validator
    def validate(record)
        # may only have 1 right answer
        if record.answers.count {|a| a.correct_answer} > 1
            record.errors[:question] << "Une question ne peut avoir qu'une seule bonne réponse !!"
        end

        # requires 1 correct answer
        if record.answers.none? {|a| a.correct_answer}
            record.errors[:question] << "Vous avez pas proposez de réponse correcte d'abord !"
        end

        # must have 3 answers
        if record.answers.any? { |a| !a.content.present?}
            record.errors[:question] << "Une question doit avoir 3 propositions"
        end

        # answers must be unique
        if !!record.answers.collect {|a| a.content}.uniq!
            record.errors[:question] << "A question cannot have duplicate answers."
        end
        # question is unique for a given quiz
        #if record.exercice.questions.any? {|q| q.content == record.content }
            #record.errors[:question] << "This question has already been added to this quiz."
        #end

    end
end