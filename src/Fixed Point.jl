

function FP() # This function will return the fixed point k_1, given the functions Q and K

  function j(x)
    Q(K(x)) - x
  end

  return fzero(j,[q_eq - A + eps(),1000])
  # NB: It must be the case that n_0>0, i.e q_0 > q_eq - A
  # Hence we need q_eq - A + epsilon on our lower bound.

end
