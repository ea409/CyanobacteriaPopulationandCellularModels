

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
$$Z = k \frac{I}{k_I + I}. \frac{V}{k_V + V}$$
where I is the incident light intensity

Growth rate (Z)
$$Z = k \frac{N}{k_N + N}. \frac{C}{k_C + C} .\frac{P}{k_P + P}$$

circadian rhythms

$$\frac{dN}{dt} = \alpha  \delta_{1-circadian}\frac{C}{C + k} - \rho{VZ} - \kappa (V) \frac{N}{k_N + N}$$ 
$$\frac{dV}{dt} = V (\theta Z - \gamma V)$$  
$$\frac{dC}{dt} = Ph .L.\delta_{circadian} - \gamma_2 V Z  -   \delta_{1-circadian}\frac{C}{C + k} - V\frac{C}{k_C + C}$$
$$\frac{dP_{ext}}{dt} = K_{\rho} - \frac{P_{ext}}{P_{ext} + kP_{ext}}.V$$

Heterocystous Species 

$$\frac{dN}{dt} = \alpha H \frac{C}{C + k} - \rho{VZ} - \kappa (V+H) \frac{N}{k_N + N}$$                                  
$$\frac{dV}{dt} = V. (\theta. pr. Z - \gamma(V+H))$$                                                                 
$$\frac{dH}{dt} = \rho (1-pr) .V .Z -\gamma (H + V) H$$                                                            
$$\frac{dC}{dt} = Ph .L - \gamma_2 V Z  - \alpha H \frac{C}{C + k} - \kappa_2 (H+V)\frac{C}{k_C + C}$$                        
$$\frac{dP}{dt} = \xi \frac{P_{ext}}{P_{ext} + kP_{ext}}.V - \gamma_3 V H Z - \kappa_3(H+V)\frac{P}{k_P + P}$$
$$\frac{dP_{ext}}{dt} = K_{\rho} - \frac{P_{ext}}{P_{ext} + kP_{ext}}.V$$ 

Non-diazotrophic autotrophs (called "heterotrophic wrt N")

$$\frac{dN}{dt} = \alpha  \frac{N_{ext}}{{N_{ext}} + k} - \rho{VZ} - \kappa V \frac{N}{k_N + N}$$
$$\frac{dV}{dt} = V (\theta Z - \gamma V)$$                                                
$$\frac{dC}{dt} = Ph .L - \gamma_2 V Z - \kappa_2 V\frac{C}{k_C + C}$$
$$\frac{dP}{dt} = \xi \frac{P_{ext}}{P_{ext} + kP_{ext}}.V - \gamma_3 V Z - \kappa_3(V)\frac{P}{k_P + P}$$
$$\frac{dP_{ext}}{dt} = K_{\rho} - \frac{P_{ext}}{P_{ext} + kP_{ext}}.V$$
$$\frac{dN_{ext}}{dt} = K_{\nu} - \frac{N_{ext}}{N_{ext} + kN_{ext}}.V$$


