module ReverseModulo
  def reverse_modulo(mod, a, b)
    num = b / mod.to_f
    add = mod * num.round
    sum = a + add
    reduce = sum - b
    if reduce > mod
      reduce -= mod
      elsif reduce == 0
        reduce += mod
      elsif reduce < 0
       reduce = 27 + reduce
      else
        reduce
    end
  # end
  reduce
  end
end
