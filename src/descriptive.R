data <- read.csv("data/data.csv")

audio_time <- data$time[data$feedback_type == "Audio"]
visual_time <- data$time[data$feedback_type == "Visual"]

audio_error <- data$absolute_error[data$feedback_type == "Audio"]
visual_error <- data$absolute_error[data$feedback_type == "Visual"]

audio_years_experience <- data$years_of_experience[data$feedback_type == "Audio"]
visual_years_experience <- data$years_of_experience[data$feedback_type == "Visual"]


# box plot for audio feedback tuning time
pdf("figures/boxplot_audio_time.pdf")
boxplot(audio_time,
    main = "Audio Feedback Tuning Time",
    xlab = "",
    ylab = "Time (s)",
    cex.main = 1.5,
    cex.lab = 1.2,
    family = "sans"
)

dev.off()

print("Audio Time:")
mean(audio_time)
median(audio_time)
sd(audio_time)

# box plot for audio feedback tuning error
pdf("figures/boxplot_audio_error.pdf")
boxplot(audio_error,
    main = "Audio Feedback Tuning Error",
    xlab = "",
    ylab = "Time (s)",
    cex.main = 1.5,
    cex.lab = 1.2,
    family = "sans"
)

dev.off()

print("Audio Error:")
mean(audio_error)
median(audio_error)
sd(audio_error)

# box plot for visual feedback tuning time
pdf("figures/boxplot_visual_time.pdf")
boxplot(visual_time,
    main = "Visual Feedback Tuning Time",
    xlab = "",
    ylab = "Time (s)",
    cex.main = 1.5,
    cex.lab = 1.2,
    family = "sans"
)

dev.off()

print("Visual Time:")
mean(visual_time)
median(visual_time)
sd(visual_time)

# box plot for visual feedback tuning error
pdf("figures/boxplot_visual_error.pdf")
boxplot(visual_error,
    main = "Visual Feedback Tuning Error",
    xlab = "",
    ylab = "Time (s)",
    cex.main = 1.5,
    cex.lab = 1.2,
    family = "sans"
)

dev.off()

print("Visual Error:")
mean(visual_error)
median(visual_error)
sd(visual_error)

print("Audio Years Experience")
mean(audio_years_experience)
median(audio_years_experience)
sd(audio_years_experience)

print("Visual Years Experience")
mean(visual_years_experience)
median(visual_years_experience)
sd(visual_years_experience)
