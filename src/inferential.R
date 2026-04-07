install.packages(c("effsize", "pwr"), repos = "https://cloud.r-project.org/")
library(effsize)
library(pwr)

# read data from file
data <- read.csv("data/data.csv")

# extract data into arrays
audio_time <- data$time[data$feedback_type == "Audio"]
visual_time <- data$time[data$feedback_type == "Visual"]

audio_error <- data$absolute_error[data$feedback_type == "Audio"]
visual_error <- data$absolute_error[data$feedback_type == "Visual"]

audio_years_experience <- data$years_of_experience[data$feedback_type == "Audio"]
visual_years_experience <- data$years_of_experience[data$feedback_type == "Visual"]

# QQ plot for audio feedback tuning time
pdf("figures/qq_audio_time.pdf")
qqnorm(audio_time,
    main = "Quantile-Quantile Plot of Audio Feedback Tuning Time",
    xlab = "Theoretical Quantiles",
    ylab = "Sample Quantiles",
    cex.main = 1.5,
    cex.lab = 1.2,
    family = "sans"
)
qqline(audio_time)
dev.off()

# QQ plot for audio feedback absolute error
pdf("figures/qq_audio_error.pdf")
qqnorm(audio_error,
    main = "Quantile-Quantile Plot of Audio Feedback Tuning Error",
    xlab = "Theoretical Quantiles",
    ylab = "Sample Quantiles",
    cex.main = 1.5,
    cex.lab = 1.2,
    family = "sans"
)
qqline(audio_error)
dev.off()

# QQ plot for visual feedback tuning time
pdf("figures/qq_visual_time.pdf")
qqnorm(visual_time,
    main = "Quantile-Quantile Plot of Visual Feedback Tuning Time",
    xlab = "Theoretical Quantiles",
    ylab = "Sample Quantiles",
    cex.main = 1.5,
    cex.lab = 1.2,
    family = "sans"
)
qqline(visual_time)
dev.off()

# QQ plot for audio feedback absolute error
pdf("figures/qq_visual_error.pdf")
qqnorm(visual_error,
    main = "Quantile-Quantile Plot of Visual Feedback Tuning Error",
    xlab = "Theoretical Quantiles",
    ylab = "Sample Quantiles",
    cex.main = 1.5,
    cex.lab = 1.2,
    family = "sans"
)
qqline(visual_error)
dev.off()

# Welch's t-test
t.test(audio_time, visual_time)
t.test(audio_error, visual_error)

# Mann Whitney U test
suppressWarnings(wilcox.test(visual_time, audio_time))
suppressWarnings(wilcox.test(visual_error, audio_error))

# perform power test and find Type II error
d_time <- cohen.d(visual_time, audio_time)$estimate
d_error <- cohen.d(visual_error, audio_error)$estimate

d_time
d_error

power_time <- pwr.t2n.test(
    n1 = length(visual_time),
    n2 = length(audio_time),
    d = d_time,
    sig.level = 0.05
)$power

power_error <- pwr.t2n.test(
    n1 = length(visual_error),
    n2 = length(audio_error),
    d = d_error,
    sig.level = 0.05
)$power

power_time
power_error

(1 - power_time)
(1 - power_error)

# ANCOVA test
data_ancova <- data.frame(
    error = c(visual_error, audio_error),
    time = c(visual_time, audio_time),
    feedback = factor(c(
        rep("Visual", length(visual_error)),
        rep("Audio", length(audio_error))
    )),
    experience = c(visual_years_experience, audio_years_experience)
)

# ANCOVA for tuning error (main effect + covariate)
ancova_error <- aov(error ~ feedback + experience, data = data_ancova)
ancova_error

# ANCOVA for tuning time (main effect + covariate)
ancova_time <- aov(time ~ feedback + experience, data = data_ancova)
ancova_time

# ANCOVA with interaction (moderation)
ancova_interaction <- aov(error ~ feedback * experience, data = data_ancova)
ancova_interaction
