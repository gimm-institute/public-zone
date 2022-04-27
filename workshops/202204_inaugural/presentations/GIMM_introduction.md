
# Introducing MESSr:  GIMM Macroprudential Modeling Framework

$$
\newcommand{\xona}[1][t]{{ona}_{#1}}
\newcommand{\xrona}[1][t]{rona_{#1}}
\newcommand{\xy}{\mathit{y}}
\newcommand{\xyfwl}{\mathit{y}^\mathrm{fws}}
\newcommand{\xpy}{\mathit{py}}
\newcommand{\xny}{\mathit{ny}}
\newcommand{\xlcy}{\mathrm{lcy}}
\newcommand{\xhcy}{\mathrm{hcy}}
\newcommand{\xfcy}{\mathrm{fcy}}
\newcommand{\xxpvc}[1]{{\mathit{pvc}^0_{#1}}}
\newcommand{\xrepay}[1][t]{\theta_{lp}}
\newcommand{\xrepayk}[1]{\theta_{lp}^{#1}}
\newcommand{\xrecover}[1][t]{\theta_{lnc}}
\newcommand{\xrecover}[1][t]{\theta_{lnc}}
\newcommand{\xwoffdown}[1][t]{\theta_{lnw}}
\newcommand{\xrd}[1][t]{\mathit{rd}_{#1}}
\newcommand{\xrl}[1][t]{\mathit{rl}_{#1}}
\newcommand{\xrnewl}[1]{\mathit{rl}^{\Delta}_{#1}}
\newcommand{\xrlss}{\mathit{rl}}
\newcommand{\xl}[1][t]{\mathit{l}_{#1}}
\newcommand{\xlk}[2]{\mathit{l}_{#1}^{#2}}
\newcommand{\xd}[1][t]{\mathit{d}_{#1}}
\newcommand{\xdo}[2]{\mathit{d}^{0 #2}_{#1}}
\newcommand{\xnewl}[2]{\mathit{l}^{\Delta #2}_{#1}}
\newcommand{\xlp}[1][t]{\mathit{lp}_{#1}}
\newcommand{\xlpk}[2]{\mathit{lp}^{#2}_{#1}}
\newcommand{\xlpo}[2]{\mathit{lp}^{0 #2}_{#1}}
\newcommand{\xlc}[1][t]{\mathit{lc}_{#1}}
\newcommand{\xlco}[2]{\mathit{lc}^{0 #2}_{#1}}
\newcommand{\xle}[1][t]{\mathit{le}_{#1}}
\newcommand{\xln}[1][t]{\mathit{ln}_{#1}}
\newcommand{\xlno}[1][t]{\mathit{ln}^0_{#1}}
\newcommand{\xlo}[1][t]{\mathit{l}^{\,0}_{#1}}
\newcommand{\xlnc}[1][t]{\mathit{lnc}_{#1}}
\newcommand{\xlnco}[1][t]{\mathit{lnc}^0_{#1}}
\newcommand{\xlnw}[1][t]{\mathit{lnw}_{#1}}
\newcommand{\xlnwo}[1][t]{\mathit{lnw}^0_{#1}}
\newcommand{\xlgd}{\lambda}
\newcommand{\xclr}[1][t]{q_{#1}}
\newcommand{\xall}[1][t]{\mathit{a}_{#1}}
\newcommand{\xaf}[1][t]{\mathit{af}_{#1}}
\newcommand{\xab}[1][t]{\mathit{ab}_{#1}}
\newcommand{\xpvc}[1][t]{\mathit{pvc}_{#1}}
\newcommand{\xpvx}[1][t]{\mathit{pvx}_{#1}}
\newcommand{\xwoff}[1][t]{\mathit{w}_{#1}}
\newcommand{\xnewall}[2]{\mathit{a}_{#1}^{\Delta #2}}
\newcommand{\xdisc}[2]{\mathit{\delta}_{#1,#2}}
\newcommand{\xdiscxx}[2]{\mathit{\delta}_{#1,#2}^{**}}
\newcommand{\xbk}[1][t]{\mathit{bk}_{#1}}
\newcommand{\xnewbk}[1][t]{\mathit{bk}_{#1}^\Delta}
\newcommand{\xpie}[1][t]{\Pi_{#1}}
\newcommand{\xj}[1][t]{j_{#1}}
\newcommand{\xjl}[1][t]{jl_{#1}}
\newcommand{\xjd}[1][t]{jd_{#1}}
\newcommand{\xsigma}[1]{\sigma_{#1}}
\newcommand{\xe}[1][t]{e_{#1}}
\newcommand{\xemphk}{\color{red}{k}}
\newcommand{\xrbk}[1][t]{\mathit{rbk_{#1}}}
\newcommand{\xss}{\mathit{ss}}
\newcommand{\xrec}[1][t]{\mathit{rec}_{#1}}
\newcommand{\xcar}[1][t]{{car}_{#1}}
\newcommand{\xcartar}[1][t]{{car}_{#1}^{\mathrm{tar}}}
\newcommand{\xcarmin}[1][t]{{car}_{#1}^{\mathrm{min}}}
\newcommand{\xcarbfr}[1][t]{{car}_{#1}^{\mathrm{bfr}}}
\newcommand{\xrw}[1][t]{\mathit{rw}_{#1}}
\newcommand{\xtrn}[2]{\mathit{trn}^{\,#2}_{\,#1}}
\newcommand{\xvel}[2]{\mathit{vel}^{\,#2}_{\,#1}}
\newcommand{\xshock}[2]{\varepsilon_{#2,\, #1}}
\newcommand{\xk}{{\color{Apricot}{k}}}
\newcommand{\xrx}[1][t]{{rx}_{#1}}
\newcommand{\xnewln}[1][t]{ln^\Delta_{#1}}
\newcommand{\xnewlnk}[2]{ln^{\Delta #2}_{#1}}
\newcommand{\xlprec}[1][t]{lp^\mathrm{rec}_{#1}}
\newcommand{\xlpreco}[1][t]{lp^{0\, \mathrm{rec}}_{#1}}
\newcommand{\xlnrec}[1][t]{ln^\mathrm{rec}_{#1}}
\newcommand{\xlnreco}[1][t]{ln^{0\, \mathrm{rec}}_{#1}}
\newcommand{\xonfx}[1][t]{\mathit{onfx}_{#1}}
\newcommand{\rec}{\mathrm{rec}}
\notag
$$

![GIMM-right|180](gimm-alt-white-bkg.png)

*Jaromir Benes* jaromir.benes@gimm.institute
*Tomas Motl* tomas.motl@gimm.institute

GIMM Inaugural Workshop
April 2022

---

### Overview


* Speaker presentations followed by model-based simulations and demonstrations

* This presentation introduces MESSr, the GIMM modeling framework 

* Non-technical exposition explaining general modeling principles


---

### About the framework

* The outcome of several __applied projects__ in macroprudential modeling
	* A large numer of extensions emerged motivated by diverse economies and financial systems 

* __Practical scenario production and policy advice__ framework, not just a theoretical model
    * Flexible semi-structural approach combining theory insights and empirical relevance
    * Incorporates insights from more structural models, including DSGEs

* __Continuous development__ responding to our technical cooperation projects

---

### Not just a model

* A model alone, while a critical element, is not enough

* Needs __operating infrastructure__ for regular use and streamlined production of outputs
    * Collecting and feeding data to the model
    * Streamlining the processing of inputs and outputs
    * Reporting, internal and external communication of results

* Motivated by first-hand experience from our practical applications


---

### Key modeling principles

* __Top-down__ modeling strategy
    * Complement existing financial stability models/tools
    * Provide a platform for consistently combining a range of inputs and pieces of analysis, including macro
    * Aggregative view, not addressing individual financial institutions
  
* __Medium-term__ frequency of economic relationships
    * Time for macro-financial interactions to kick in
    * Policy trade-offs of small costs now vs large potential gains in the future

* Endogenous __feedback__: macroeconomy $\Longleftrightarrow$ financial sector
    * ...versus the more common one-way logic: macro $\Longrightarrow$ financial sector
---

### Key modeling principles, cont.

* __Explicit__ modeling of balance sheets
    * Financial cycles associated with expansions and contractions of gross positions on balance sheets (banks, BOP, etc.)
	* Correct understanding of how balance sheets work
  
* __Stock-flow consistency__
    * Stocks (wealth, credit stock, assets, liabilities) cumulates from flows (GDP, new credit creation, defaults, repayments)

* Presence of key __non-linearities__
    * Nonlinearities are the essence of fin stab and macropru analysis
    * Indispensable in describing real-world events
    * Critical for macropru policy trade-offs

---

### Designed for practical policy use cases

* __Semi-structural__ framework: Equations not derived from underlying "microfoundations", but still...
  * Explicit concepts of demand and supply (e.g. for credit)
  * Unobserved sustainability trends (e.g. credit to GDP as in BIS analysis)	
  * Endogenous expectations (e.g. makes easy to introduce IFRS9 forward-looking allowances)

* __Empirical relevance__, capable of producing data-consistent scenarios (as opposed to only purely theoretical simulations)


---

### Examples of practical use cases

* Build __scenarios__ on top of (externally provided) baselines (so-called Delta technique) 

* Simulate the entire __macrofinancial cycles__ , e.g.
    * Boom and bust in asset prices and credit growth
    * Capital inflows and reversals

* Conceptualize the __costs and benefits__ of macropru policies

* Endogenously __integrate and aggregate__ main financial risks, e.g.
    * Integrate credit, forex, market risk based on structural macro drivers
    * Aggregate credit risk across economic sectors


---

### Main model blocks

![model-structure](model-structure.png)

---

### Simplified aggregate bank balance sheets

|                   | Assets                         |            Liabilities |                   |
| :---------------- | :----------------------------- | ---------------------: | ----------------: |
| $\xle$              | Net loans                      | Non-equity liabilities |               $\xd$ |
| $+\ \sum \xl^{\,k}$ | *Gross loans*                  |       *Local currency* |  $+\ d_t^{\,\xlcy}$ |
| $-\ \sum \xall^k$  | *Allowances for credit losses* |     *Foreign currency* | $+\ d_t^{\,\xfcy}$ |
| $\xona$             | Other net assets               |           Bank capital |                $bk$ |

<br/>

Accommodates
* Loan portfolio segmentation (mortgages, consumer credit, ...)
* Currency segmentation (local vs foreign currency assets and liabilities)


---

### Proper balance sheet accounting

For each loan (asset) segment, keep track of loan (asset) performance:

* Performing exposures
* Nonperforming exposures
* Defaults
* Allowances (provisions) 
* Writeoffs
* Interest income, interest expense

---

### Simplified life cycle of a representative loan portfolio

![credit-risk-loan-performance](credit-risk-loan-performance.png)

---

### Bank profits and bank capital

![bank-capital|750](bank-capital.png)

---

### Allowances for credit losses (provisions)

* Credit risk is the key element of financial risks on bank balance sheets

* Allowances (provisions) for credit risk now based on one of two concepts

	* Incurred loss based (backward looking)
	* Expected loss based (forward looking, IFRS9)

* Mixed use in financial reporting and regulatory standards

* MESSr easily accommodates either or both

---

### Dynamics of forward-looking (IRS9) allowances

![allowances-stock-flow](allowances-stock-flow.png)

---

### Credit creation

__Reduced-form approach__: Provides little insight into demand and supply

![Reduced form credit creation|600](reduced-form-credit-creation.png)

__Semi-structural approach__: Motivated by insights from DSGE models.


![Semistructural credit creation|750](structural-credit-creation.png)



---

### Credit supply and demand

![credit-creation](credit-creation.png)

---

### Credit supply - lending conditions

![new-lending-conditions|750](new-lending-conditions.png)

---

### Stock lending rate vs new lending rate

![lending-rates-stock-flow|750](lending-rates-stock-flow.png)

---

### Key nonlinearity 1: Credit risk function

Conceptually consistent with Basel II/III asymptotic single-factor risk model

![image-20220423233150331](image-20220423233150331.png)

---

### Key nonlinearity 2: Capital adequacy risk surcharge

![image-20220423234123581](image-20220423234123581.png)
