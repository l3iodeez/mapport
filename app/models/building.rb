class Building < ActiveRecord::Base
  belongs_to :customer
  has_many :spaces
  has_many :materials
<<<<<<< HEAD
  
=======
>>>>>>> 0bc37c08b4d63b506a4b9a28224069c4d6ab1dde
end
