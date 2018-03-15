N{1,60} = [];
for i = 1:60
    i
    B = cyanobacterium.construct(0, 1, 0, 1, 1, 1, 0, 0, 0, 0.2, 1, 1, 1, 2.5);
    [B, rec, Lux, ts, dvc, t, hcy, prhcy, fNlev, fClev, spltc, lngtt, M, P] = rgf(B,30, 0, 0);
    N{i} = P;
end