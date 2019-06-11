require 'sqlite3'
require_relative 'questions_db'
require_relative 'questions'


class Replies
    attr_accessor :id, :question_id, :reply_id, :user_id, :body

    def self.all
        replies = QuestionsDBConnection.instance.execute("SELECT * FROM replies")
        replies.map { |datum| Replies.new(datum) }
    end

    def self.find_by_id(id)
        replies = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT * FROM replies WHERE id = ?
        SQL

        replies.map { |datum| Replies.new(datum) }
    end

     def self.find_by_question_id(question_id)
        replies = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
            SELECT * FROM replies WHERE question_id = ?
        SQL

        replies.map { |datum| Replies.new(datum) }
    end
    
    def self.find_by_user_id(user_id)
        replies = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
            SELECT * FROM replies WHERE user_id = ?
        SQL

        replies.map { |datum| Replies.new(datum) }
    end

    def self.find_by_reply_id(reply_id)
        replies = QuestionsDBConnection.instance.execute(<<-SQL, reply_id)
            SELECT * FROM replies WHERE reply_id = ?
        SQL

        replies.map { |datum| Replies.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @reply_id = options['reply_id'] 
        @user_id = options['user_id']
        @body = options['body']
    end

    def author  
        Users.find_by_id(self.user_id)
    end

    def question
        Questions.find_by_id(self.question_id)
    end

    def parent_reply
        raise "no parent reply" if Replies.find_by_id(self.reply_id) == []
        
        Replies.find_by_id(self.reply_id)
    end

    def child_replies
        a = Replies.find_by_reply_id(self.id) 
        raise "no children replies" if a == []
        a
    end
end