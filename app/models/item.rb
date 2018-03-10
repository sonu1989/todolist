class Item < ApplicationRecord
  belongs_to :todo, required: false
  
  enum state: [:done, :undone]

  before_create :set_state

  def set_state
    self.state = "undone"
  end
end
