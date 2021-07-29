class Book
  attr_reader :author_first_name,
              :author_last_name,
              :title,
              :publication_date

  def initialize(params)
    @author_first_name = params[:author_first_name]
    @author_last_name  = params[:author_last_name]
    @title             = params[:title]
    @publication_date  = params[:publication_date]
  end

  def publication_year
    # Originally had @publication_date[-4..-1] but wanted to account for different inputs
    if @publication_date.split.count == 3 && @publication_date.split[2].to_i != 0
      @publication_date.split[2]
    elsif @publication_date.split.count == 1 && @publication_date.length == 4
      @publication_date
    else
      "Incorrect date format."
    end
  end

  def author
    "#{@author_first_name} #{@author_last_name}"
  end
end
