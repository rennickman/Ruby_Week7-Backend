require 'arithmetic_calculator'

class String
  def is_numeric?
    true if Float(self) rescue false
  end
end

class Integer
  def is_numeric?
    true
  end
end

class Float
  def is_numeric?
    true
  end
end


class CalculatorController < ApplicationController

  protect_from_forgery with: :exception, unless: -> {request.format.json?}

  def sum

    @title = "Sum"
    @notice = ""
    # the user data is sent via the params
    # :number1 key contains the first number entered # :number2 key contains the second number entered # the numbers are entered as a text
    # retrieve the number submitted by the user
    @num1 = params[:number1]
    @num2 = params[:number2]
    if(@num1 && @num2)
      # we use the arithmetic_calculator.rb of the lib folder
      if((@num1.is_numeric?) && (@num2.is_numeric?))
        @result = ArithmeticCalculator.add(@num1.to_i, @num2.to_i)
        respond_to do |format|
          format.json { render json: {"result" => @result}.to_json, status: :ok}
          format.html
        end
      else
        @notice = "You must supply numbers for both fields"
        respond_to do |format|
          format.json {render json: {"error" => @notice}.to_json, status: :bad_request}
          format.html
        end
      end
    end

  end

  def multiply

    @title = "Multiply"
    @notice = ""
    # the user data is sent via the params
    # :number1 key contains the first number entered # :number2 key contains the second number entered # the numbers are entered as a text
    # retrieve the number submitted by the user
    @num1 = params[:number1]
    @num2 = params[:number2]
    if(@num1 && @num2)
      # we use the arithmetic_calculator.rb of the lib folder
      if((@num1.is_numeric?) && (@num2.is_numeric?))
        @result = ArithmeticCalculator.multiply(@num1.to_i, @num2.to_i)
        respond_to do |format|
          format.json { render json: {"result" => @result}.to_json, status: :ok}
          format.html
        end
      else
        @notice = "You must supply numbers for both fields"
        respond_to do |format|
          format.json {render json: {"error" => @notice}.to_json, status: :bad_request}
          format.html
        end
      end
    end

  end


  def subtract

    @title = "Subtract"
    @notice = ""
    # the user data is sent via the params
    # :number1 key contains the first number entered # :number2 key contains the second number entered # the numbers are entered as a text
    # retrieve the number submitted by the user
    @num1 = params[:number1]
    @num2 = params[:number2]
    if(@num1 && @num2)
      # we use the arithmetic_calculator.rb of the lib folder
      if((@num1.is_numeric?) && (@num2.is_numeric?))
        @result = ArithmeticCalculator.subtract(@num1.to_i, @num2.to_i)
        respond_to do |format|
          format.json { render json: {"result" => @result}.to_json, status: :ok}
          format.html
        end
      else
        @notice = "You must supply numbers for both fields"
        respond_to do |format|
          format.json {render json: {"error" => @notice}.to_json, status: :bad_request}
          format.html
        end
      end
    end

  end

  def divide

    @title = "Divide"
    @notice = ""
    # the user data is sent via the params
    # :number1 key contains the first number entered # :number2 key contains the second number entered # the numbers are entered as a text
    # retrieve the number submitted by the user
    @num1 = params[:number1]
    @num2 = params[:number2]
    if(@num1 && @num2)
      # we use the arithmetic_calculator.rb of the lib folder
      if((@num1.is_numeric?) && (@num2.is_numeric?))
        # exception handling if user divides by zero
        begin
          @result = ArithmeticCalculator.divide(@num1.to_i, @num2.to_i)
          respond_to do |format|
          format.json { render json: {"result" => @result}.to_json, status: :ok}
          format.html
        end
        rescue
          @result = "Inf"
        end

      else
        @notice = "You must supply numbers for both fields"
        respond_to do |format|
          format.json {render json: {"error" => @notice}.to_json, status: :bad_request}
          format.html
        end
      end
    end


  end

end
