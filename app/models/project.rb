class Project < ActiveRecord::Base
  validates_presence_of :name, :technologies_used
end
