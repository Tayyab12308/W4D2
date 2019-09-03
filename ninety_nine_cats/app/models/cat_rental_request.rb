# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true, inclusion: { in: %w[PENDING APPROVED DENIED]}

  after_initialize :set_default_status

  belongs_to :cat,
  foreign_key: :cat_id,
  class_name: :Cat

  def set_default_status
      self.status ||= "PENDING"
  end
end
