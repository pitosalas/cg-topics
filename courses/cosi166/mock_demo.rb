class Money
  def initialize converter
    @c = converter
  end

  def set(val, currency)
    @val = val
    @curr = currency
  end

  def convert_to(new_currency)
    m = Money.new(@c)
    new_val = @c.exchange_rate(@curr, new_currency) * @val
    m.set(new_val, new_currency)
    m
  end

  def value
    @val
  end

  def currency
    @curr
  end

end



class RealConverter
  def exchange_rate(source, target)
    ..... gem ...
    return conversion
  end
end

class MockConverter
  def exchange_rate(source, target)
    if source == :usd && target == :yen
      12.222
    else
      throw exception
    end
  end
end


x = Money.new(RealConverter.new)


--- test

a = Money.new(MockConverter.new)
a.set(120, :usd)
assert a.convert_to(:yen).val == 120 * 12.22
assert a.convert_to(:yen).curr = :yen



