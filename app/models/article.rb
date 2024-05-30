
class Article < ApplicationRecord
#  def self.public_count
#     where(public:true).count
#   end
def self.total_count
    count
  end

 def archived?
    status == 'archived'
  end

  def archived?
    archived
  end
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
 
end
# The first validation declares that a title value must be present. Because title is a string, this means that the title value must contain at least one non-whitespace character.

# The second validation declares that a body value must also be present. Additionally, it declares that the body value must be at least 10 characters long.
