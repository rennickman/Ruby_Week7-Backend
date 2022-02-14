require 'arithmetic_calculator'

class CalculatorController < ApplicationController
  protect_from_forgery with: :exception, unless: -> {request.format.json?}

  def sum

    # the user data is sent via the params
    # :number1 key contains the first number entered # :number2 key contains the second number entered # the numbers are entered as a text
    # retrieve the number submitted by the user
    @num1 = params[:number1]
    @num2 = params[:number2]
    puts(params)
    # we use the arithmetic_calculator.rb of the lib folder
    @result = ArithmeticCalculator.add(@num1.to_i, @num2.to_i)

    respond_to do |format|  ## Add this
      format.json { render json: { "result" => @result }.to_json, status: :ok}
      format.html 
    end 

  end


end
