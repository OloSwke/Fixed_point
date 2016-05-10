

# Parameters

alpha = 0.4           # Standard
a = 0.7               # arbitrary (but respecting condition from footnote 2)
A = 0.5               # has to be smaller than a/(1+r)
k_ = 1                # Normalized

beta = 0.98           # arbitrary discount rate
r = (1-beta)/beta           # Interest rate

# Equilibrium values

k_eq = k_ - (a/alpha)^(1/(alpha-1))
q_eq = a/r




# Initializing vectors

N = 1000
k = zeros(N)
n = zeros(N)
q = zeros(N)

# Initial values

n[1] = (A+q[1])*k_eq - q_eq*k_eq




# k1 in terms of q0
q[1] = 20.0             #Just for now

  # Implicit K^max

      function f(k)
        (alpha*(k_-k)^(alpha-1)*k)/(1+r)-n[t]
      end

function Kmax(q)

return fzero(f,[0,1])

end





# Evolution of the economy



k[t+1] =
