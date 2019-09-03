# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'action_view'

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  COLORS = %w[blue green red gray black white brown yellow]
  validates :color, presence: true, inclusion: { in: COLORS }
  validates :sex, presence: true, inclusion: { in: %w(M F) }
  validates :name, :birth_date, :description, presence: true


  def age
    time_ago_in_words(self.birth_date)
  end

  def self.colors
    COLORS
  end
  
end
