class Tweet < ActiveRecord::Base
  belongs_to :user

  validates :message, {
    presence: true,
    length: {
      maximum: 140,
      minimum: 10,
      too_long: "A tweet is only 140 max. Everybody knows that!",
      too_short: "Write more!"
    }
  }
end
