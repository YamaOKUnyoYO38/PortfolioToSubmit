class Template < ApplicationRecord
  belongs_to :user

  
  # validates :person_name, :relationship, :message, presence: { message: "を入力してください" }
  # validates :message, length: { maximum: 1000, message: "は1000文字以内で入力してください" }
  
  # validates :person_name, presence: { message: "を入力してください" }
  # validates :relationship, presence: { message: "を入力してください" }
  # validates :message, presence: { message: "を入力してください" }
  #                     length: { maximum: 1000, message: "は1000文字以内で入力してください" }

  before_validation :encode_utf8_fields

  validates :person_name, :relationship, :message, presence: true

  private

  def encode_utf8_fields
    self.person_name = person_name.encode('UTF-8', invalid: :replace, undef: :replace, replace: '?') if person_name
    self.relationship = relationship.encode('UTF-8', invalid: :replace, undef: :replace, replace: '?') if relationship
    self.message      = message.encode('UTF-8', invalid: :replace, undef: :replace, replace: '?') if message
  end
end
