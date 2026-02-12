class Admin::DashboardController < Admin::BaseController
  def index
    @quote_requests = QuoteRequest.all
  end
end
