class SharedDeck < ActiveRecord::Base
  belongs_to :deck
  belongs_to :investor
end
