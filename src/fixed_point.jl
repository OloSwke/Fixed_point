module Solver

using Roots # Needed to find zeros using the fzero() function
export main, FP

  function main(parameters, N)
  # This function will return the fixed point given the parameters
  # defined in the dictionary of the main.jl file.


    # Retrieve the parameters from the dictionary
    alpha = parameters["alpha"]     # Output elasticity of the Financier
    a = parameters["a"]             # Marginal productivity of the Entrepreneur
    A = parameters["A"]             # Initial productivity shock
    beta = parameters["beta"]       # Discount rate
    r = (1-beta)/beta               # From the intertemporal rate of marginal substitution
    k_ = parameters["k_"]           # Total fixed supply of capital

    # Define equilibrium values
    k_eq = k_-(a/alpha)^(1/(alpha-1))   # Capital allocation at equilibrium
    q_eq = a/r                          # Price of capital at equilibrium
    n_eq = a*k_eq                       # Net worth

    # Set up our vectors for the evolution of the economy
    k = zeros(N)                    # path of capital allocation
    k[1] = k_eq                     # as in the model (could be relaxed)
    n = zeros(N)                    # path of net worth
    q = zeros(N)                    # path of prices


    function Kmax(x=0) # This function will give k_t+1, given a value of n_t

      function g(y)
        (alpha*(k_-y)^(alpha-1)*y)/(1+r)-x
      end

      return fzero(g,[0,1])
    end


    function K(x=0) # This function will give k_1, given a value of q_0
      # NB: It must be the case that n_0 > 0, hence q_0 > q_eq - A

      function f(y)
        (alpha*(k_-y)^(alpha-1)*y)/(1+r)-(A+x-q_eq)k_eq
      end

      return fzero(f,[0,1])
    end


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

    function FP() # This function will return the fixed point k_1, using the functions Q and K

      function j(x)
        Q(K(x)) - x
      end
      return fzero(j,[q_eq - A + 1/10,1000])
      # NB: It must be the case that n_0>0, i.e Q(K(x)) > q_eq - A
      # Hence we need q_eq - A + epsilon on our lower bound.
    end

  return FP()

  end


end
