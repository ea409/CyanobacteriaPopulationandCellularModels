function [dydt] = grow3(t,y,A)
%This simulates the growth of a group of cells from one cell division or differentiation until
%the next.
% Parameter Defintions
         nvp = 10;                      % Number of variables we are modelling
% World parameters
       extfN = 0;          % Amount of extracellular fixed nitrogen
        extP = 0.8;
       extfC = 0.05;
          LI = 1;
       
% Cell intrinsic parameters
           n = 0.07;                                % Amount of fixed nitrogen required for growth per unit length
           c = 0.05;
           p = 0.005;
           R = 4;                                       % Baseline growth rate of the cyanobacterium
          fs = 0.5;                                     % Constant of conversion from fN to stored N.
        fCfN = 24;                                       % The carbon cost for nitrogen fixation
       kfCfN = 0.5;                                       % Concentration of carbon for half maximum nitrogen fixation
        OxPH = 140;                                     % Constant for oxygen production by photosynthesis
        OxRE = 15;                                      % Constant for oxygen consumption by respiration
        CaPH = 150;
        CaRE = 15;
        
% Kinetic parameters
   kfC = 1.2;                                             % Conc. of fixed carbon for half maximal growth
   kfN = 0.3;                                             % Conc. of fixed nitrogen for half maximal growth                                                
    kP = 0.002;                                           % Conc. of phosphate for half maximal growth
    rR = 5.3;
   kRC = 0.08;
  kROx = 0.8;
    rP = 0.5;
    
% Diffusion parameters
        
    D_leakfN = 0.0042;                   % Diffusion from within cells to the extracellular environment
    D_leakP = 0.0029;
    D_leakfC = 0.0029;
     D_impfN = 0.29;                     % Diffusion from outside the cells to within the cells
      D_impP = 0.03;                   
     D_impfC = 0.05;                 
     
     % Of which Anabaena specific:
         DfN = 5;                                   % Diffusion coefficient of nitrogen between cells
          DP = 0.1;
         DfC = 14;
         DOx = 350;
         DpR = 50;                                      % HetN and PatS Diffusion coefficient between cells
      PrLoss = 6;                                       % Loss of HetN due to leakage and degradation
    HetNProd = 6.5e3;
   HetOxDiff = 0.8;                                     % Oxygen diffusion in and out of heterocysts is 'HetOxDiff' of the amount between vegetative cells.
       minSn = 0.15;                                    % Minimum amount of stored nitrogen needed for differentiation

% Pre-defining a vector of zeros for dydt
dydt = zeros(nvp*length(A)+1,1);
iLux = nvp*length(A) + 1;

%for i=1:length(A)
%Specifying the different indices:
    Vector= 1:length(A)*nvp;
    indexofvariable =(floor((Vector-1)/nvp))*nvp + mod(Vector-1,nvp)+1;
    leftindexofvariable = (floor((Vector-1)/nvp))*nvp + mod(Vector-1,nvp)+1 -nvp;
    leftindexofvariable(leftindexofvariable < 0)= 0;
    rightindexofvariable =(floor((Vector-1)/nvp))*nvp + mod(Vector-1,nvp)+1 +nvp;
    rightindexofvariable(rightindexofvariable > nvp*length(A))= 0;

% Concentrations

cfC = y(indexofvariable( mod(Vector,10)==9))'./y(indexofvariable( mod(Vector,10)==0))';
%csC = y(isC)/y(iL); 
csC = y(indexofvariable( mod(Vector,10)==2))'./y(indexofvariable( mod(Vector,10)==0))';
%cfN = y(ifN)/y(iL);
cfN = y(indexofvariable( mod(Vector,10)==7))'./y(indexofvariable( mod(Vector,10)==0))';
%csN = y(isN)/y(iL);
csN = y(indexofvariable( mod(Vector,10)==1))'./y(indexofvariable( mod(Vector,10)==0))';
%cP = y(iP)/y(iL);
cP = y(indexofvariable( mod(Vector,10)==8))'./y(indexofvariable( mod(Vector,10)==0))';
%cOx = y(iOx)/y(iL);
cOx = y(indexofvariable( mod(Vector,10)==6))'./y(indexofvariable( mod(Vector,10)==0))';
% Storage and mobilisation

 fNsN = fs.*cfN - csN;                                              % Liberation/storage of nitrogen: Mass Action 
 fCsC = (fs+0.7).*cfC - csC;                                       


%Differences Between heterocysts and non-heterocysts:
Veg = ones(1,length(A))-[A.DifferentiationFinished];  % A value of '1' for all vegetative cells
GR = ([A.GrowthPara].*(R*cfC./(kfC + cfC)).*(R*cfN./(kfN + cfN)).*(R*cP./(kP + cP))).*Veg;

%for i =1:length(A)
% Cell in the filament
 %if i > 1 && i < length(A);
                %cLfC = y(iLfC)/y(iLL);  % The 3 represents a 'fudge factor'
 cLfC = [0, y(leftindexofvariable(mod(Vector,10)==9 & leftindexofvariable>0))']./[1, y(leftindexofvariable(mod(Vector,10)==0 & leftindexofvariable>0))'];
                %%cLsC = y(iLsC)/y(iLL); 
                %cLfN = y(iLfN)/y(iLL);
 cLfN = [0, y(leftindexofvariable(mod(Vector,10)==7 & leftindexofvariable>0))']./[1,y(leftindexofvariable(mod(Vector,10)==0 & leftindexofvariable>0))'];
                %%cLsN = y(iLsN)/y(iLL);
                %cLP = (iLP)/y(iLL);
 cLP = [0, y(leftindexofvariable(mod(Vector,10)==8 & leftindexofvariable>0))']./[1,y(leftindexofvariable(mod(Vector,10)==0 & leftindexofvariable>0))'];
                %cLOx = (iLOx)/y(iLL);
 cLOx = [0, y(leftindexofvariable(mod(Vector,10)==6 & leftindexofvariable>0))']./[1,y(leftindexofvariable(mod(Vector,10)==0 & leftindexofvariable>0))'];
 
 
                %cRfC = y(iRfC)/y(iRL);  % The 3 represents a 'fudge factor'
 cRfC = [y(rightindexofvariable(mod(Vector,10)==9 & rightindexofvariable>0))',0]./[y(rightindexofvariable(mod(Vector,10)==0 & rightindexofvariable>0))' ,1];
                %%cRsC = y(iRsC)/y(iRL); 
                %cRfN = y(iRfN)/y(iRL);
 cRfN = [y(rightindexofvariable(mod(Vector,10)==7 & rightindexofvariable>0))',0]./[y(rightindexofvariable(mod(Vector,10)==0 & rightindexofvariable>0))' ,1];
                %%cRsN = y(iRsN)/y(iRL);
                %cRP = y(iRP)/y(iRL);
 cRP = [y(rightindexofvariable(mod(Vector,10)==8 & rightindexofvariable>0))',0]./[y(rightindexofvariable(mod(Vector,10)==0 & rightindexofvariable>0))' ,1];
                %cROx = y(iROx)/y(iRL);
 cROx = [y(rightindexofvariable(mod(Vector,10)==6 & rightindexofvariable>0))',0]./[y(rightindexofvariable(mod(Vector,10)==0 & rightindexofvariable>0))' ,1];
                        

% Different diffusion for different cell positions
            %% Nitrogen
            fN_in = DfN.*cRfN + DfN.*cLfN+ D_impfN.*y(indexofvariable(mod(Vector,10)==0))'.*extfN;
            fN_out = - 2.*DfN.*cfN - D_leakfN.*y(indexofvariable(mod(Vector,10)==7))';
            %% Phosphate
            P_in = DP.*cRP + DP.*cLP+ D_impP.*y(indexofvariable(mod(Vector,10)==0))'.*extP;
            P_out = - 2.*DP.*cP - D_leakP.*y(indexofvariable(mod(Vector,10)==8))';
            %% Carbon
            fC_in = DfC.*cRfC + DfC.*cLfC+ D_impfC.*y(indexofvariable(mod(Vector,10)==0))'.*extfC;
            fC_out = - 2.*DfC.*cfC - D_leakfC.*y(indexofvariable(mod(Vector,10)==9))';
            %% Oxygen
            Ox_in = DOx.*cROx + DOx.*cLOx;
            Ox_out = - 2.*DOx.*cOx;
            
            %% Proteins
            PatS_in = DpR.*[0,y(leftindexofvariable(mod(Vector,10)==4 & leftindexofvariable~=0))']./[1,y(leftindexofvariable(mod(Vector,10)==0 & leftindexofvariable ~= 0))'] + DpR.*[y(rightindexofvariable(mod(Vector,10)==4 & rightindexofvariable~=0))',0]./[y(rightindexofvariable(mod(Vector,10)==0 & rightindexofvariable~=0))',1];
            HetN_in = DpR.*[0, y(leftindexofvariable( mod(Vector,10)==5 & leftindexofvariable~=0))']./[1, y(leftindexofvariable(mod(Vector,10)==0 & leftindexofvariable~=0))'] + DpR.*[y(rightindexofvariable(mod(Vector,10)==5 & rightindexofvariable~=0))',0]./[y(rightindexofvariable(mod(Vector,10)==0 & rightindexofvariable~=0))',1];
            PatS_out = - PrLoss.*y(indexofvariable(mod(Vector,10)==4))' - 2.*DpR.*y(indexofvariable(mod(Vector,10)==4))'./y(indexofvariable(mod(Vector,10)==0))';
            HetN_out = - 1.2*PrLoss.*y(indexofvariable(mod(Vector,10)==5))' - 2.*DpR.*y(indexofvariable(mod(Vector,10)==5))'./y(indexofvariable(mod(Vector,10)==0))';

        
    % Altering the rate of hetR degradation is the simplest way to change heterocyst spacing.
    HetR_out = [y(indexofvariable(mod(Vector,10)==3))'].*PrLoss.*0.2;
    dhR=zeros(1,length(A));
    Assignment = 10*(0.35 - y(indexofvariable(mod(Vector,10)==1))' )./(0.3 + (0.35 - y(indexofvariable(mod(Vector,10)==1))'));

    if sum(y(indexofvariable(mod(Vector,10)==1)) < minSn) > 0
    dhR(y(indexofvariable(mod(Vector,10)==1)) < minSn) = Assignment(y(indexofvariable(mod(Vector,10)==1))< minSn);
    end 
    
    PatSProd=zeros(1,length(A));
    PatSProd(y(indexofvariable(mod(Vector,10)==3)) > 0.5) = 0.5;
    dhR(y(indexofvariable(mod(Vector,10)==4))> 0.1) = 0; 
    dhR(y(indexofvariable(mod(Vector,10)==5))> 0.16) = 0; 
   
% Key cellular processes
photosynth = 0.5;
respir = (cfC*rR./(kRC + cfC)).*(cOx.*rR./(kROx + cOx));
N_fix = (fCfN)./(kfCfN + (10.*y(indexofvariable(mod(Vector,10)==6)))'.^6); 
     
    dydt(indexofvariable(mod(Vector,10)==1)) = fNsN;
    dydt(indexofvariable(mod(Vector,10)==2)) = fCsC;
    dydt(indexofvariable(mod(Vector,10)==3)) = 2*Veg.*dhR - HetR_out;
    dydt(indexofvariable(mod(Vector,10)==4)) = PatS_in + PatS_out + (y(indexofvariable(mod(Vector,10)==3))'.*PatSProd);
    dydt(indexofvariable(mod(Vector,10)==5)) = 40.*(HetN_in + HetN_out) + (1-Veg).*(HetNProd).*y(indexofvariable(mod(Vector,10)==3))'./(0.1 + y(indexofvariable(mod(Vector,10)==5))'); % The 5 represents how much faster hetN diffuses compared to patS. 
    dydt(indexofvariable(mod(Vector,10)==6)) = Veg.*(Ox_in + Ox_out + OxPH*photosynth - OxRE*respir) + (1-Veg).*(HetOxDiff*(Ox_in + Ox_out) - OxRE*respir*5);
    dydt(indexofvariable(mod(Vector,10)==7)) = fN_in + fN_out - n.*GR - fNsN + (1-Veg).*N_fix ;      
    dydt(indexofvariable(mod(Vector,10)==8)) = P_in + P_out - p.*GR;
    dydt(indexofvariable(mod(Vector,10)==9)) = fC_in + fC_out - c.*GR + Veg.*(CaPH.*photosynth - CaRE.*respir) + (1-Veg).*(-CaRE.*respir) - fCsC;
    dydt(indexofvariable(mod(Vector,10)==0)) = GR;                                                          
    dydt(iLux) = 0;
end



