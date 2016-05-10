module Nom

  using Roots

  # Retrieve the parameters from the dictionary
  e = parameters["e"]         # Endowments of the Financier
  k_ = parameters["k_"]       # Total fixed supply of capital
  a = parameters["a"]         # Marginal production of the Entrepreneur
  alpha = paramters["alpha"]  # Output elasticity of the Financier
  beta = parameters["beta"]   # Discount rate
  r = (1-beta)/beta           # Interest rate
  # shock a0

  # Create blank vectors to be filled as the model evolves
  q = zeros(N)              # Price of capital
  c_E = zeros(N)            # Consumption of the Entrepreneur
  c_F = zeros(N)            # Consumption of the Financier
  k_E = zeros(N)            # Capital of the Entrepreneur
  k_F = zeros(N)            # Capital of the Financier
  d = zeros(N)              # Debt issued by E and bought by F
  n = zeros(N)              # Net worth of E


  # Define important functions and flow of funds
  F(x) = ax                   # E's production function
  G(x) = x^alpha              # F's production function
  G'(x) = alpha*x^(alpha-1)   # F's marginal productivity
  n(t) = F(k_E[t])+q[t]k_E[t] - d[t]    # Definition of E's net worth
  n(t) = G'(k_-k_E[t+1])k_E[t+1]  # Implicit definition of K^max


  # Evolution of the economy
