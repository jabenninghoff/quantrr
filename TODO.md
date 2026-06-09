# TODO

- [x] Implement risk analysis report as an R Markdown template
- [x] Add standalone quarto site that supports multiple analyses and only requires R and Quarto (not RStudio)
- [x] Add example based on [Risk Quantification Demo](https://jabenninghoff.github.io/security/analysis/rq-demo.html) using standalone site rendered in `pkgdown/assets/example`
- [x] Add detailed instructions for installation and use (standalone, RStudio)
- [x] Add Quick Start Guide to README (standalone)
- [x] Create logo using [stickers](https://github.com/jabenninghoff/stickers)
- [x] Add plots for risk treatments to allow estimation of return on investment (ROI)
- [x] Add elicitation of only p50 and p95 for loss magnitude as the new default, continue to support p5, p50, p95 estimates
- [x] ~~Add plot showing percentage of occurrences that result in no losses~~
- [x] Update package [accessibility](https://pkgdown.r-lib.org/articles/accessibility.html)
- [ ] Add loss tables from [IRIS 2025](https://www.cyentia.com/publication/iris2025/) report (page 16,35)
- [ ] Add frequency tables based on [Cyentia member analysis](https://www.cyentia.com/multi-incident-probabilities/)
- [ ] Add loss tables by pattern from [Cyentia member analysis](https://www.cyentia.com/frequency-and-impact-stats-for-incident-patterns/)
- [ ] Experiment: add alternate forecasts for loss exceedance curves, inspired by [Acme Weather](https://acmeweather.com/blog/introducing-acme-weather) - either one forecast line per estimate or highest and lowest risk estimates
- [ ] Add "Risk Modeling with quantrr" vignette that shows function code, explains report, possibly a "How To" article like [this substack post](https://diffuser.substack.com/p/how-to-build-a-loss-exceedance-curve)
