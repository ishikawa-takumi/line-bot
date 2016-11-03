class Project < ActiveRecord::Base
    has_many :tasks
    validates :title, 
      presence: { message: "input"} ,
      length: {minimum: 3, message: "too short"}

end
