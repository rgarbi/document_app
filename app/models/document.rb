class Document < ActiveRecord::Base
  attr_accessible :creator, :date, :name, :num_pages  
end
