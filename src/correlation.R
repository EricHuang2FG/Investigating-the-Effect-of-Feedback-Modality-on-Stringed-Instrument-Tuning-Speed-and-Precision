data <- read.csv("data/data.csv")

audio_time <- data$time[data$feedback_type == "Audio"]
visual_time <- data$time[data$feedback_type == "Visual"]

audio_error <- data$absolute_error[data$feedback_type == "Audio"]
visual_error <- data$absolute_error[data$feedback_type == "Visual"]

audio_years_experience <- data$years_of_experience[data$feedback_type == "Audio"]
visual_years_experience <- data$years_of_experience[data$feedback_type == "Visual"]

# ============================================
# 1. Prepare data for each condition
# ============================================

# Visual group data
visual_data <- data.frame(
    experience = visual_years_experience,
    time = visual_time,
    error = visual_error
)

# Audio group data
audio_data <- data.frame(
    experience = audio_years_experience,
    time = audio_time,
    error = audio_error
)

# ============================================
# 2. Calculate summary statistics for each group
# ============================================

# Visual group summary
visual_summary <- aggregate(cbind(time, error) ~ experience,
    data = visual_data,
    FUN = function(x) {
        c(
            mean = mean(x, na.rm = TRUE),
            sd = sd(x, na.rm = TRUE),
            n = length(x)
        )
    }
)

# Extract components for Visual group
vis_exp <- visual_summary$experience
vis_time_mean <- visual_summary$time[, "mean"]
vis_time_sd <- visual_summary$time[, "sd"]
vis_error_mean <- visual_summary$error[, "mean"]
vis_error_sd <- visual_summary$error[, "sd"]

# Audio group summary
audio_summary <- aggregate(cbind(time, error) ~ experience,
    data = audio_data,
    FUN = function(x) {
        c(
            mean = mean(x, na.rm = TRUE),
            sd = sd(x, na.rm = TRUE),
            n = length(x)
        )
    }
)

# Extract components for Audio group
aud_exp <- audio_summary$experience
aud_time_mean <- audio_summary$time[, "mean"]
aud_time_sd <- audio_summary$time[, "sd"]
aud_error_mean <- audio_summary$error[, "mean"]
aud_error_sd <- audio_summary$error[, "sd"]

# ============================================
# 3. Create separate PDF for each plot
# ============================================

# -----------------------------------------
# Plot 1: Visual Feedback - Tuning Time
# -----------------------------------------
pdf("figures/visual_time_vs_experience.pdf", width = 8, height = 6)

plot(vis_exp, vis_time_mean,
    main = "Visual Feedback: Tuning Time",
    xlab = "Years of Experience",
    ylab = "Mean Tuning Time (seconds)",
    pch = 16, col = "blue", cex = 1.2,
    xlim = range(c(vis_exp, aud_exp), na.rm = TRUE),
    ylim = range(c(
        vis_time_mean - vis_time_sd,
        vis_time_mean + vis_time_sd,
        aud_time_mean - aud_time_sd,
        aud_time_mean + aud_time_sd
    ), na.rm = TRUE)
)

arrows(
    x0 = vis_exp,
    y0 = vis_time_mean - vis_time_sd,
    y1 = vis_time_mean + vis_time_sd,
    angle = 90, code = 3, length = 0.1, col = "blue", lwd = 1.5
)

dev.off()

# -----------------------------------------
# Plot 2: Audio Feedback - Tuning Time
# -----------------------------------------
pdf("figures/audio_time_vs_experience.pdf", width = 8, height = 6)

plot(aud_exp, aud_time_mean,
    main = "Audio Feedback: Tuning Time",
    xlab = "Years of Experience",
    ylab = "Mean Tuning Time (seconds)",
    pch = 16, col = "blue", cex = 1.2,
    xlim = range(c(vis_exp, aud_exp), na.rm = TRUE),
    ylim = range(c(
        vis_time_mean - vis_time_sd,
        vis_time_mean + vis_time_sd,
        aud_time_mean - aud_time_sd,
        aud_time_mean + aud_time_sd
    ), na.rm = TRUE)
)

arrows(
    x0 = aud_exp,
    y0 = aud_time_mean - aud_time_sd,
    y1 = aud_time_mean + aud_time_sd,
    angle = 90, code = 3, length = 0.1, col = "blue", lwd = 1.5
)

dev.off()

# -----------------------------------------
# Plot 3: Visual Feedback - Tuning Accuracy
# -----------------------------------------
pdf("figures/visual_accuracy_vs_experience.pdf", width = 8, height = 6)

plot(vis_exp, vis_error_mean,
    main = "Visual Feedback: Tuning Accuracy",
    xlab = "Years of Experience",
    ylab = "Mean Absolute Deviation (Hz)",
    pch = 16, col = "blue", cex = 1.2,
    xlim = range(c(vis_exp, aud_exp), na.rm = TRUE),
    ylim = range(c(
        vis_error_mean - vis_error_sd,
        vis_error_mean + vis_error_sd,
        aud_error_mean - aud_error_sd,
        aud_error_mean + aud_error_sd
    ), na.rm = TRUE)
)

arrows(
    x0 = vis_exp,
    y0 = vis_error_mean - vis_error_sd,
    y1 = vis_error_mean + vis_error_sd,
    angle = 90, code = 3, length = 0.1, col = "blue", lwd = 1.5
)

dev.off()

# -----------------------------------------
# Plot 4: Audio Feedback - Tuning Accuracy
# -----------------------------------------
pdf("figures/audio_accuracy_vs_experience.pdf", width = 8, height = 6)

plot(aud_exp, aud_error_mean,
    main = "Audio Feedback: Tuning Accuracy",
    xlab = "Years of Experience",
    ylab = "Mean Absolute Deviation (Hz)",
    pch = 16, col = "blue", cex = 1.2,
    xlim = range(c(vis_exp, aud_exp), na.rm = TRUE),
    ylim = range(c(
        vis_error_mean - vis_error_sd,
        vis_error_mean + vis_error_sd,
        aud_error_mean - aud_error_sd,
        aud_error_mean + aud_error_sd
    ), na.rm = TRUE)
)

arrows(
    x0 = aud_exp,
    y0 = aud_error_mean - aud_error_sd,
    y1 = aud_error_mean + aud_error_sd,
    angle = 90, code = 3, length = 0.1, col = "blue", lwd = 1.5
)

dev.off()
