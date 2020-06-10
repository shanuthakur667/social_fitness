class TestSidekiq
  include Sidekiq::Worker

  def perform
    Rails.logger.info "*asasas"
  end
end
