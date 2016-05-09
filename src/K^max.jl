


function Kmax(x=0) # This function will give k_t+1, given a value of n_t

  function g(y)
    (alpha*(k_-y)^(alpha-1)*y)/(1+r)-x
  end

  return fzero(g,[0,1])

end
