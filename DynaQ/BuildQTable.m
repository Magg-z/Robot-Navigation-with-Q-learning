function [ Q ] = BuildQTable( nstates,nactions )
%Q: the returned initialized QTable

Q = zeros(nstates,nactions);