
# Just for now
N=10000
n = zeros(N)
k = zeros(N)
k[2] = 0.2


function Q(x=0) # This function will give q_0, given a value of k_1

  # First get the paths of n and k given an initial value k_1
    # (given no consumption and maximal investment)
    k[2] = x
    for i in 2:N-1
      n[i] = a*k[i]
      k[i+1] = Kmax(n[i])
    end
    n[N] = a*k[N]

    # Find the period in which we reach the equilibrium
    T = 0
    for i in 2:N
      if k[i] < k_eq
        T = T + 1
      end
    end

    # Set k_t, from equilibrium on
    for i in (T+2):N
      k[i] = k_eq
      n[i] = a*k_eq
    end

  # Now define the function of which we want to find the zero, using the above vectors
  function h(y)
    # First term
    z=0
		for i in 1:T+2
			z = z + alpha*(k_-k[i])^(alpha-1)/(1+r)^i
		end

    # Total expression
    return z + q_eq/(1+r)^(T) - y

  end

  return fzero(h,[n[1]/A,1000])

end
