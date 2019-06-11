require 'sqlite3'
require_relative 'replies'
require_relative 'questionsfollows'

class Users
    attr_accessor :id, :fname, :lname
    def self.find_by_id(id)
        users = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT * FROM users WHERE id = ?
        SQL

        users.map { |datum| Users.new(datum) }
    end

    def self.all
        users = QuestionsDBConnection.instance.execute("SELECT * FROM users")
        users.map { |datum| Users.new(datum) }
    end

    def self.find_by_name(fname, lname)
        users = QuestionsDBConnection.instance.execute(<<-SQL, fname, lname)
            SELECT * FROM users WHERE fname = ? AND lname = ?
        SQL

        users.map { |datum| Users.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def find_authored_questions
        Questions.find_by_user_id(self.id)
    end

    def find_authored_replies
        Replies.find_by_user_id(self.id)
    end

    def followed_questions
        QuestionsFollows.follow_questions_for_user_id(self.id)
    end
end