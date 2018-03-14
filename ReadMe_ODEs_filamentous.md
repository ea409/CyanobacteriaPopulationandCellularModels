# Stochastic ODE-based model: Hetrocystic 

## Equations governing growth of the filamentous cyanobacteria:

for any cell:
<a href="https://www.codecogs.com/eqnedit.php?latex=\frac{dsN_i}{dt}&space;=&space;\alpha_1&space;\frac{fN_i&space;-&space;sN_i}{L_i}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\frac{dsN_i}{dt}&space;=&space;\alpha_1&space;\frac{fN_i&space;-&space;sN_i}{L_i}" title="\frac{dsN_i}{dt} = \alpha_1 \frac{fN_i - sN_i}{L_i}" /></a>

$$ \frac{dsN_i}{dt} = \alpha_1 \frac{fN_i - sN_i}{L_i} $$

$$ \frac{dsC_i}{dt} = \alpha_2 \frac{fC_i - sC_i}{L_i} $$

for Heterocysts:

$$ \frac{dHetR_i}{dt} = - \beta HetR_i $$

$$ \frac{PatS_i}{dt} = - \gamma (PatS_{i+1} + PatS_{i-1}) - \beta_2 PatS_i + \epsilon HetR_i $$

$$ \frac{dHetN_i}{dt} = -\gamma_2 (HetN_{i+1} + HetN_{i-1}) - \beta_3 $$

$$ \frac{dOx_i}{dt} = \rho (\frac{Ox_{i+1}}{L_{i+1}} + \frac{Ox_{i-1}}{L_{i-1}}) - \kappa .resp $$

$$ \frac{dfN_i}{dt} = \tau (\frac{fN_{i+1}}{L_{i+1}} + \frac{fN_{i-1}}{L_{i-1}}) - \mu G - \alpha_1 \frac{fN_i - sN_i}{L_i} + Nfix $$

$$ \frac{dP_i}{dt} = \tau_2 (\frac{P_{i+1}}{L_{i+1}} + \frac{P_{i-1}}{L_{i-1}}) - \lambda_2 \frac{P_i}{L_i} - \mu_2 G $$

$$ \frac{dfC_i}{dt} = \tau_3 (\frac{fC_{i+1}}{L_{i+1}} + \frac{fC_{i-1}}{L_{i-1}}) - \lambda_3
\frac{fC_i}{L_i} - \mu_3 G - \pi .resp - \alpha_2 \frac{fC_i - sC_i}{L_i} $$

$$ \frac{dL}{dt} = 0 $$

for Vegetative cells:

if, for cell i, sN < threshold & HetR < threshold

$$ \frac{dHetR_i}{dt} = \delta \frac{Thresh - sN_i}{K_a - sN_i}.\frac{\zeta}{K_b + PatS_i}  $$

$$ \frac{PatS_i}{dt} = - \gamma \frac{PatS_{i+1}}{L_{i+1}} + \frac{PatS_{i-1}}{L_{i-1}} - \beta PatS_i $$

$$ \frac{dHetN_i}{dt} = -\gamma_2 (\frac{HetN_{i+1}}{L_{i+1}} + \frac{HetN_{i-1}}{L_{i-1}}) - \beta_3 HetN_i$$

if, for cell i, sN > threshold | HetR > threshold

$$ \frac{dHetR_i}{dt} = 0 $$

$$ \frac{dOx_i}{dt} = \eta (\frac{Ox_{i+1}}{L_{i+1}} + \frac{Ox_{i-1}}{L_{i-1}}) + \iota Ph - \kappa .resp - \lambda_1 \frac{fN_i}{L_i} $$

$$ \frac{dfN_i}{dt} = \tau (\frac{fN_{i+1}}{L_{i+1}} + \frac{fN_{i-1}}{L_{i-1}}) - \mu G - \alpha_1 \frac{fN_i - sN_i}{L_i} - \lambda_2 \frac{fN_i}{L_i} $$

$$ \frac{dP_i}{dt} = \tau_2 (\frac{P_{i+1}}{L_{i+1}} + \frac{P_{i-1}}{L_{i-1}}) - \lambda_3 \frac{P_i}{L_i} - \mu_2 G $$

$$ \frac{dfC_i}{dt} = \tau_3 (\frac{fC_{i+1}}{L_{i+1}} + \frac{fC_{i-1}}{L_{i-1}}) - \lambda_4 \frac{fC_i}{L_i} - \mu_3 G + \theta Ph - \pi_2 .resp - \alpha_2 \frac{fC_i - sC_i}{L_i} $$

$$ \frac{dL}{dt} = G $$

Where photosynthesis, respiration and growth rate are:

$$ Ph = constant $$

$$ resp = \Gamma \frac{\frac{fC_i}{L_i}}{K_c + \frac{fC_i}{L_i}} .\frac{\frac{Ox_i}{L_i}}{K_d + \frac{Ox_i}{L_i}} $$

$$ G = \Psi \frac{\frac{fC_i}{L_i}}{K_1 + \frac{fC_i}{L_i}}. \frac{\frac{fN_i}{L_i}}{K_2 + \frac{fN_i}{L_i}}. \frac{\frac{P_i}{L_i}}{K_c + \frac{P_i}{L_i}} $$

$$Nfix = \frac{\psi}{k_\psi + \upsilon \frac{Ox_i}{L_i}} $$



