class CalcController < ApplicationController
  def home
    render({:template => "calc_layouts/square_new"})
  end

  def square
    render({:template => "calc_layouts/square_new"})
  end

  def square_results
    @number = params.fetch("number").to_f
    @square = @number * @number
    render({:template => "calc_layouts/square_results"})
  end

  def square_root
    render({:template => "calc_layouts/square_root_new"})
  end
  
  def square_root_results
    @number = params.fetch("user_number").to_f
    @square_root = Math.sqrt(@number)
    render({:template => "calc_layouts/square_root_results"})
  end

  def random
    render({:template => "calc_layouts/random_new"})
  end

  def random_results
    @min = params.fetch("user_min").to_f
    @max = params.fetch("user_max").to_f
    @random_number = rand(@min..@max)
    render({:template => "calc_layouts/random_results"})
  end

  def payment
    render({:template => "calc_layouts/payment_new"})
  end

  def payment_results
    @apr      = params[:user_apr].to_f
    @apr_formatted = @apr.to_fs(:percentage, {:precision => 4})
    r        = @apr / (100.0 * 12.0)
    @years    = params[:user_years].to_i
    n        = @years * 12
    @pv       = params[:user_principal].to_f
    @principal = @pv.to_fs(:currency)
    @numerator   = r * @pv
    @denominator = 1 - (1 + r)**(-n)
    @payment     = @numerator / @denominator
    @payment_formatted = @payment.to_fs(:currency)
    render({:template => "calc_layouts/payment_results"})
  end
end
