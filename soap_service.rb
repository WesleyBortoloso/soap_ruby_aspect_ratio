require 'sinatra'
require 'savon'

class MDCCalculatorService
  def calculate_mdc(x, y)
    while y != 0
      x, y = y, x % y
    end
    x
  end
end

mdc_service = MDCCalculatorService.new

post '/mdc' do
  request_body = request.body.read
  client = Savon.client(
    wsdl: 'http://localhost:4567/mdc?wsdl',
    convert_request_keys_to: :camelcase
  )

  response = client.call(:calculate_mdc, xml: request_body)
  response.body
end
