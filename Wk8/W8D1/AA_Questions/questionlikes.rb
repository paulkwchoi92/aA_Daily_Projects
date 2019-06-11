require 'sqlite3'
require_relative 'questions_db'


class QuestionLikes
    def self.all
        question_likes = QuestionsDBConnection.instance.execute("SELECT * FROM question_likes")
        question_likes.map { |datum| QuestionLikes.new(datum) }
    end

    def self.find_by_id(id)
        qustionlikes = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT * FROM questions_likes WHERE id = ?
        SQL

        questionlikes.map { |datum| QuestionLikes.new(datum) }
    end

    def self.find_by_question_id(question_id)
        qustionlikes = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
            SELECT * FROM questions_likes WHERE question_id = ?
        SQL

        questionlikes.map { |datum| QuestionLikes.new(datum) }
    end

    def self.find_by_user_id(user_id)
        qustionlikes = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
            SELECT * FROM questions_likes WHERE user_id = ?
        SQL

        questionlikes.map { |datum| QuestionLikes.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @user_id = options['user_id']
    end
end