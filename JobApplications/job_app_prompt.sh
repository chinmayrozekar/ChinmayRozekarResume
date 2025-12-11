#!/usr/bin/env bash

# Interactive job application entry script for jobapplications.tsv.
#
# This script prompts you for each field required to log a job
# application and appends your answers to a tab‑separated values (TSV)
# file.  It is portable between Bash and Zsh because it uses
# `read` for input rather than relying on positional parameters.  You
# can run it with `bash job_app_prompt.sh` or `./job_app_prompt.sh` on
# macOS or Linux.
#
# By default it writes to "$HOME/Documents/dev/JobApplications/jobapplications.tsv".
# If you want to override the location, export LOG before running or
# modify the default value below.

# Use an environment variable named LOG to override the target file.
# Otherwise default to a path under ~/Documents/dev/JobApplications.
LOG=${LOG:-"$HOME/Documents/dev/JobApplications/jobapplications.tsv"}

# Ensure the parent directory exists.
mkdir -p "$(dirname "$LOG")"

# Create the TSV file and header if it does not yet exist.
if [[ ! -f "$LOG" ]]; then
    printf "date\tcompany\trole\treq\tlocation\turl\tstatus\tnext_action\tlast_contact\treferral\n" > "$LOG"
fi

# Prompt the user for each field.  `read -r` reads an entire line,
# including spaces, without interpreting backslash escapes.

read -r -p "Enter date (YYYY-MM-DD, leave blank for today): " date_input
date=${date_input:-$(date +%F)}

read -r -p "Enter company name: " company

read -r -p "Enter role/position: " role

read -r -p "Enter job Req (NA if not available): " req

read -r -p "Enter job location: " location

read -r -p "Enter application URL (optional): " url

read -r -p "Enter status (default 'applied'): " status_input
status=${status_input:-applied}

read -r -p "Enter next action (optional): " next_action

read -r -p "Enter last contact date (default same as date): " last_contact_input
last_contact=${last_contact_input:-$date}

read -r -p "Enter referral (optional): " referral

# Append the row to the TSV file.  Each field is separated by a tab.
printf "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n" \
  "$date" "$company" "$role" "$req" "$location" "$url" "$status" "$next_action" "$last_contact" "$referral" >> "$LOG"

echo "Entry added to $LOG"