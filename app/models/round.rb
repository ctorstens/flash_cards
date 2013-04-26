class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck

  validates :count_correct, :presence => true
  validates :count_wrong, :presence => true
end
