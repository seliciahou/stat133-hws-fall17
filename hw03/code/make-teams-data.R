# ===================================================================
# Title: HW03
# Description:
#   Variables needed to be used in ranking analysis
# Input(s): nba2017-teams.csv
# Output(s): 
# Author: Selicia Hou
# Date: 10-15-2017
# ===================================================================
setwd("/Users/Selicia Hou/stat133/stat133-hws-fall17/hw03/data")

# packages
library(readr)    # importing data
library(dplyr)    # data wrangling
library(ggplot2)  # graphics

read_csv("nba2017-roster.csv")

stat <- read_csv("nba2017-stats.csv")
spec(stat)

missed_fg <- (stat$field_goals_atts - stat$field_goals_made)
missed_ft <- (stat$points1_atts - stat$points1_made)
points <- (stat$points3_made + stat$points2_made + stat$points1_made)
rebounds <- (stat$off_rebounds + stat$def_rebounds)
efficiency <- ((points + rebounds + stat$assists + stat$steals + stat$blocks - missed_fg - stat$turnovers)/stat$games_played)
efficiency
completestats <- mutate(stat, missed_fg = stat$field_goals_atts - stat$field_goals_made, missed_ft = stat$points1_atts - stat$points1_made, points = stat$points3_made + stat$points2_made + stat$points1_made, rebounds = stat$off_rebounds + stat$def_rebounds, efficiency = ((points + rebounds + stat$assists + stat$steals + stat$blocks - missed_fg - stat$turnovers)/stat$games_played))

write.csv(completestats, file="/Users/Selicia Hou/stat133/stat133-hws-fall17/hw03/output/completestats.csv", row.names=FALSE)

sink(file = 'efficiency-summary.txt')
summary(completestats[ ,"efficiency"])
sink()

roster <- read_csv("nba2017-roster.csv")

teams1 <- full_join(roster, completestats, by="player")
teams1

teams2 <- summarise(group_by(teams1, team), experience = sum(experience), salary = sum(salary), points3 = sum(points3_made), points2 = sum(points2_made), free_throws = sum(points1_made), points = sum(points3_made + points2_made + points1_made), off_rebounds = sum(off_rebounds), def_rebounds = sum(def_rebounds), assists = sum(assists), steals = sum(steals), blocks = sum(blocks), turnovers = sum(turnovers), fouls = sum(fouls), efficiency = sum(efficiency))
teams2

teams <- summary(teams2)
teams

sink(file = 'teams-summary.txt')
summary('teams')
sink()

help(pdf)
pdf(file = "/Users/Selicia Hou/stat133/stat133-hws-fall17/hw03/images/teams_star_plot.pdf")
stars(teams[ ,-1], labels = teams$team)
help(stars)

pdf(file = "/Users/Selicia Hou/stat133/stat133-hws-fall17/hw03/images/experience_salary.pdf")
ggplot(data = teams2, aes(x = experience, y = salary)) + geom_point(aes(color = team))
