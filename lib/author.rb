require './lib/book'

class Author
  attr_reader :first_name,
              :last_name,
              :books

  def initialize(params)
    @first_name = params[:first_name]
    @last_name  = params[:last_name]
    @books      = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def write(title, date)
    book = Book.new({author_first_name: @first_name,
                     author_last_name: @last_name,
                     title: title,
                     publication_date: date})
    @books << book
    book
  end
end
