library(tidyverse)
library(stargazer)

id_num = c(seq(1, 17, 1))

is_new = c(rep('No', 15), rep('Yes', 2))

author = c('Kaitz',
           'Mincer',
           'Gramlich',
           'Welch',
           'Ragan',
           'Wachter and Kim',
           'Iden',
           'Ragan',
           'Abowd and Killingsworth',
           'Betsey and Dunson',
           'Brown',
           'Hammermesh',
           'Solon',
           'Wellington',
           'Klerman',
           'Bernstein and Schmitt',
           'Bazen&Marimoutou')
year = c(
  1970, 1976, 1976, 1976, 1977, 
  1979, 1980, 1981, 1981, 1981,
  1983, 1981, 1985, 1991, 1992,
  2000, 2002)

t_stat = c(
  2.30, 2.41, 1.41, 2.22, 1.52,
  2.17, 4.43, 1.70, 1.04, 2.12,
  1.92, 1.63, 2.78, 1.41, 0.45,
  1.63, 1.9565)

df = c(49, 58, 106, 53, 31, 56, 93, 54, 95, 93, 92, 94, 86, 114, 123, 178, 149)

coef = c(
  0.098, 0.231, 0.094, 0.178, 0.065,
  0.252, 0.226, 0.052, 0.213, 0.139,
  0.096, 0.121, 0.098, 0.066, 0.052,
  0.061, 0.090)

teen_subsample = c(NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA, 0, 0) # 4

log_spec = c(
  0, 0, 1, 1, 1,
  1, 0, 1, 1, 0,
  1, 1, 1, 1, 1,
  1, 1)

no_exp_var = c(10, 5, 17, 6, 8, 11, 10, 9, 8, 10, 11, 5, 17, 17, 5, 10, 10)

autoreg_correction = c(0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1)

dt = data.frame(id_num, is_new, author, year, t_stat, df, coef, teen_subsample, log_spec, no_exp_var, autoreg_correction)
dt$error = dt$coef / dt$t_stat
dt$sqrt_df = sqrt(dt$df)
dt$l_sqrt_df = log(dt$sqrt_df)

# original meta-analysis excerpt:
# The t-ratio is the estimate divided by the standard error.
# With a large enough sample, t-ratios greater than 1.96 (in absolute value)
# suggest that your coefficient is statistically significantly different from 0
# at the 95% confidence level. A threshold of 1.645 is used for 90% confidence.

model_1_old = lm(log(t_stat) ~ l_sqrt_df,
                 data = dt[1:15,])
model_2_old = lm(log(t_stat) ~ l_sqrt_df + autoreg_correction + log_spec,
                 data = dt[1:15,])
model_3_old = lm(log(t_stat) ~ l_sqrt_df + autoreg_correction + log_spec + no_exp_var,
                 data = dt[1:15,])

model_1_new = lm(log(t_stat) ~ l_sqrt_df,
                 data = dt)
model_2_new = lm(log(t_stat) ~ l_sqrt_df + autoreg_correction + log_spec,
                 data = dt)
model_3_new = lm(log(t_stat) ~ l_sqrt_df + autoreg_correction + log_spec + no_exp_var,
                 data = dt)

model_1_old_sub1 = lm(log(t_stat) ~ l_sqrt_df,
                      data = dt[1:15,] %>% filter(year <= 1982))
model_2_old_sub1 = lm(log(t_stat) ~ l_sqrt_df + autoreg_correction + log_spec,
                      data = dt[1:15,] %>% filter(year <= 1982))
model_3_old_sub1 = lm(log(t_stat) ~ l_sqrt_df + autoreg_correction + log_spec + no_exp_var,
                      data = dt[1:15,] %>% filter(year <= 1982))

model_1_old_sub2 = lm(log(t_stat) ~ l_sqrt_df,
                      data = dt[1:15,] %>% filter(id_num != 7))
model_2_old_sub2 = lm(log(t_stat) ~ l_sqrt_df + autoreg_correction + log_spec,
                      data = dt[1:15,] %>% filter(id_num != 7))
model_3_old_sub2 = lm(log(t_stat) ~ l_sqrt_df + autoreg_correction + log_spec + no_exp_var,
                      data = dt[1:15,] %>% filter(id_num != 7))

model_1_new_sub2 = lm(log(t_stat) ~ l_sqrt_df,
                      data = dt %>% filter(id_num != 7))
model_2_new_sub2 = lm(log(t_stat) ~ l_sqrt_df + autoreg_correction + log_spec,
                      data = dt %>% filter(id_num != 7))
model_3_new_sub2 = lm(log(t_stat) ~ l_sqrt_df + autoreg_correction + log_spec + no_exp_var,
                      data = dt %>% filter(id_num != 7))

model_1_old_sub3 = lm(log(t_stat) ~ l_sqrt_df,
                      data = dt[1:15,] %>% filter(log_spec == 1))
model_2_old_sub3 = lm(log(t_stat) ~ l_sqrt_df + autoreg_correction + log_spec,
                      data = dt[1:15,] %>% filter(log_spec == 1))
model_3_old_sub3 = lm(log(t_stat) ~ l_sqrt_df + autoreg_correction + log_spec + no_exp_var,
                      data = dt[1:15,] %>% filter(log_spec == 1))

model_1_new_sub3 = lm(log(t_stat) ~ l_sqrt_df,
                      data = dt %>% filter(log_spec == 1))
model_2_new_sub3 = lm(log(t_stat) ~ l_sqrt_df + autoreg_correction + log_spec,
                      data = dt %>% filter(log_spec == 1))
model_3_new_sub3 = lm(log(t_stat) ~ l_sqrt_df + autoreg_correction + log_spec + no_exp_var,
                      data = dt %>% filter(log_spec == 1))

# Figure 1 Old
fig_1_old = ggplot(dt[1:15, ], aes(x = sqrt_df, y = t_stat)) +
  geom_point(aes(color = as.factor(is_new))) +
  geom_text(aes(label = id_num), hjust = -0.5, vjust = -0.5) +
  geom_smooth(method = 'lm', color = 'black') +
  labs(#title = 'Figure 1. Estimated t-statistics compared to Degrees of Freedom',
    #subtitle = 'Blue colour indicates the studies added to meta-analysis.',
    x = 'Square Root of Degrees of Freedom',
    y = 't-statistics (absolute)') +
  theme_bw() + 
  theme(legend.position = 'none')

# Figure 2 Old
fig_2_old = ggplot(dt[1:15, ], aes(x = error, y = coef)) +
  geom_point(aes(color = as.factor(is_new))) +
  geom_line(aes(y = 2 * error)) +
  geom_text(aes(label = id_num), hjust = -0.5, vjust = -0.5) +
  geom_smooth(method = 'lm', color = 'black') +
  labs(#title = 'Figure 2. Estimated Employment Elasticity compared to Standard Error Estimate',
    #subtitle = 'Blue colour indicates the studies added to meta-analysis.',
    x = 'Standard Error',
    y = 'Employment Elasticity (absolute)') +
  theme_bw() + 
  theme(legend.position = 'none')

# Figure 1 New
fig_1_new = ggplot(dt, aes(x = sqrt_df, y = t_stat)) +
  geom_point(aes(color = as.factor(is_new))) +
  geom_text(aes(label = id_num), hjust = -0.5, vjust = -0.5) +
  geom_smooth(method = 'lm', color = 'black') +
  labs(#title = 'Figure 1. Estimated t-statistics compared to Degrees of Freedom',
       #subtitle = 'Blue colour indicates the studies added to meta-analysis.',
       x = 'Square Root of Degrees of Freedom',
       y = 't-statistics (absolute)') +
  theme_bw() + 
  theme(legend.position = 'none')

# Figure 2 New
fig_2_new = ggplot(dt, aes(x = error, y = coef)) +
  geom_point(aes(color = as.factor(is_new))) +
  geom_line(aes(y = 2 * error)) +
  geom_text(aes(label = id_num), hjust = -0.5, vjust = -0.5) +
  geom_smooth(method = 'lm', color = 'black') +
  labs(#title = 'Figure 2. Estimated Employment Elasticity compared to Standard Error Estimate',
       #subtitle = 'Blue colour indicates the studies added to meta-analysis.',
       x = 'Standard Error',
       y = 'Employment Elasticity (absolute)') +
  theme_bw() + 
  theme(legend.position = 'none')
