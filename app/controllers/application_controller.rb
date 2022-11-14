

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # add routes
  

  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
   bakery = Bakery.all.find(params[:id])
   bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    goods = BakedGood.all.order(price: :desc)
    goods.to_json
  end

  get '/baked_goods/most_expensive' do
    pricy = BakedGood.all.max_by {|item| item.price}
    pricy.to_json
  end



end
