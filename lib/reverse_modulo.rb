module ReverseModulo
  def reverse_modulo(mod, a, b)
    num = b / mod.to_f
    add = mod * num.round
    sum = a + add
    reduce = sum - b
    # case num >= 1
    # when b > add then reduce
    # else
    while reduce > mod do
      reduce -= mod
      if reduce == 0
        reduce += mod
      end 
    end
    reduce
  end
end
