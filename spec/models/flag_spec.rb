# == Schema Information
#
# Table name: flags
#
#  id             :integer          not null, primary key
#  flaggable_id   :integer
#  flaggable_type :string(255)
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

describe Flag do
  pending "add some examples to (or delete) #{__FILE__}"
end
