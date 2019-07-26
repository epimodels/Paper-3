# -*- coding: utf-8 -*-
"""
Created on Fri Oct 12 13:51:19 2018

@author: cshort3
"""

import os
import stochpy
import random
import numpy as numpy
from scipy import stats
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--suffix", help="suffix for files")
args = parser.parse_args()
suffix = args.suffix

workingdir = os.getcwd()

# Simulation parameters
start_time = 0.0
end_time = 8760

# Run is a single run of the model that returns the number of incident cases
def Baserun(pdict):
    model = stochpy.SSA()
    ignored = pdict
    model.Model(model_file='protective_decolV04.psc', dir=workingdir)
    model.Endtime(end_time)
    model.DoStochSim()
    model.ShowSpecies()

Baserun(7)