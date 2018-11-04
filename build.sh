#!/bin/bash
ghc -Wall -I. --make -o euler _Main.hs 
rm *.hi
rm *.o
