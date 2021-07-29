class Book
  attr_reader :title,
              :author_first_name,
              :author_last_name,
              :publication_date

  def initialize(params)
    @title = params[:title]
    @author_first_name = params[:author_first_name]
    @author_last_name = params[:author_last_name]
    @publication_date = params[:publication_date]
  end

  def publication_year
    @publication_date[-4..-1] 
  end

  def author
    "#{@author_first_name} #{@author_last_name}"
  end
end
