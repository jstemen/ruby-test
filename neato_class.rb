class NeatoClass
  def initialize(hash)
    @hash = hash
  end
  def method_missing(m, *args)
    @hash[m.to_s]
  end
end