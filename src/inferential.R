data <- read.csv("data/data.csv")

audio_time <- data$time[data$feedback_type == "Audio"]
visual_time <- data$time[data$feedback_type == "Visual"]

audio_error <- data$absolute_error[data$feedback_type == "Audio"]
visual_error <- data$absolute_error[data$feedback_type == "Visual"]

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

t.test(audio_time, visual_time)
t.test(audio_error, visual_error)

# visual = read.table('/Users/susie/Downloads/Data Collection - MIE286 Course Project - Visual.txt')
# visual = vector(visual)
# visual = Vectorize(visual)
# visual = as.vector(visual)
# visual
# qqnorm(visual)
# visual = unlist(visual)
# qqnorm(visual)
# hist(visual)
# hist(visual, 'time taken','frequency')
# help("hist")
# hist(visual, xlab="time (s)", ylab='frequency')
# ??box and whisker
# ??box plot
# help("box and whisker plot")
# ??box and whisker plot
# boxplot(visual)
# help("boxplot")
# boxplot(visual, ylab = "time (s)")
# help("boxplot")
# boxplot(visual, ylab = "Time (s)", xlab = "Boxplot of Visual Condition")
# mean(visual)
# sd(visual)
# range(visual)
# 94 - 10.78
