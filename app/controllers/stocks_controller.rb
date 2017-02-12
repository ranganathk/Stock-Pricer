class StocksController < ApplicationController

  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params)
    @result = BlackScholes(@stock.call_option, @stock.put_option, @stock.price, @stock.strikePrice, @stock.maturity, @stock.interestRate, @stock.colitility)
    respond_to do |format|
      format.js {render 'create.js.erb'}
    end
  end

  private

  def stock_params
    params.require(:stock).permit(:name, :price, :maturity, :strikePrice, :colitility, :interestRate, :call_option, :put_option)
  end

  # Cumulative normal distribution
  def cnd(x)
    a1, a2, a3, a4, a5 = 0.31938153, -0.356563782, 1.781477937, -1.821255978, 1.330274429
    l = x.abs
    k = 1.0 / (1.0 + 0.2316419 * l)
    w = 1.0 - 1.0 / Math.sqrt(2*Math::PI)*Math.exp(-l*l/2.0) * (a1*k + a2*k*k + a3*(k**3) + a4*(k**4) + a5*(k**5))
    w = 1.0 - w if x < 0
    return w
  end

  def BlackScholes(call_option, put_option, s, x, t, r, v)
    d1 = (Math.log(s/x)+(r+v*v/2.0)*t)/(v*Math.sqrt(t))
    d2 = d1-v*Math.sqrt(t)
    call_val = s*cnd(d1)-x*Math.exp(-r*t)*cnd(d2)
    put_val = x*Math.exp(-r*t)*cnd(-d2)-s*cnd(-d1)
    arr = []
    arr[0] = call_val
    arr[1] = put_val
    return arr
  end
end
