class Payment < ActiveRecord::Base
  belongs_to :source, class_name: "User"
  belongs_to :destination, class_name: "User"
  belongs_to :creator, class_name: "User"

  validate :source_and_destination_cannot_be_equal

  def source_and_destination_cannot_be_equal
    if source == destination
      errors.add(:source, "can't be the same as the destination")
    end
  end
end
