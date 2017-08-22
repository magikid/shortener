class Site < ApplicationRecord
  belongs_to :user
  after_initialize :generate_short_code
  validates_uniqueness_of :short_code

  # This weird regex should check that the given string *is* a URL.  Found it on
  # [StackOverflow](https://stackoverflow.com/a/1805788/1695439)
  validates :url, format: { with: /\A#{URI::regexp}\z/, message: "only allows
                            properly formatted URLs" }

  private

  def generate_short_code
    self.short_code ||= SecureRandom.hex(2) if self.new_record?
  rescue ActiveRecord::RecordNotUnique => e
    @token_attempts ||= 0
    @token_attempts += 1
    retry if @token_attempts < 5
    raise e, "Short code attempts exhausted"
  end
end
