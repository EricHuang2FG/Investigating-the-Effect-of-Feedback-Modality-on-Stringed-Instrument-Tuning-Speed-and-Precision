data <- read.csv("data/data.csv")

audio_time <- data$time[data$feedback_type == "Audio"]
visual_time <- data$time[data$feedback_type == "Visual"]

audio_error <- data$absolute_error[data$feedback_type == "Audio"]
visual_error <- data$absolute_error[data$feedback_type == "Visual"]

audio_years_experience <- data$years_of_experience[data$feedback_type == "Audio"]
visual_years_experience <- data$years_of_experience[data$feedback_type == "Visual"]


# boxplot for tuning time
pdf("figures/boxplot_tuning_time.pdf")

boxplot(visual_time, audio_time,
    names = c("Visual Feedback", "Auditory Feedback"),
    main = "Comparison of Tuning Time by Feedback Modality",
    ylab = "Time (s)",
    col = c("lightblue", "lightgreen"),
    boxwex = 0.4,
    cex.main = 1.5,
    cex.lab = 1.4,
    family = "sans"
)
dev.off()

# boxplot for tuning error
pdf("figures/boxplot_tuning_error.pdf")

boxplot(visual_error, audio_error,
    names = c("Visual Feedback", "Auditory Feedback"),
    main = "Comparison of Tuning Error by Feedback Modality",
    ylab = "Time (s)",
    col = c("lightblue", "lightgreen"),
    boxwex = 0.4,
    cex.main = 1.5,
    cex.lab = 1.4,
    family = "sans"
)
dev.off()

# compute descriptive statistics including mean, median, and standard deviation
print("Visual Error:")
mean(visual_error)
median(visual_error)
sd(visual_error)

print("Visual Time:")
mean(visual_time)
median(visual_time)
sd(visual_time)

print("Auditory Error:")
mean(audio_error)
median(audio_error)
sd(audio_error)

print("Auditory Time:")
mean(audio_time)
median(audio_time)
sd(audio_time)

print("Audio Years Experience")
mean(audio_years_experience)
median(audio_years_experience)
sd(audio_years_experience)

print("Visual Years Experience")
mean(visual_years_experience)
median(visual_years_experience)
sd(visual_years_experience)
