% Outputting

% This outputs details of levels of each variable at the chain length
% specified at v(2).
FixedNitrogenOut = [];
FixedCarbonOut = [];
OxygenOut = [];
HeterocystsOut=[];
PatSOut = [];
HetROut = [];
HetNOut = [];
StoredNitrogenOut = [];
LengthOut = [];

for i = 1:60
    K = N{i};
    for n = 1:30
        v = size(K{n});
        if v(2) == 22
            vect = n;
        else
        end
    end
    L = K{vect};
    FixedNitrogenOut(:,i) = [L.FixedNitrogen]';
    FixedCarbonOut(:,i) = [L.FixedCarbon]';
    OxygenOut(:,i) = [L.Oxygen]';
    LengthOut(:,i) = [L.Length]';
    PatSOut(:,i) = [L.PatS]';
    HetROut(:,i) = [L.HetR]';
    HetNOut(:,i) = [L.HetN]';
    StoredNitrogenOut(:,i) = [L.StoredNitrogen]';
    HeterocystsOut(:,i) = [L.DifferentiationFinished];
end

FixedCarbonOut = FixedCarbonOut./10;

csvwrite('NFixedNitrogen60.csv', FixedNitrogenOut)
csvwrite('NStoredNitrogen60.csv', StoredNitrogenOut)
csvwrite('NHetR60.csv', HetROut)
csvwrite('NHetN60.csv', HetNOut)
csvwrite('NPatS60.csv', PatSOut)
csvwrite('NLength60.csv', LengthOut)
csvwrite('NOxygen60.csv', OxygenOut)
csvwrite('NFixedCarbon60.csv', FixedCarbonOut)
csvwrite('NHeterocysts60.csv', HeterocystsOut)