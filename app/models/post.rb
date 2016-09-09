# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text             not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null


class Post < ActiveRecord::Base
  validates(
    :title,
    :content,
    :author_id,
    presence: true
  )

  has_many :post_subs,
  class_name: "PostSub",
  foreign_key: :post_id

  belongs_to :author,
  class_name: "User",
  foreign_key: :author_id
end
