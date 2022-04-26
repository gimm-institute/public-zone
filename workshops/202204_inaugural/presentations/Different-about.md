# What's different about modeling finstab and macropru?

![GIMM-right|180](gimm-alt-white-bkg.png)

*Jaromir Benes* jaromir.benes@gimm.institute
*Tomas Motl* tomas.motl@gimm.institute

GIMM Inaugural Workshop
April 2022

---

### Modeling at policy making institutions

* Both monetary and macroprudential frameworks/processes used at policy making institutions benefit greatly from a central ("core") model

* A core model ties up a large number of disaggregative and partial inputs/results/assumptions/judgmental calls with some consistency

* This presentation is about differences in modeling philosophy at the level of such core models

---

### Financial cycles

> [!Macroprudential] Finstab & macropru
> * Longer periodicities
> * Often asymmetric (crash or soft landing)

> [!Monetary]
> * Shorter periodicities
> * Not so asymmetric


---

### Model output sought

> [!Macroprudential] Finstab & macropru
> * **Unlikely yet plausible** events
> * Entire financial cycles
> * Far away from "steady state"

> [!Monetary]
> * **Most likely** forecasts (baseline)
> * Specific alternative scenarios
> * Within a neighborhood of "steady state"

[Scenarios-forecasts|650](assets/forecasts.png)

---

### Economic relationships

> [!Macroprudential] Finstab & macropru
> * **Stock-flow** relationships
> * Gross positions, **risk**
> * Longer-term cumulation processes

> [!Monetary]
> * Mostly **flows**, prices, expectations
> * Stabilization business cycles
> * Long-term assumptions exogenous


---

### Nonlinearities

> [!Macroprudential] Finstab & macropru
> * Nonlinearities **essential**...
> * ...and the nonlinearities are global
> * Examples: binding financial constraints, marginal borrowers, etc.

> [!Monetary]
> * Although nonlinearities exist...
> * ...regular analysis is fine **linearized**
> * Examples: Endogenous credibility, asymmetric nominal rigidities, etc.

---

### Empirical validation and uncertainty

> [!Macroprudential] Finstab & macropru
>
> * Estimating models with nonlinearities and stock-flow relationships is drastically more complicated
>
> * We need much larger numbers of data points to make the estimates reliable, but have very limited amount of them available
> * **Gigantic uncertainty** in the "accuracy" of model mechanisms...
>
> * Recommendation: Do not bother pretending they are accurate
>

> [!Monetary]
>
> * Estimating linearized models (while still challenging) yields much **more trustable**  results
> * Monetary policy modeling can then have the flavor of forecasting
>


---

### Mode of operation


> [!Macroprudential] Finstab & macropru
>
> * **Scenario analysis** (what-if)
> * Model = framework to make assumptions explicit
> * Search for most critical parameters and inputs
>

> [!Monetary]
>
> * Closer to statistical **forecasting**
> * Model = "probabilistic" description of reality
> * Build parameters immune to policy actions
>


---

### Idiosyncracies

> [!Macroprudential] Finstab & macropru
> * Large amounts of accounting/reporting/regulatory **specifics**
> * Need to be incorporated within the models to correctly intepret data
	
> [!Monetary]
> * Macro concepts more **universal** across countries and time


---

### How to formally describe the policy problem

> [!Macroprudential] Finstab & macropru
>
> * Macropru is to prevent (or at least alleviate) major catastrophes by making the system more robust to tail-risk events
>
> * This is a **robust control** problem: Minimize the cost of the worst events
>
> * Macropru is not to (and must not be) thought as fine-tuning business or financial cycles
>
> * Regulators do not impose buffers to reduce bank business but to create buffers for bad times


> [!Monetary]
>
> * Monetary (and fiscal) policies are often described as an **optimal control** problem
>
> * Set up a reaction function to optimize some sort of objective function in the neighborhood of steady state
>

---

### Policy reaction function

> [!Macroprudential] Finstab & macropru
>
> * **Impossible** to create a simply/stylized reaction function that would work across a variety of scenarios
>
> * Build-release based policies
> 

> [!Monetary]
>
> * The essence of monetary policy can be translated to a **simple reaction function**
>


