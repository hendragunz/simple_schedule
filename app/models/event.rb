class Event < ActiveRecord::Base
  # attributes
  attr_accessible :name, :start, :end, :details


  # relation
  belongs_to :user

  # scope
  scope :this_month, where(:start => Date.today.beginning_of_month..Date.today.end_of_month).where(:end => Date.today.beginning_of_month..Date.today.end_of_month)

end
