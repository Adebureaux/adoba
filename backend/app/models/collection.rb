class Collection < ApplicationRecord

	validates :name, presence: true
	validates :date, presence: true
	validates :association_name, presence: true

  def dynamic_attribute(key)
    dynamic_attributes[key.to_s]
  end

  def dynamic_attribute=(key, value)
    dynamic_attributes[key.to_s] = value
  end
end
