#!/bin/bash
ghc -I. --make -o euler _Main.hs 
rm *.hi
rm *.o
