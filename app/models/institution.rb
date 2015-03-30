# == Schema Information
#
# Table name: institutions
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  enrollment     :string(255)
#  num_faculty    :string(255)
#  address_line_1 :string(255)
#  address_line_2 :string(255)
#  city           :string(255)
#  state          :string(255)
#  zip_code       :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Institution < ActiveRecord::Base
  attr_accessible :address_line_1, :address_line_2, :city, :enrollment, :name, :num_faculty, :state, :zip_code, :users_attributes
  has_many :users

  validates :name, presence: true
end
