require 'sqlite3'
require_relative 'questions_db'
require_relative 'questions'

class QuestionsFollows
    
    def self.all
        questions_follows = QuestionsDBConnection.instance.execute("SELECT * FROM questions_follows")
        questions_follows.map { |datum| QuestionsFollows.new(datum) }
    end
    
    def self.find_by_id(id)
        questions_follows = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT * FROM questions_follows WHERE id = ?
        SQL
    end
    
    def self.find_by_question_id(question_id)
        questions_follows = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
            SELECT * FROM questions_follows WHERE question_id = ?
        SQL
    end

    def self.followers_for_questions(question_id)
        questions_follows = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
        SELECT 
         fname, lname
        FROM
         users
        JOIN
        questions_follows ON questions_follows.user_id = users.id
        WHERE
        questions_follows.question_id = ?;

        SQL
    end

    def self.follow_questions_for_user_id(user_id)
        questions_follows = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
        SELECT 
         questions.*
        FROM
         questions
        JOIN
        questions_follows ON questions_follows.question_id = questions.id
        WHERE
        questions_follows.user_id = ?;

        SQL
        
        questions_follows.map { |datum| QuestionsFollows.new(datum) }
    end

    def self.most_followed_questions(n)
        questions_follows = QuestionsDBConnection.instance.execute(<<-SQL, n )
        SELECT DISTINCT
         questions.*
        FROM
         questions
        JOIN
         questions_follows ON questions_follows.question_id = questions.id
        GROUP BY
        question_id
        ORDER BY
          COUNT DESC
        LIMIT ?
;
        SQL
        
        questions_follows.map { |datum| Questions.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @user_id = options['user_id']
    end

    
end