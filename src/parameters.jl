# Just to set up the parameters for now and see what I need

alpha = 0.4           # Standard
a = 0.7               # arbitrary (but respecting condition from footnote 2)
A = 0.5               # has to be smaller than a/(1+r)
beta = 0.98           # arbitrary discount rate
r = (1-beta)/beta     # Interest rate
k_ = 1                # Normalized
N=100

# To do later when using the dictionary:

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
