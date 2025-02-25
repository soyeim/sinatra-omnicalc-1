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
  @yr = params.fetch("user_years").to_f
  @n = @yr * 12
  @apr = params.fetch("user_apr").to_f/100
  @r = @apr/@n
  @pv = params.fetch("user_pv").to_f
  @numerator = @r * @pv
  @d1 = 1+ @r
  @d2 = -@n
  @denom = 1 - @d1 ** @d2

  @result = @numerator/@denom
  erb(:payment_results)
end

get("/random/new") do
  erb(:new_random)
end

get("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f

  @result = rand(@min..@max)
  @random = @result.to_f
  erb(:random_results)
end
