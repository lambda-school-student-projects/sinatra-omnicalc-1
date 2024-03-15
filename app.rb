require "sinatra"
require "sinatra/reloader"

get("/") do

  erb(:index)
end

get("/square/new") do
  erb(:square_new)
end

get("/square/results") do
  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root_new)
end

get("/square_root/results") do
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment_new)
end

get("/payment/results") do
  erb(:payment_results)
end

get("/random/new") do
  erb(:random_new)
end

get("/random/results") do
  erb(:random_results)
end

def calculate_payments()
  apr = params[:user_apr].to_f / 100
  years = params[:user_years].to_f
  present_value = params[:user_pv].to_f

  monthly_interest_rate = apr / 12
  num_payments = years * 12
  payment = present_value * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-num_payments)))
  payment.to_fs(:currency)
  
end
