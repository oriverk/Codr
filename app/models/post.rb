# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :prtsc
  validates :name, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 500 }

  attr_accessor :img
  attr_accessor :text

  def parse_base64(img)
    if img.present?
      content = img.split(',')[1]
      filename = Time.zone.now.to_s + '.jpg'
      decoded_data = Base64.decode64(content)
      prtsc.attach(io: StringIO.new(decoded_data), filename: filename)
    end
  end
end
