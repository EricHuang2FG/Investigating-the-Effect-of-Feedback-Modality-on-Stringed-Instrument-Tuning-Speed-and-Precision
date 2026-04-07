data <- read.csv("data/data.csv")

audio_time <- data$time[data$feedback_type == "Audio"]
visual_time <- data$time[data$feedback_type == "Visual"]

audio_error <- data$absolute_error[data$feedback_type == "Audio"]
visual_error <- data$absolute_error[data$feedback_type == "Visual"]

audio_years_experience <- data$years_of_experience[data$feedback_type == "Audio"]
visual_years_experience <- data$years_of_experience[data$feedback_type == "Visual"]


# plot scatter plots
pdf("figures/scatter_audio_time_vs_experience.pdf", width = 8, height = 6)

plot(audio_years_experience, audio_time,
    main = "Audio Tuning Time vs. Years of Experience",
    xlab = "Years of Experience",
    ylab = "Tuning Time (s)",
    pch = 16, col = "blue", cex = 1.2, cex.lab = 1.2, cex.main = 1.3
)
dev.off()

pdf("figures/scatter_audio_error_vs_experience.pdf", width = 8, height = 6)

plot(audio_years_experience, audio_error,
    main = "Audio Tuning Error vs. Years of Experience",
    xlab = "Years of Experience",
    ylab = "Tuning Error (Hz)",
    pch = 16, col = "blue", cex = 1.2, cex.lab = 1.2, cex.main = 1.3
)
dev.off()

pdf("figures/scatter_visual_time_vs_experience.pdf", width = 8, height = 6)

plot(visual_years_experience, visual_time,
    main = "Visual Tuning Time vs. Years of Experience",
    xlab = "Years of Experience",
    ylab = "Tuning Time (s)",
    pch = 16, col = "blue", cex = 1.2, cex.lab = 1.2, cex.main = 1.3
)
dev.off()


pdf("figures/scatter_visual_error_vs_experience.pdf", width = 8, height = 6)

plot(visual_years_experience, visual_error,
    main = "Visual Tuning Error vs. Years of Experience",
    xlab = "Years of Experience",
    ylab = "Tuning Error (Hz)",
    pch = 16, col = "blue", cex = 1.2, cex.lab = 1.2, cex.main = 1.3
)
dev.off()

# conduct Spearman analysis
suppressWarnings(cor.test(visual_years_experience, visual_time, method = "spearman"))
suppressWarnings(cor.test(visual_years_experience, visual_error, method = "spearman"))
suppressWarnings(cor.test(audio_years_experience, audio_time, method = "spearman"))
suppressWarnings(cor.test(audio_years_experience, audio_error, method = "spearman"))
