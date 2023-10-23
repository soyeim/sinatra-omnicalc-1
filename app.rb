require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get("/square/new") do
  erb(:new_square_calc)
end

get ("/square/results") do
  @the_num = params.fetch("user_number").to_f

  @the_result = @the_num ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_sqrt_calc)
end

get ("/square_root/results") do
  @num = params.fetch("user_number").to_f

  @result = @num ** 0.5

  erb(:sqrt_results)
end

get("/payment/new") do
  erb(:new_payment_calc)
end

get("/payment/results") do
  @apr = params.fetch("user_apr").to_f/100
  @yr = params.fetch("user_years").to_i
  @period = @yr * 12
  @pv = params.fetch("user_pv").to_f
  @numerator = @apr * @pv
  @denom = 1 - (1+ @apr) ** -@period

  @result = @numerator/@denom
  erb(:payment_results)
end
