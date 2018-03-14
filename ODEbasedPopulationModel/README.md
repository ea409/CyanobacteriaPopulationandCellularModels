

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Population Based Models

#Working out the rising time of the sun:

```    
      day = floor(t/24) +1

      timeofday = mod(t,24)

        n = day + 0.0008
        
        M = mod(n*0.98560028 + 357.5291, 360)
        
        C = 1.9148*sind(M)+0.02*sind(2*M) + 0.0003*sind(3*M)
        
      lambda = mod(M + C + 180 + 102.9372, 360)
  
      delta = asind(sind(lambda)*sind(23.44))
    
        w = acosd((sind(-0.83) - sind(latitude)*sind(delta))/cosd(latitude)*cosd(delta))
        
      Jtransit = 2451545.5 + n + 0.0053*sind(M) - 0.0069*sind(2*lambda)
 
      Jrise = Jtransit - w/360
    
      Jrise = Jrise - floor(Jrise)
    
      Sunrise = Jrise*24
  
```

# the sunlight intensity as a function of day

```

    A = Gsc*(sind(latitude)*sind(delta) + cosd(latitude)*cosd(delta));

```

#calculating the light intensity

```
    gamma = cos((timeofday - 12)*pi/12);

      rho = cos((Sunrise - 12)*pi/12);
      
    alpha = -((-beta*rho + log(-xs/(-1 + xs)))/beta);
    
      I = A*(exp(beta*(gamma - alpha)))/(1+exp(beta*(gamma - alpha)));
    
```    
    
Photosynthesis rate(Ph)
<a href="https://www.codecogs.com/eqnedit.php?latex=$$Z&space;=&space;k&space;\frac{I}{k_I&space;&plus;&space;I}.&space;\frac{V}{k_V&space;&plus;&space;V}$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$Z&space;=&space;k&space;\frac{I}{k_I&space;&plus;&space;I}.&space;\frac{V}{k_V&space;&plus;&space;V}$$" title="$$Z = k \frac{I}{k_I + I}. \frac{V}{k_V + V}$$" /></a>
where I is the incident light intensity

Growth rate (Z)
<a href="https://www.codecogs.com/eqnedit.php?latex=$$Z&space;=&space;k&space;\frac{N}{k_N&space;&plus;&space;N}.&space;\frac{C}{k_C&space;&plus;&space;C}&space;.\frac{P}{k_P&space;&plus;&space;P}$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$Z&space;=&space;k&space;\frac{N}{k_N&space;&plus;&space;N}.&space;\frac{C}{k_C&space;&plus;&space;C}&space;.\frac{P}{k_P&space;&plus;&space;P}$$" title="$$Z = k \frac{N}{k_N + N}. \frac{C}{k_C + C} .\frac{P}{k_P + P}$$" /></a>

circadian rhythms

<a href="https://www.codecogs.com/eqnedit.php?latex=$$\frac{dN}{dt}&space;=&space;\alpha&space;\delta_{1-circadian}\frac{C}{C&space;&plus;&space;k}&space;-&space;\rho{VZ}&space;-&space;\kappa&space;(V)&space;\frac{N}{k_N&space;&plus;&space;N}$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$\frac{dN}{dt}&space;=&space;\alpha&space;\delta_{1-circadian}\frac{C}{C&space;&plus;&space;k}&space;-&space;\rho{VZ}&space;-&space;\kappa&space;(V)&space;\frac{N}{k_N&space;&plus;&space;N}$$" title="$$\frac{dN}{dt} = \alpha \delta_{1-circadian}\frac{C}{C + k} - \rho{VZ} - \kappa (V) \frac{N}{k_N + N}$$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$\frac{dV}{dt}&space;=&space;V&space;(\theta&space;Z&space;-&space;\gamma&space;V)$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$\frac{dV}{dt}&space;=&space;V&space;(\theta&space;Z&space;-&space;\gamma&space;V)$$" title="$$\frac{dV}{dt} = V (\theta Z - \gamma V)$$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$\frac{dC}{dt}&space;=&space;Ph&space;.L.\delta_{circadian}&space;-&space;\gamma_2&space;V&space;Z&space;-&space;\delta_{1-circadian}\frac{C}{C&space;&plus;&space;k}&space;-&space;V\frac{C}{k_C&space;&plus;&space;C}$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$\frac{dC}{dt}&space;=&space;Ph&space;.L.\delta_{circadian}&space;-&space;\gamma_2&space;V&space;Z&space;-&space;\delta_{1-circadian}\frac{C}{C&space;&plus;&space;k}&space;-&space;V\frac{C}{k_C&space;&plus;&space;C}$$" title="$$\frac{dC}{dt} = Ph .L.\delta_{circadian} - \gamma_2 V Z - \delta_{1-circadian}\frac{C}{C + k} - V\frac{C}{k_C + C}$$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$\frac{dP_{ext}}{dt}&space;=&space;K_{\rho}&space;-&space;\frac{P_{ext}}{P_{ext}&space;&plus;&space;kP_{ext}}.V$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$\frac{dP_{ext}}{dt}&space;=&space;K_{\rho}&space;-&space;\frac{P_{ext}}{P_{ext}&space;&plus;&space;kP_{ext}}.V$$" title="$$\frac{dP_{ext}}{dt} = K_{\rho} - \frac{P_{ext}}{P_{ext} + kP_{ext}}.V$$" /></a>

Heterocystous Species 

<a href="https://www.codecogs.com/eqnedit.php?latex=$$\frac{dN}{dt}&space;=&space;\alpha&space;H&space;\frac{C}{C&space;&plus;&space;k}&space;-&space;\rho{VZ}&space;-&space;\kappa&space;(V&plus;H)&space;\frac{N}{k_N&space;&plus;&space;N}$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$\frac{dN}{dt}&space;=&space;\alpha&space;H&space;\frac{C}{C&space;&plus;&space;k}&space;-&space;\rho{VZ}&space;-&space;\kappa&space;(V&plus;H)&space;\frac{N}{k_N&space;&plus;&space;N}$$" title="$$\frac{dN}{dt} = \alpha H \frac{C}{C + k} - \rho{VZ} - \kappa (V+H) \frac{N}{k_N + N}$$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$\frac{dV}{dt}&space;=&space;V.&space;(\theta.&space;pr.&space;Z&space;-&space;\gamma(V&plus;H))$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$\frac{dV}{dt}&space;=&space;V.&space;(\theta.&space;pr.&space;Z&space;-&space;\gamma(V&plus;H))$$" title="$$\frac{dV}{dt} = V. (\theta. pr. Z - \gamma(V+H))$$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$\frac{dH}{dt}&space;=&space;\rho&space;(1-pr)&space;.V&space;.Z&space;-\gamma&space;(H&space;&plus;&space;V)&space;H$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$\frac{dH}{dt}&space;=&space;\rho&space;(1-pr)&space;.V&space;.Z&space;-\gamma&space;(H&space;&plus;&space;V)&space;H$$" title="$$\frac{dH}{dt} = \rho (1-pr) .V .Z -\gamma (H + V) H$$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$\frac{dC}{dt}&space;=&space;Ph&space;.L&space;-&space;\gamma_2&space;V&space;Z&space;-&space;\alpha&space;H&space;\frac{C}{C&space;&plus;&space;k}&space;-&space;\kappa_2&space;(H&plus;V)\frac{C}{k_C&space;&plus;&space;C}$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$\frac{dC}{dt}&space;=&space;Ph&space;.L&space;-&space;\gamma_2&space;V&space;Z&space;-&space;\alpha&space;H&space;\frac{C}{C&space;&plus;&space;k}&space;-&space;\kappa_2&space;(H&plus;V)\frac{C}{k_C&space;&plus;&space;C}$$" title="$$\frac{dC}{dt} = Ph .L - \gamma_2 V Z - \alpha H \frac{C}{C + k} - \kappa_2 (H+V)\frac{C}{k_C + C}$$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$\frac{dP}{dt}&space;=&space;\xi&space;\frac{P_{ext}}{P_{ext}&space;&plus;&space;kP_{ext}}.V&space;-&space;\gamma_3&space;V&space;H&space;Z&space;-&space;\kappa_3(H&plus;V)\frac{P}{k_P&space;&plus;&space;P}$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$\frac{dP}{dt}&space;=&space;\xi&space;\frac{P_{ext}}{P_{ext}&space;&plus;&space;kP_{ext}}.V&space;-&space;\gamma_3&space;V&space;H&space;Z&space;-&space;\kappa_3(H&plus;V)\frac{P}{k_P&space;&plus;&space;P}$$" title="$$\frac{dP}{dt} = \xi \frac{P_{ext}}{P_{ext} + kP_{ext}}.V - \gamma_3 V H Z - \kappa_3(H+V)\frac{P}{k_P + P}$$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$\frac{dP_{ext}}{dt}&space;=&space;K_{\rho}&space;-&space;\frac{P_{ext}}{P_{ext}&space;&plus;&space;kP_{ext}}.V$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$\frac{dP_{ext}}{dt}&space;=&space;K_{\rho}&space;-&space;\frac{P_{ext}}{P_{ext}&space;&plus;&space;kP_{ext}}.V$$" title="$$\frac{dP_{ext}}{dt} = K_{\rho} - \frac{P_{ext}}{P_{ext} + kP_{ext}}.V$$" /></a>

Non-diazotrophic autotrophs (called "heterotrophic wrt N")

<a href="https://www.codecogs.com/eqnedit.php?latex=$$\frac{dN}{dt}&space;=&space;\alpha&space;\frac{N_{ext}}{{N_{ext}}&space;&plus;&space;k}&space;-&space;\rho{VZ}&space;-&space;\kappa&space;V&space;\frac{N}{k_N&space;&plus;&space;N}$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$\frac{dN}{dt}&space;=&space;\alpha&space;\frac{N_{ext}}{{N_{ext}}&space;&plus;&space;k}&space;-&space;\rho{VZ}&space;-&space;\kappa&space;V&space;\frac{N}{k_N&space;&plus;&space;N}$$" title="$$\frac{dN}{dt} = \alpha \frac{N_{ext}}{{N_{ext}} + k} - \rho{VZ} - \kappa V \frac{N}{k_N + N}$$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$\frac{dV}{dt}&space;=&space;V&space;(\theta&space;Z&space;-&space;\gamma&space;V)$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$\frac{dV}{dt}&space;=&space;V&space;(\theta&space;Z&space;-&space;\gamma&space;V)$$" title="$$\frac{dV}{dt} = V (\theta Z - \gamma V)$$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$\frac{dC}{dt}&space;=&space;Ph&space;.L&space;-&space;\gamma_2&space;V&space;Z&space;-&space;\kappa_2&space;V\frac{C}{k_C&space;&plus;&space;C}$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$\frac{dC}{dt}&space;=&space;Ph&space;.L&space;-&space;\gamma_2&space;V&space;Z&space;-&space;\kappa_2&space;V\frac{C}{k_C&space;&plus;&space;C}$$" title="$$\frac{dC}{dt} = Ph .L - \gamma_2 V Z - \kappa_2 V\frac{C}{k_C + C}$$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$\frac{dP}{dt}&space;=&space;\xi&space;\frac{P_{ext}}{P_{ext}&space;&plus;&space;kP_{ext}}.V&space;-&space;\gamma_3&space;V&space;Z&space;-&space;\kappa_3(V)\frac{P}{k_P&space;&plus;&space;P}$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$\frac{dP}{dt}&space;=&space;\xi&space;\frac{P_{ext}}{P_{ext}&space;&plus;&space;kP_{ext}}.V&space;-&space;\gamma_3&space;V&space;Z&space;-&space;\kappa_3(V)\frac{P}{k_P&space;&plus;&space;P}$$" title="$$\frac{dP}{dt} = \xi \frac{P_{ext}}{P_{ext} + kP_{ext}}.V - \gamma_3 V Z - \kappa_3(V)\frac{P}{k_P + P}$$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$\frac{dP_{ext}}{dt}&space;=&space;K_{\rho}&space;-&space;\frac{P_{ext}}{P_{ext}&space;&plus;&space;kP_{ext}}.V$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$\frac{dP_{ext}}{dt}&space;=&space;K_{\rho}&space;-&space;\frac{P_{ext}}{P_{ext}&space;&plus;&space;kP_{ext}}.V$$" title="$$\frac{dP_{ext}}{dt} = K_{\rho} - \frac{P_{ext}}{P_{ext} + kP_{ext}}.V$$" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=$$\frac{dN_{ext}}{dt}&space;=&space;K_{\nu}&space;-&space;\frac{N_{ext}}{N_{ext}&space;&plus;&space;kN_{ext}}.V$$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$$\frac{dN_{ext}}{dt}&space;=&space;K_{\nu}&space;-&space;\frac{N_{ext}}{N_{ext}&space;&plus;&space;kN_{ext}}.V$$" title="$$\frac{dN_{ext}}{dt} = K_{\nu} - \frac{N_{ext}}{N_{ext} + kN_{ext}}.V$$" /></a>

