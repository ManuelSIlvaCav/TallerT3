require 'rubygems'
require 'socket.io-client-simple'

socket = SocketIO::Client::Simple.connect 'wss://integracion-tarea-3.herokuapp.com/flights'
p socket

socket.on :connect do
  puts "connect!!!"
  #p socket
end

socket.on :POSITION do |data|
  p "RETORNO DE EVENTO POSITION"
  p data

end

socket.on :FLIGHTS do |data|
  p "RETORNO DE EVENTO FLIGHTS"
  p data
end

socket.on :AIRPORTS do |data|
  p "RETORNO DE EVENTO AIRPORT"
  p data
end

socket.on :disconnect do
  puts "disconnected!!"
end

socket.on :providerevent do |data|
  puts data
end

socket.on :error do |err|
  p err
end

puts "please input and press Enter key"
loop do
  msg = STDIN.gets.strip
  p msg
  socket.emit(msg)
end
