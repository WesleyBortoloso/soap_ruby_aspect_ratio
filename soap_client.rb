require 'savon'

client = Savon.client(
  wsdl: 'http://localhost:4567/mdc?wsdl',
  convert_request_keys_to: :camelcase
)

x = 640
y = 480

response = client.call(:calculate_mdc, message: { x: x, y: y })

mdc = response.body[:calculate_mdc_response][:mdc]

aspect_ratio_x = x / mdc
aspect_ratio_y = y / mdc

puts "Aspect Ratio da imagem: #{aspect_ratio_x}:#{aspect_ratio_y}"
