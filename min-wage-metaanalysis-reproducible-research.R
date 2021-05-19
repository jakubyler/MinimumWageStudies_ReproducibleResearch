library(tidyverse)

lp = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)
date = c(1970,1976,1976,1976,1977,1979,1980,1981,1981,1981,1983,1981,1985,1991,1992)
author = c('Kaitz','Mincer','Gramlich','Welch','Ragan','Wachter&Kim','Iden','Ragan','Abowd&Killingsworth','Betsey&Dunson','Brown','Hammermesh','Solon','Wellington','Klerman')

t = c(2.3,2.41, 1.41, 2.22, 1.52, 2.17, 4.43, 1.70, 1.04, 2.12, 1.92, 1.63, 2.78, 1.41, 0.45)
deg_of_freedom = c(49,58,106, 53,31,56,93,54,95,93,92,94,86,114,123)

coefs = c(0.098,0.231,0.094,0.178,0.065 ,0.2519,0.226,0.052,0.213, 0.139,0.096,0.121,0.098,0.066,0.052)

teen_subsample = c(NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA) # 4

log_spec = c(0,0,1,1,1,1,0,1,1,0,1,1,1,1,1) # 11

no_exp_var = c(10,5,17,6,8,11,10,9,8,10,11,5,17,17,NA) #

autoreg_correction = c(0,1,1,0,1,0,1,1,0,1,0,0,1,1,NA) # 10

df = data.frame(lp,author,date, t, deg_of_freedom, coefs, teen_subsample, log_spec, no_exp_var, autoreg_correction)
df$error = df$coefs/df$t
df$sqrt_df = df$deg_of_freedom**0.5
df$l_sqrt_df = log(df$sqrt_df)

mean(df$l_sqrt_df)
mean(df$no_exp_var)


# https://davidcard.berkeley.edu/papers/ts-min-wage.pdf

# The t-ratio is the estimate divided by the standard error. With a large enough sample, t-ratios greater than 1.96 (in absolute value) suggest 
# that your coefficient is statistically significantly different from 0 at the 95% confidence level. A threshold of 1.645 is used for 90% confidence.

# https://davidcard.berkeley.edu/papers/ts-min-wage.pdf
# https://www.nber.org/system/files/working_papers/w12663/w12663.pdf
# http://jhr.uwpress.org/content/51/2/500.abstract
# https://journals.sagepub.com/doi/pdf/10.1177/00197939140670S307
# https://journals.sagepub.com/doi/pdf/10.1177/0022185608090003
# https://academic.oup.com/jeea/article-abstract/2/1/67/2280830


# 1. Kaitz https://fraser.stlouisfed.org/files/docs/publications/bls/bls_1657_1970.pdf
# 2. Mincer https://www.nber.org/system/files/working_papers/w0039/w0039.pdf
# 3. Gramlich https://www.brookings.edu/wp-content/uploads/1976/06/1976b_bpea_gramlich_flanagan_wachter.pdf
# 4. Welch https://www.rand.org/pubs/papers/P5145.html
# 5. Ragan 1977 https://www-1jstor-1org-1000094gq0c32.han.buw.uw.edu.pl/stable/pdf/1928808.pdf?ab_segments=0%2FSYC-5878%2Fcontrol&refreqid=fastly-default%3A60db1cbe71812ef62043c2e97a1b7e44
# 6. Wachter&Kim https://papers.ssrn.com/sol3/papers.cfm?abstract_id=261237
# 7. Iden NONE
# 8. Ragan 
# 9. Abowd&Killingsworth NONE
# 10. Betsey&Dunson https://www-1jstor-1org-1000094gq0b71.han.buw.uw.edu.pl/stable/pdf/1815749.pdf?ab_segments=0%2FSYC-5878%2Fafter3&refreqid=fastly-default%3A59e107af2ecff315356162f7dc2a99fd
# 11. Brown http://links.jstor.org/sici?sici=0022-166X%28198324%2918%3A1%3C3%3ATEOTEO%3E2.0.CO%3B2-Q&origin=JSTOR-pdf
# 12. Hammermesh https://www.nber.org/system/files/working_papers/w0656/w0656.pdf
# 13. Solon https://www-1jstor-1org-1000094gq0b71.han.buw.uw.edu.pl/stable/pdf/146014.pdf?ab_segments=0%2FSYC-5878%2Fafter3&refreqid=fastly-default%3Adf3c9166c54a5e763efbb31b908ee14e
# 14. Wellington https://www-1jstor-1org-1000094gq0b71.han.buw.uw.edu.pl/stable/pdf/145715.pdf?ab_segments=0%2FSYC-5878%2Fafter3&refreqid=fastly-default%3Ab2a82b10b5243be2c4394960ee94a58d
# 15. Klerman NONE








