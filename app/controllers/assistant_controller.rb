class AssistantController < ApplicationController
  def messenger
    query = (any_parameter?) ? parameters : "Ruby On Rails"
    page = WikipediaConsulter.find_by_name query

    text = if page.text.present?
             "#{page.text.slice(0, 150)}... \b full url: #{page.fullurl}"
           else
             "I haven't found this page on the English Wikipedia"
           end

    response = {
      "speech": text,
      "displayText": text,
      "data": "",
      "source": "Programming Assistant"
    }

    render json: response
  end

  private

  def parameters
    params.dig(:result, :parameters, 'any')
  end

  def any_parameter?
    parameters.present?
  end
end
