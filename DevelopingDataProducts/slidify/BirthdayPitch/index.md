---
title       : The Birthday Paradox
subtitle    : Playing with Probability
author      : 
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---
<style>
em {
  font-style: italic
}
strong {
  font-weight: bold
}
</style>

## Introduction
<br>

If 50 people are in a room, what's the probability that 2 of them
share a birthday?
<br>
<br>

Would you believe that it's **97%**?
<br>
<br>

The app at https://data-nerd.shinyapps.io/birthday/ will let you play with that
probability by adjusting the number of birthdays (buckets) and people (objects)
to find your own interesting results.
<br>
<br>

This is sometimes called the **Birthday Paradox** or **Birthday Problem**.

---
<style>
em {
  font-style: italic
}
</style>

## Background
<br>

The math behind the probability calculation can be found on [Wikipedia](http://en.wikipedia.org/wiki/Birthday_problem)

Probability that 2 people out of _n_ _do not_ share a birthday:


$$\Large \bar{p}({n}) = 1 \times \left( 1 - { 1 \over 365} \right) 
                          \times \left( 1 - { 2 \over 365} \right)
                          \times ...
                          \times \left( 1 - { n \over 365} \right) 
$$

To get the probability that 2 people _do_ share the same birthday we take the
compliment of \( \bar{p}({n}) \):

$$\Large {p}({n}) = 1 - \bar{p}({n}) $$

To generalize this formula so that we're not just talking about people sharing
birthdays, but any 2 objects occupying the same bucket, we just replace 365
with _b_, the number of buckets:

$$\Large \bar{p}({n}) = 1 \times \left( 1 - { 1 \over b } \right) 
                          \times \left( 1 - { 2 \over b } \right)
                          \times ...
                          \times \left( 1 - { n \over b } \right) 
$$

---

## Challenges

Building this app in R was not without its challenges.

The biggest issue was that the general formula for the probability uses
365! (facorial), which R does not like.


```r
factorial(365)
```

```
## Warning: value out of range in 'gammafn'
```

```
## [1] Inf
```

For that reason, the app uses an iterative calculation (a loop) to calculate
the probability. It's not R-y, but it's easy to read and write and it works!

---

## Try it yourself

How many people would you have to have to have a greater than
50% chance of finding a shared birthday?
<br>
<br>

https://data-nerd.shinyapps.io/birthday/ can tell you.
<br>
<br>

Enjoy!
