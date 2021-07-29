class Library
  attr_reader :name,
              :books,
              :authors,
              :checked_out_books,
              :checkout_count

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
    @checkout_count = {}
  end

  def add_author(author)
    @authors << author
    author.books.each do |book|
      @books << book
    end
  end

  def publication_time_frame_for(author)
    time_frame = {}
    time_frame[:start] = first_book(author).publication_year
    time_frame[:end] = last_book(author).publication_year
    time_frame
  end

  def first_book(author)
    author.books.min_by do |book|
      book.publication_year
    end
  end

  def last_book(author)
    author.books.max_by do |book|
      book.publication_year
    end
  end

  def checkout(book)
    if @books.include?(book) && !@checked_out_books.include?(book)
      @checked_out_books << book
      @checkout_count[book] ||= 0
      @checkout_count[book] += 1
      true
    else
      false
    end
  end

  def return(book)
    @checked_out_books.delete(book)
  end

  def most_popular_book
    book_count = @checkout_count.max_by do |book, count|
      count
    end
    book_count[0]
  end
end
