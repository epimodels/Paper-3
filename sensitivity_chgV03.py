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
n_samples=end_time*60
nruns=1000
cases = numpy.zeros([nruns, 5])

#con_traj=numpy.empty([end_time,nruns])
acq_traj=numpy.empty([n_samples,nruns])
# Run is a single run of the model that returns the number of incident cases
def Baserun(iterations):
    for k in range(0, iterations):
        #pdict = {'epsilon1':random.uniform(0.01,0.39),
             #'epsilon2':random.uniform(0.1,48)
            #} 
        model = stochpy.SSA()
        model.Model(model_file='protective_decolV04.psc', dir=workingdir)
        model.Endtime(end_time)
        #model.ChangeParameter('epsilon1',pdict['epsilon1'])
        #model.ChangeParameter('epsilon2',1/pdict['epsilon2'])
        model.DoStochSim()
        model.GetRegularGrid(n_samples)
        outcomes = model.data_stochsim_grid.species
        cases[k,0] = outcomes[16][0][-1]
        cases[k,1] = outcomes[17][0][-1]
        cases[k,2] = outcomes[28][0][-1]
        cases[k,3] = outcomes[36][0][-1]
        cases[k,4] = outcomes[42][0][-1]
        for t in range(0,n_samples):
            acq_traj[t,k]=outcomes[16][0][t]
           #con_traj[t,k]=outcomes[16][0][t]+outcomes[19][0][t]+outcomes[21][0][t]+outcomes[23][0][t]+outcomes[25][0][t]+outcomes[27][0][t]+outcomes[35][0][t]+outcomes[37][0][t]+outcomes[38][0][t]+outcomes[39][0][t]+outcomes[40][0][t]+outcomes[41][0][t]
    return cases
  
#def Basesens(iterations):
 #   parameters = numpy.zeros([iterations,6])
  # for k in range(0,iterations):
   #     pdict = {'epsilon1':random.uniform(0.00032,0.0352),
    #         'epsilon2':random.uniform(0,50)
    #        } 
     #   baseline = Baserun(iterations, pdict=pdict)
      #  parameters[k,0] = baseline
       # parameters[k,1] = pdict['epsilon1']
        #parameters[k,2] = pdict['epsilon2']

#    return parameters
# Run is a single run of the model that returns the number of incident acquisitions
def Run(filename,k):
    model = stochpy.SSA()
    model.Model(model_file=filename, dir=workingdir)
    model.Endtime(end_time)    
    model.ChangeParameter('psi',k)
    model.DoStochSim(method="NRM")
    model.GetRegularGrid(n_samples=end_time)
    outcomes = model.data_stochsim_grid.species
    acquisitions = outcomes[16][0][-1]
    return acquisitions

def Batch(filename,k):
    batch_cases = numpy.empty([nruns,1])
    for i in range(0,nruns):
        batch_cases[i,0] = Run(filename,k)
        batch_avg = numpy.mean(batch_cases)
    return batch_avg

# Basic accept-reject algorithm, converts model outcomes to incidence rate
def AcceptReject(objective,result,tolerance):
    rate = result/(365*18)
    lnrate = numpy.log(rate)
    lnobjective = numpy.log(objective/(365*18))
    distance = abs(lnobjective - lnrate)
    if distance <= tolerance:
        accept = 1
    else:
        accept = 0
    return accept

# Main fitting function
def ABCFit(config,objective,tol,iterations,priorhi,priorlow):
    results = numpy.zeros([iterations,3])
    for i in range(0,iterations):
        draw = random.uniform(priorhi,priorlow)
        results[i,0] = draw
        sim_avg = Batch(config,draw)
        results[i,1] = sim_avg
        decision = AcceptReject(objective=objective,result=sim_avg,tolerance=tol)
        results[i,2] = decision
        print("*** Iteration %i of %i ***" % (i+1,iterations))
    return results

# Fitting Function - Tweak prior to improve acceptance rate    
MRSA_fit = ABCFit(config='protective_decolV04.psc',objective=39.03,tol=0.15,iterations=0,priorhi=1.0,priorlow=0)

MRSA_estimate = MRSA_fit[:,0][MRSA_fit[:,2]==1]

numpy.savetxt('basefit.csv',MRSA_estimate,delimiter=',',comments=',')

#Fit delta
base_sweep = Baserun(nruns)
print("Complete")

print("Saving Files")
numpy.savetxt('basesweep4.csv',base_sweep,delimiter=',',comments=',')
numpy.savetxt('acq_trajFullSystemNoInitial.csv',acq_traj,delimiter=',')