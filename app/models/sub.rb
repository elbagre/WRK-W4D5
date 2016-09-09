# == Schema Information
#
# Table name: subs
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :text
#  mod_id      :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :mod_id, presence: true

  belongs_to :mod,
  class_name: 'User',
  foreign_key: :mod_id

  has_many :post_subs,
  class_name: "PostSub",
  foreign_key: :sub_id
end
