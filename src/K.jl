
# Just for now
N=100
q = zeros(N)
q[1] = 34 # NB: IMPORTANT: I think n_0 must be positive.

# Real stuff


function K(x=0) # This function will give k_1, given a value of q_0

  function f(y)
    (alpha*(k_-y)^(alpha-1)*y)/(1+r)-(A+x-q_eq)k_eq
  end

  return fzero(f,[0,1])

end

# NB: It must be the case that n_0>0
  # and hence q_0 > q_eq - A
