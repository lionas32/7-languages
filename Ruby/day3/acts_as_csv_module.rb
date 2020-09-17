#---
# Excerpted from "Seven Languages in Seven Weeks",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
#---

# Doubt this is the correct way to solve it
class CsvRow
  attr_accessor :headers, :csv_contents
  def initialize(csv_contents, headers)
    @csv_contents = csv_contents
    @headers = headers
  end

  def method_missing name, *args
    @csv_contents.map{|i| i[@headers.index(name.to_s)]}
  end
end

module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  
  module InstanceMethods  
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
      
      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end
    
    attr_accessor :headers, :csv_contents
    def each(&block)
      block.call CsvRow.new(@csv_contents, @headers)
    end
    
    def initialize
      read 
    end
  end
end

class RubyCsv  # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

csv = RubyCsv.new
csv.each {|row| puts row.one}

