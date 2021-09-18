#!/usr/bin/env ruby
require 'open-uri'

# Downloads digital books from https://store.almanhal.com/
class BookRetriever
  def initialize(book_id, output_dir)
    @book_id = book_id
    @output_dir = output_dir
  end

  def download
    num_pages.times do |page|
      out_file = File.join(@output_dir, "#{page}.jpg")
      puts "Downloading Page #{page}"
      File.write out_file, URI.open(page_url(page)).read
    end
  end

  def num_pages
    500
  end

  def page_url(num)
    "https://store.almanhal.com/store-books/#{@book_id}/page_#{num+1}.jpg"
  end
end

book = BookRetriever.new(978, './pages')
book.download
