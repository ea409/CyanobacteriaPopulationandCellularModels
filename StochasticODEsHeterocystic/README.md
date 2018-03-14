# Stochastic ODE-based model: Hetrocystic 

## Equations governing growth of the filamentous cyanobacteria:

for any cell:


<a href="https://www.codecogs.com/eqnedit.php?latex=\frac{dsN_i}{dt}&space;=&space;\alpha_1&space;\frac{fN_i&space;-&space;sN_i}{L_i}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\frac{dsN_i}{dt}&space;=&space;\alpha_1&space;\frac{fN_i&space;-&space;sN_i}{L_i}" title="\frac{dsN_i}{dt} = \alpha_1 \frac{fN_i - sN_i}{L_i}" /></a>



<a href="https://www.codecogs.com/eqnedit.php?latex=$$&space;\frac{dsN_i}{dt}&space;=&space;\alpha_1&space;\frac{fN_i&space;-&space;sN_i}{L_i}&space;$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$&space;\frac{dsN_i}{dt}&space;=&space;\alpha_1&space;\frac{fN_i&space;-&space;sN_i}{L_i}&space;$$" title="$$ \frac{dsN_i}{dt} = \alpha_1 \frac{fN_i - sN_i}{L_i} $$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$&space;\frac{dsC_i}{dt}&space;=&space;\alpha_2&space;\frac{fC_i&space;-&space;sC_i}{L_i}&space;$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$&space;\frac{dsC_i}{dt}&space;=&space;\alpha_2&space;\frac{fC_i&space;-&space;sC_i}{L_i}&space;$$" title="$$ \frac{dsC_i}{dt} = \alpha_2 \frac{fC_i - sC_i}{L_i} $$" /></a>


for Heterocysts:

<a href="https://www.codecogs.com/eqnedit.php?latex=$$&space;\frac{dHetR_i}{dt}&space;=&space;-&space;\beta&space;HetR_i&space;$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$&space;\frac{dHetR_i}{dt}&space;=&space;-&space;\beta&space;HetR_i&space;$$" title="$$ \frac{dHetR_i}{dt} = - \beta HetR_i $$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$&space;\frac{PatS_i}{dt}&space;=&space;-&space;\gamma&space;(PatS_{i&plus;1}&space;&plus;&space;PatS_{i-1})&space;-&space;\beta_2&space;PatS_i&space;&plus;&space;\epsilon&space;HetR_i&space;$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$&space;\frac{PatS_i}{dt}&space;=&space;-&space;\gamma&space;(PatS_{i&plus;1}&space;&plus;&space;PatS_{i-1})&space;-&space;\beta_2&space;PatS_i&space;&plus;&space;\epsilon&space;HetR_i&space;$$" title="$$ \frac{PatS_i}{dt} = - \gamma (PatS_{i+1} + PatS_{i-1}) - \beta_2 PatS_i + \epsilon HetR_i $$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$&space;\frac{dHetN_i}{dt}&space;=&space;-\gamma_2&space;(HetN_{i&plus;1}&space;&plus;&space;HetN_{i-1})&space;-&space;\beta_3&space;$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$&space;\frac{dHetN_i}{dt}&space;=&space;-\gamma_2&space;(HetN_{i&plus;1}&space;&plus;&space;HetN_{i-1})&space;-&space;\beta_3&space;$$" title="$$ \frac{dHetN_i}{dt} = -\gamma_2 (HetN_{i+1} + HetN_{i-1}) - \beta_3 $$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$&space;\frac{dOx_i}{dt}&space;=&space;\rho&space;(\frac{Ox_{i&plus;1}}{L_{i&plus;1}}&space;&plus;&space;\frac{Ox_{i-1}}{L_{i-1}})&space;-&space;\kappa&space;.resp&space;$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$&space;\frac{dOx_i}{dt}&space;=&space;\rho&space;(\frac{Ox_{i&plus;1}}{L_{i&plus;1}}&space;&plus;&space;\frac{Ox_{i-1}}{L_{i-1}})&space;-&space;\kappa&space;.resp&space;$$" title="$$ \frac{dOx_i}{dt} = \rho (\frac{Ox_{i+1}}{L_{i+1}} + \frac{Ox_{i-1}}{L_{i-1}}) - \kappa .resp $$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$&space;\frac{dfN_i}{dt}&space;=&space;\tau&space;(\frac{fN_{i&plus;1}}{L_{i&plus;1}}&space;&plus;&space;\frac{fN_{i-1}}{L_{i-1}})&space;-&space;\mu&space;G&space;-&space;\alpha_1&space;\frac{fN_i&space;-&space;sN_i}{L_i}&space;&plus;&space;Nfix&space;$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$&space;\frac{dfN_i}{dt}&space;=&space;\tau&space;(\frac{fN_{i&plus;1}}{L_{i&plus;1}}&space;&plus;&space;\frac{fN_{i-1}}{L_{i-1}})&space;-&space;\mu&space;G&space;-&space;\alpha_1&space;\frac{fN_i&space;-&space;sN_i}{L_i}&space;&plus;&space;Nfix&space;$$" title="$$ \frac{dfN_i}{dt} = \tau (\frac{fN_{i+1}}{L_{i+1}} + \frac{fN_{i-1}}{L_{i-1}}) - \mu G - \alpha_1 \frac{fN_i - sN_i}{L_i} + Nfix $$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$&space;\frac{dP_i}{dt}&space;=&space;\tau_2&space;(\frac{P_{i&plus;1}}{L_{i&plus;1}}&space;&plus;&space;\frac{P_{i-1}}{L_{i-1}})&space;-&space;\lambda_2&space;\frac{P_i}{L_i}&space;-&space;\mu_2&space;G&space;$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$&space;\frac{dP_i}{dt}&space;=&space;\tau_2&space;(\frac{P_{i&plus;1}}{L_{i&plus;1}}&space;&plus;&space;\frac{P_{i-1}}{L_{i-1}})&space;-&space;\lambda_2&space;\frac{P_i}{L_i}&space;-&space;\mu_2&space;G&space;$$" title="$$ \frac{dP_i}{dt} = \tau_2 (\frac{P_{i+1}}{L_{i+1}} + \frac{P_{i-1}}{L_{i-1}}) - \lambda_2 \frac{P_i}{L_i} - \mu_2 G $$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$&space;\frac{dfC_i}{dt}&space;=&space;\tau_3&space;(\frac{fC_{i&plus;1}}{L_{i&plus;1}}&space;&plus;&space;\frac{fC_{i-1}}{L_{i-1}})&space;-&space;\lambda_3&space;\frac{fC_i}{L_i}&space;-&space;\mu_3&space;G&space;-&space;\pi&space;.resp&space;-&space;\alpha_2&space;\frac{fC_i&space;-&space;sC_i}{L_i}&space;$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$&space;\frac{dfC_i}{dt}&space;=&space;\tau_3&space;(\frac{fC_{i&plus;1}}{L_{i&plus;1}}&space;&plus;&space;\frac{fC_{i-1}}{L_{i-1}})&space;-&space;\lambda_3&space;\frac{fC_i}{L_i}&space;-&space;\mu_3&space;G&space;-&space;\pi&space;.resp&space;-&space;\alpha_2&space;\frac{fC_i&space;-&space;sC_i}{L_i}&space;$$" title="$$ \frac{dfC_i}{dt} = \tau_3 (\frac{fC_{i+1}}{L_{i+1}} + \frac{fC_{i-1}}{L_{i-1}}) - \lambda_3 \frac{fC_i}{L_i} - \mu_3 G - \pi .resp - \alpha_2 \frac{fC_i - sC_i}{L_i} $$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$&space;\frac{dL}{dt}&space;=&space;0&space;$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$&space;\frac{dL}{dt}&space;=&space;0&space;$$" title="$$ \frac{dL}{dt} = 0 $$" /></a>

for Vegetative cells:

if, for cell i, sN < threshold & HetR < threshold

<a href="https://www.codecogs.com/eqnedit.php?latex=$$&space;\frac{dHetR_i}{dt}&space;=&space;\delta&space;\frac{Thresh&space;-&space;sN_i}{K_a&space;-&space;sN_i}.\frac{\zeta}{K_b&space;&plus;&space;PatS_i}&space;$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$&space;\frac{dHetR_i}{dt}&space;=&space;\delta&space;\frac{Thresh&space;-&space;sN_i}{K_a&space;-&space;sN_i}.\frac{\zeta}{K_b&space;&plus;&space;PatS_i}&space;$$" title="$$ \frac{dHetR_i}{dt} = \delta \frac{Thresh - sN_i}{K_a - sN_i}.\frac{\zeta}{K_b + PatS_i} $$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$&space;\frac{PatS_i}{dt}&space;=&space;-&space;\gamma&space;\frac{PatS_{i&plus;1}}{L_{i&plus;1}}&space;&plus;&space;\frac{PatS_{i-1}}{L_{i-1}}&space;-&space;\beta&space;PatS_i&space;$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$&space;\frac{PatS_i}{dt}&space;=&space;-&space;\gamma&space;\frac{PatS_{i&plus;1}}{L_{i&plus;1}}&space;&plus;&space;\frac{PatS_{i-1}}{L_{i-1}}&space;-&space;\beta&space;PatS_i&space;$$" title="$$ \frac{PatS_i}{dt} = - \gamma \frac{PatS_{i+1}}{L_{i+1}} + \frac{PatS_{i-1}}{L_{i-1}} - \beta PatS_i $$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$&space;\frac{dHetN_i}{dt}&space;=&space;-\gamma_2&space;(\frac{HetN_{i&plus;1}}{L_{i&plus;1}}&space;&plus;&space;\frac{HetN_{i-1}}{L_{i-1}})&space;-&space;\beta_3&space;HetN_i$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$&space;\frac{dHetN_i}{dt}&space;=&space;-\gamma_2&space;(\frac{HetN_{i&plus;1}}{L_{i&plus;1}}&space;&plus;&space;\frac{HetN_{i-1}}{L_{i-1}})&space;-&space;\beta_3&space;HetN_i$$" title="$$ \frac{dHetN_i}{dt} = -\gamma_2 (\frac{HetN_{i+1}}{L_{i+1}} + \frac{HetN_{i-1}}{L_{i-1}}) - \beta_3 HetN_i$$" /></a>

if, for cell i, sN > threshold | HetR > threshold

<a href="https://www.codecogs.com/eqnedit.php?latex=$$&space;\frac{dHetR_i}{dt}&space;=&space;0&space;$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$&space;\frac{dHetR_i}{dt}&space;=&space;0&space;$$" title="$$ \frac{dHetR_i}{dt} = 0 $$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$&space;\frac{dOx_i}{dt}&space;=&space;\eta&space;(\frac{Ox_{i&plus;1}}{L_{i&plus;1}}&space;&plus;&space;\frac{Ox_{i-1}}{L_{i-1}})&space;&plus;&space;\iota&space;Ph&space;-&space;\kappa&space;.resp&space;-&space;\lambda_1&space;\frac{fN_i}{L_i}&space;$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$&space;\frac{dOx_i}{dt}&space;=&space;\eta&space;(\frac{Ox_{i&plus;1}}{L_{i&plus;1}}&space;&plus;&space;\frac{Ox_{i-1}}{L_{i-1}})&space;&plus;&space;\iota&space;Ph&space;-&space;\kappa&space;.resp&space;-&space;\lambda_1&space;\frac{fN_i}{L_i}&space;$$" title="$$ \frac{dOx_i}{dt} = \eta (\frac{Ox_{i+1}}{L_{i+1}} + \frac{Ox_{i-1}}{L_{i-1}}) + \iota Ph - \kappa .resp - \lambda_1 \frac{fN_i}{L_i} $$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$&space;\frac{dfN_i}{dt}&space;=&space;\tau&space;(\frac{fN_{i&plus;1}}{L_{i&plus;1}}&space;&plus;&space;\frac{fN_{i-1}}{L_{i-1}})&space;-&space;\mu&space;G&space;-&space;\alpha_1&space;\frac{fN_i&space;-&space;sN_i}{L_i}&space;-&space;\lambda_2&space;\frac{fN_i}{L_i}&space;$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$&space;\frac{dfN_i}{dt}&space;=&space;\tau&space;(\frac{fN_{i&plus;1}}{L_{i&plus;1}}&space;&plus;&space;\frac{fN_{i-1}}{L_{i-1}})&space;-&space;\mu&space;G&space;-&space;\alpha_1&space;\frac{fN_i&space;-&space;sN_i}{L_i}&space;-&space;\lambda_2&space;\frac{fN_i}{L_i}&space;$$" title="$$ \frac{dfN_i}{dt} = \tau (\frac{fN_{i+1}}{L_{i+1}} + \frac{fN_{i-1}}{L_{i-1}}) - \mu G - \alpha_1 \frac{fN_i - sN_i}{L_i} - \lambda_2 \frac{fN_i}{L_i} $$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$&space;\frac{dP_i}{dt}&space;=&space;\tau_2&space;(\frac{P_{i&plus;1}}{L_{i&plus;1}}&space;&plus;&space;\frac{P_{i-1}}{L_{i-1}})&space;-&space;\lambda_3&space;\frac{P_i}{L_i}&space;-&space;\mu_2&space;G&space;$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$&space;\frac{dP_i}{dt}&space;=&space;\tau_2&space;(\frac{P_{i&plus;1}}{L_{i&plus;1}}&space;&plus;&space;\frac{P_{i-1}}{L_{i-1}})&space;-&space;\lambda_3&space;\frac{P_i}{L_i}&space;-&space;\mu_2&space;G&space;$$" title="$$ \frac{dP_i}{dt} = \tau_2 (\frac{P_{i+1}}{L_{i+1}} + \frac{P_{i-1}}{L_{i-1}}) - \lambda_3 \frac{P_i}{L_i} - \mu_2 G $$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$&space;\frac{dfC_i}{dt}&space;=&space;\tau_3&space;(\frac{fC_{i&plus;1}}{L_{i&plus;1}}&space;&plus;&space;\frac{fC_{i-1}}{L_{i-1}})&space;-&space;\lambda_4&space;\frac{fC_i}{L_i}&space;-&space;\mu_3&space;G&space;&plus;&space;\theta&space;Ph&space;-&space;\pi_2&space;.resp&space;-&space;\alpha_2&space;\frac{fC_i&space;-&space;sC_i}{L_i}&space;$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$&space;\frac{dfC_i}{dt}&space;=&space;\tau_3&space;(\frac{fC_{i&plus;1}}{L_{i&plus;1}}&space;&plus;&space;\frac{fC_{i-1}}{L_{i-1}})&space;-&space;\lambda_4&space;\frac{fC_i}{L_i}&space;-&space;\mu_3&space;G&space;&plus;&space;\theta&space;Ph&space;-&space;\pi_2&space;.resp&space;-&space;\alpha_2&space;\frac{fC_i&space;-&space;sC_i}{L_i}&space;$$" title="$$ \frac{dfC_i}{dt} = \tau_3 (\frac{fC_{i+1}}{L_{i+1}} + \frac{fC_{i-1}}{L_{i-1}}) - \lambda_4 \frac{fC_i}{L_i} - \mu_3 G + \theta Ph - \pi_2 .resp - \alpha_2 \frac{fC_i - sC_i}{L_i} $$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$&space;\frac{dL}{dt}&space;=&space;G&space;$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$&space;\frac{dL}{dt}&space;=&space;G&space;$$" title="$$ \frac{dL}{dt} = G $$" /></a>

Where photosynthesis, respiration and growth rate are:

<a href="https://www.codecogs.com/eqnedit.php?latex=$$&space;Ph&space;=&space;constant&space;$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$&space;Ph&space;=&space;constant&space;$$" title="$$ Ph = constant $$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$&space;resp&space;=&space;\Gamma&space;\frac{\frac{fC_i}{L_i}}{K_c&space;&plus;&space;\frac{fC_i}{L_i}}&space;.\frac{\frac{Ox_i}{L_i}}{K_d&space;&plus;&space;\frac{Ox_i}{L_i}}&space;$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$&space;resp&space;=&space;\Gamma&space;\frac{\frac{fC_i}{L_i}}{K_c&space;&plus;&space;\frac{fC_i}{L_i}}&space;.\frac{\frac{Ox_i}{L_i}}{K_d&space;&plus;&space;\frac{Ox_i}{L_i}}&space;$$" title="$$ resp = \Gamma \frac{\frac{fC_i}{L_i}}{K_c + \frac{fC_i}{L_i}} .\frac{\frac{Ox_i}{L_i}}{K_d + \frac{Ox_i}{L_i}} $$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$&space;G&space;=&space;\Psi&space;\frac{\frac{fC_i}{L_i}}{K_1&space;&plus;&space;\frac{fC_i}{L_i}}.&space;\frac{\frac{fN_i}{L_i}}{K_2&space;&plus;&space;\frac{fN_i}{L_i}}.&space;\frac{\frac{P_i}{L_i}}{K_c&space;&plus;&space;\frac{P_i}{L_i}}&space;$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$&space;G&space;=&space;\Psi&space;\frac{\frac{fC_i}{L_i}}{K_1&space;&plus;&space;\frac{fC_i}{L_i}}.&space;\frac{\frac{fN_i}{L_i}}{K_2&space;&plus;&space;\frac{fN_i}{L_i}}.&space;\frac{\frac{P_i}{L_i}}{K_c&space;&plus;&space;\frac{P_i}{L_i}}&space;$$" title="$$ G = \Psi \frac{\frac{fC_i}{L_i}}{K_1 + \frac{fC_i}{L_i}}. \frac{\frac{fN_i}{L_i}}{K_2 + \frac{fN_i}{L_i}}. \frac{\frac{P_i}{L_i}}{K_c + \frac{P_i}{L_i}} $$" /></a>


<a href="https://www.codecogs.com/eqnedit.php?latex=$$Nfix&space;=&space;\frac{\psi}{k_\psi&space;&plus;&space;\upsilon&space;\frac{Ox_i}{L_i}}&space;$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$Nfix&space;=&space;\frac{\psi}{k_\psi&space;&plus;&space;\upsilon&space;\frac{Ox_i}{L_i}}&space;$$" title="$$Nfix = \frac{\psi}{k_\psi + \upsilon \frac{Ox_i}{L_i}} $$" /></a>



