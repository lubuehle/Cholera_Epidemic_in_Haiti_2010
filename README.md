# MATLAB FS12 – Research Plan

> * Group Name: El Tor
> * Group participants names: Borer Benedict, Bühler Lukas, Plüss Benjamin, Stocker Nicolas
> * Project Title: Modeling the Cholera Epidemic in Haiti 2010-2011 

## General Introduction

After the devastating earthquake in Haiti in 2010 which destroyed some of Haiti’s infrastructure leading to a decrease of the sanitary situation the country was vulnerable to the spread of waterborne diseases. In late October 2010 Cholera broke out in the Artibonite department situated about 100 km north of Port-au-Prince. There is evidence that the disease was brought to Haiti by UN-soldiers stationed in Artibonite department after the earthquake. This hypothesis suggests that waste from the outhouses of their base contaminated the Artibonite River which other people drank from [1]. 
Modeling and consequently being able to predict the course of an infectious disease is an important tool to provide information on how to take measures against the disease. Resources are always limited, especially in poor countries with low-level infrastructure which are particularly vulnerable for the outbreak of such a disease. It is therefore necessary to decide how to use this limited amount of resources (like vaccines, clean water, antibiotics, etc.) to fight the disease in an efficient way. Models can provide such insight by simulating different spatial and temporal distributions of resources giving the government an additional tool to reach a decision.
For our specific case in Haiti there is already a proposed solution [2] which we are going to use for the base of the models, to get some values of parameters and also to compare our solution to. Our aim is to extend this model in order to take into account country specifics instead of just using best-fit values.

## The Model

“We built a “susceptible–infectious–recovered” compartmental transmission model that characterized the population as susceptible to infection, infected and infectious to others, or recovered or otherwise “removed” from risk for further infection. We also added a water compartment to the model. The water compartment could be contaminated by infected and infectious persons and could in turn infect susceptible persons. This modeling approach was described by Tien and Earn for the simulation of diseases that can be transmitted through both person-to-person contact and contaminated water, such as cholera. We constructed the models for the population of each of Haiti’s 10 administrative departments. These populations were combined to form a meta-population model, in which disease could spread both within a given department (or “patch”) or between patches (implicitly reflecting the movement of people from one region to another).”[2]
The classic susceptible, infectious, recovered (SIR) model with the additional variable for the concentration of cholera in the water compartment is modified by our group by analyzing the main waterways and public transportation routes. 
Furthermore there are some literature derived parameter values. One of those values is the parameter that is used as a power to the distance in the “gravity” part of the model.

## Fundamental Questions

Are we able to reproduce the results from the paper by Tuite et al. (2011)?
Is this model able to simulate the real course of the epidemic (which is close to the results from the paper by Tuite et al. (2011))?
Are the results also reasonable (or even closer to reality than before) if we make some changes to the model (like taking into account natural boundaries, waterways and transportation networks instead of just using a “gravity” model)?
Do we get reasonable results if we use reports from newspapers claiming that the initial cholera bacteria were brought to Haiti by UN-soldiers and spread from the river Artibonite that was contaminated by their feces as sources for starting values? The underlying reason of this is to strengthen or to discount such reports claiming that the cholera outbreak originated from the region around the Artibonite River and started in October 2010. [3], [4] 


## Expected Results

We expect to manage to come close to the results obtained by Tuite et al. (2011) in a first step. After introducing our own parameters for the specific case in Haiti we do not expect to come up with better results than in the original paper by Tuite et al. (2010) [1], because they used best-fit values for two parameters, while we are only going to use one best-fit parameter. In order to make it possible to use this model for predictions about upcoming outbreaks of cholera or other diseases that can be transmitted by water it is important to use parameter values that base on decision instead of best-fit values.
We expect to produce the best result when using the newspaper reports [3] as starting value for the model.


## References 

1. Wikipedia. 2010–2011 Haiti cholera outbreak.   http://en.wikipedia.org/wiki/2010%E2%80%932011_Haiti_cholera_outbreak. 15.03.2012.
2. Tuite AR, Tien J, Eisenberg M, Earn DJD, Ma J, Fisman DN. 2011. Cholera Epidemic in Haiti, 2010: Using a Transmission Model to Explain Spatial Spread of Disease and Identify Optimal Control Interventions. Annals of Internal Medicine 154:593-601.
3. Bigg M. U.N. peacekeepers likely caused Haiti cholera. http://www.reuters.com/article/2011/06/30/us-haiti-cholera-idUSTRE75T4O220110630. 18.03.2012.
4. Hendriksen RS, Price LB, Schupp JM, Gillece JD, Kaas RS, Engelthaler DM, Bortolaia V, Pearson T, Waters AE, Upadhyay BP, Shrestha SD, Adhikari S, Shakya G, Keim PS, Aarestrup FM. 2011. Population Genetics of Vibrio cholera from Nepal in 2010: Evidence on the Origin of the Haitian Outbreak. mBio 2(4):e00157-11.
5. Tien JH, Earn DJD. 2010. Multiple Transmission Pathways and Disease Dynamics in a Waterborne Pathogen Model. Bulletin of Mathematical Biology 72: 1506-1533.

Possible extensions to the model from Tuite et al. (2011) are the introduction of specific parameters for infections from compartment to compartment taking into account main public transportation routes and waterways. Tuite et al. (2011) used best-fit values for this parameter which should lead to better results but it makes it more difficult to predict the course of another disease with the same model.

## Research Methods

SIR model: “susceptible-infectious-recovered” with the extension for diseases that can be spread through water bodies by Tien and Earn [5].

## Other

We are mainly going to use the same data sources like Tuite et al. (2011) used for their paper. These are the following:
- HealthMap system (http://healthmap.org/en/) 
- Ministère de la Santé Publique et de la Population (MSPP) of the Republic of Haiti
- Summary report by the U.S. Centers for Disease Control and Prevention

