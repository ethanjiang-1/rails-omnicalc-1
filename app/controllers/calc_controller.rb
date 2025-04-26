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
end
