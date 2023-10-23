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
