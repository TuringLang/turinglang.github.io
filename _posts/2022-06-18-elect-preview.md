---
title: "Sneak Preview: The Republican Revolution"
author: Carlos Parada and the Turing Team 
date: 2022-06-18
---

The phrase “Realigning election” is thrown around quite often by electoral historians and pundits. But when it comes to the House of Representatives, there’s only been one realigning election in the past 80 years: the Republican Revolution of 1994.

![Reproduced from Wikipedia (Creative Commons license).](https://upload.wikimedia.org/wikipedia/commons/9/9c/United_States_House_of_Representatives_elections%2C_1994.png)

To understand how this revolution happened, we’ll need to take a short detour through American history. The Republican party was founded in the 1850s to oppose slavery. When Lincoln (a Republican) was elected President, 11 Southern states declared their independence in an attempt to preserve slavery, leading to the Civil War. While the Union emerged victorious and succeeded in ending slavery, the war was a long and brutal one, leaving southern whites deeply bitter towards the Republican party. From then on, a coordinated campaign to suppress the votes of African-Americans by white Southerners kept Democrats as the overwhelming favorites in the region, earning it the nickname of the “Solid South.”

Over time, the conversation moved from civil rights to other issues, as Republicans came to see civil rights as a lost cause. In the 1930s, the Democratic party under FDR won in a landslide, running on a progressive economic platform that he called the New Deal, which attracted support among industrial workers in the north. This New Deal coalition of northern progressives and southern conservatives dominated congressional elections for the next 60 years.

However, this also created a deep divide between the national Democratic party, which came to be dominated by northern liberals, and state Democratic parties in the south, which continued to support the moderate-to-conservative policies favored by their constituents. Democratic presidents began to push for civil rights legislation, which made them unpopular with southern whites, but most Democratic incumbents managed to remain popular by distancing themselves from the national Democratic party.
![Reproduced from *The Past, Present, and Future of Southern Politics* by Seth C. McKee (Creative Commons license).](https://github.com/TuringLang/turing.ml/blob/master/assets/figures/2022-06-15-turing-elect/solid_south.png)

This pattern continued until 1994. That year, Republicans, running on their Contract for America, put out a single platform for the national party. This was a dramatic break from previous congressional elections, which emphasized winning local races by focusing on local issues. Republicans emphasized their right-leaning views, and claimed the Democratic party had become far too left-wing for southerners. Bill Clinton, who had won election as a conservative southern Democrat, was portrayed as having betrayed his roots after a series of liberal policy proposals, including a failed push for a universal healthcare program and his support for allowing LGBTQ Americans to serve in the military.

Southern Democrats suddenly found themselves in a difficult position, unable to replicate their decades-long strategy of winning over conservative voters by claiming they were different from the national party. Democrats could no longer count on southern votes. As a result, 1994 marked a structural break in American politics–a shift in the rules that govern a statistical process. It was a game-changing election.

But how big was this change? And can we back up our analysis with hard numbers? Using a Bayesian change point model, we can estimate the effect of the 1994 elections on future vote shares. Our model identifies 1994 as the only major break in trend since the Second World War.

![](https://github.com/TuringLang/turing.ml/blob/master/assets/figures/2022-06-15-turing-elect/post_series_plot.svg)

We can pretty clearly see that in the post-Depression era, election results were heavily tilted towards Democrats. Republicans failed to win the House popular vote even a single time in the 46 years between 1948 and 1994. Since 1994, Democrats have found themselves almost exactly tied with Republicans in the House overall vote.

To estimate the electorate’s underlying partisanship, we simulated 2.1 million possible elections, each with slightly different fundamentals drawn from past election cycles. When we plot a smoothed histogram of these results, the difference between pre-1994 and post-1994 elections is dramatic.

![](https://github.com/TuringLang/turing.ml/blob/master/assets/figures/2022-06-15-turing-elect/post_predictive.svg)

Looking at both plots together makes it easy to see how much losing the Solid South has meant for Democrats’ chances of winning the House popular vote (which usually translates to winning control of the House itself). We can find this by adding up the histogram bins in the blue area. Before 1994, Democrats could count on winning the House popular vote about 90% of the time. However, both parties have averaged almost exactly 50% of the two-party vote since 1994, making your typical election a coin flip.


## Learn More

Interested in hearing more from our models? Learn more about partnering with us [here](https://turing.ml/partner), or see our information for users [here](https://turing.ml/dev/posts/2022-06-17-turing-elect).
