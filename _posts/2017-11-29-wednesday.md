---
layout: post
title:  "Wednesday"
date:   2017-11-29
categories: daily
---

### VASIMR - Plasma rocket drive

[Wiki](https://en.wikipedia.org/wiki/Variable_Specific_Impulse_Magnetoplasma_Rocket)

Gas pressure and nozzle velocity depends on mass of the molecule and temperature at nozzle. Combustion raises temp. but $H_2O$ molecules are quite heavy.

Theoretical max specific impulse of hydrogen-oxygen engine is 500 sec. Space shuttle engine had impulse moment of 450 sec for combustion at $3600^oC$.

Specific impulse of hydrogen plasma engine can reach 1000 sec at \$$1800^oC$$. Hydrogen can be heated with microwaves.

### Specific impulse
[Wiki](https://en.wikipedia.org/wiki/Specific_impulse)

Total impulse, or change in momentum per unit of propellent used.

Total impulse - integral of force over time interval for which it acts.

$$
J=\int F\, {d} t
$$

Why is a propellent mass in newton?

### Python for Geo

[python course](https://automating-gis-processes.github.io/2016/course-info.html)


### Formatting plots in matplotlib

Use white style

    plt.style.use('seaborn-white')
    sns.set(font='DejaVu Sans')

Plot dimensions

    pylab.rcParams['figure.figsize'] = (16, 6)
    pylab.rcParams['figure.dpi'] = 120

Horizontal ticks

    plt.xticks(rotation='horizontal')


Formatting ticks on pandas plot is broken - pandas doesn't work well with that. Format index ahead, or plot with matplotlib directly.
