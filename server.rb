require 'sinatra'

$collection = [
  { name: 'Saga', issue: 1, price: 2.99, cover: 'Special First Edition', rating: 'A' }
]

get '/comics' do
  erb :comics, locals: { collection: $collection }
end


post '/comics/add' do
  comic = {
    name: params[:name],
    issue: params[:issue].to_i,
    price: params[:price].to_f,
    cover: presence(params[:cover]),
    rating: presence(params[:rating])
  }
  $collection << comic
  redirect to('/comics')
end

get '/' do
  food = params[:food] || :cookies
  erb :home, layout: :layout, locals: { list: [1,2,3,4,5,food] }
end

get '*' do
  '404: I think you have the wrong place.'
end

def presence(value)
  if value.nil? || value.empty?
    nil
  else
    value
  end
end
