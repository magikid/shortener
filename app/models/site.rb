class Site < ApplicationRecord
  belongs_to :user
  after_initialize :generate_short_code

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
