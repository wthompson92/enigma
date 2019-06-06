module ReverseModulo

  def reverse_modulo(mod, a, b)
    num = b / mod.to_f
      if num < 1 then num = num.floor
      end
      num
    add = mod * num.round
    sum = a + add
    reduce = sum - b
      if reduce < 0 then reduce = mod + reduce
      elsif reduce > mod then reduce -= mod
      end
    reduce
  end
end
