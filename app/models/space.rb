# == Schema Information
#
# Table name: spaces
#
#  id             :bigint           not null, primary key
#  brand          :string
#  condition      :string
#  description    :text
#  image          :string
#  name           :string
#  original_price :decimal(, )
#  owner          :string
#  selling_price  :decimal(, )
#  space          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Space < ApplicationRecord
  validates(:name, presence: true)
  has_one_attached :image


  # def filmography
  #   key = self.id

  #   the_many = Movie.where({ :director_id => key })

  #   return the_many
  # end
end
