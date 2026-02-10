class QuoteRequestsController < ApplicationController
  def new
    @quote_request = QuoteRequest.new
  end

  def create
    @quote_request = QuoteRequest.new(quote_request_params)

    respond_to do |format|
      if @quote_request.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "quote_request_modal",
            partial: "quote_requests/success",
            locals: { quote_request: @quote_request }
          )
        end
        # format.html { redirect_to root_path, notice: "Quote request submitted successfully." }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "quote_form",
            partial: "quote_requests/form",
            locals: { quote_request: @quote_request }
          )
        end

        # format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def quote_request_params
    params.require(:quote_request).permit(
      :full_name,
      :email,
      :phone,
      :vehicle_make,
      :vehicle_model,
      :vehicle_year,
      :issue_description,
      :additional_notes
    )
  end
end
