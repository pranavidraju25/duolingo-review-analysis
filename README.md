# Duolingo Review Analysis

I used AI to sort and analyze about 2000 Duolingo's reviews into themes, then checked its accuracy by hand and used SQL to find what users complain about the most and turning them into recommendations.

## What I did
- Collected about 3 weeks of Google Play reviews (US, English, 22 Sep to 14 Oct 2026), then sampled 600 negative, 300 neutral and 1,100 positive reviews.
- I collected the reviews with a scraping library. Gemini was given a reference for tagging. 1,979 reviews were tagged by theme and sentiment. 21 could not be tagged and were left out.
- I checked the AI's tags by hand and analyzed the results in SQL.
- Dashboard was built on Tableau and highlighted the negative reviews and was clearly shows complaints by theme, average rating, and weekly shares.

## Main finding
Bugs and Technical issues has the highest negative rate: 64% of its reviews are 1 or 2 stars. It has the lowest average rating at 2.08. About 1 in 5 negative bug reviews mention an app update. The theme with highest negative reviews is Pricing and Billing, but has a lower negative rate (60%).

## Links
- Dashboard: [Duolingo review analysis on Tableau Public](https://public.tableau.com/app/profile/pranavi.dommaraju/viz/Duolingoreviewanalysis/Duolingoreviewanalysis)
- Product brief: [duolingo_product_brief.pdf](duolingo_product_brief.pdf)

## How accurate is the AI tagging?
- Sentiment: about 90% agreement with my labels (30 fresh reviews).
- Theme: about 62% agreement (78 reviews). Most misses were reviews that fit two themes.
- Used google sheets to translate reviews in various languages, followed instructions on how to label reviews as many had multiple themes present in them which was followed by AI as well.

## Limits
- One app, 3 weeks of reviews, and a sample weighted toward negative reviews, so percentages compare themes with each other and are not real totals.
- Pricing and billing were merged because billing had only about 28 reviews.
- Keyword counts in the brief are rough.
- Weekly trend has about 4 points, so I make no trend claims.

## Next step
To enhance these findings, should analyse 3 months of reviews to get a stable and reliable insights. It will sampled evenly by week and it may be clear to identify trends in data. It will be helpful to test whether any theme is rising or falling. 


## Built with AI assistance
Gemini was used to scrape and tag reviews after I gave it a reference by tagging a few reviews. Claude mostly helped with code and to tighten conditions to check ouptuts.
I checked the tags by hand, did the analysis and made recommendations. 

## Folders
- data: sample, tagged reviews, and my hand check labels
- sql: queries
- notebooks: the Colab notebook (collect, tag, validate)
- outputs: CSVs used in the dashboard
