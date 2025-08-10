#!/bin/bash

echo "Enter your name:"
read name

mkdir -p submission_reminder_${name}
cd submission_reminder_${name} || exit
mkdir -p modules app assets config

cat << 'EOF' > app/reminder.sh
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions "$submissions_file"
EOF

chmod +x app/reminder.sh

cat << 'EOF' > modules/functions.sh
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    tail -n +2 "$submissions_file" | while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace and normalize case
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted' (case-insensitive)
        if [[ "${assignment,,}" == "${ASSIGNMENT,,}" && "${status,,}" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done
}
EOF

chmod +x modules/functions.sh

cat << EOF > assets/submissions.txt
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Aubierge, shell permissions, not submitted
lisette, Git, submitted
Peace, shell navigation, submitted
Grace, shell basics, not submitted
kessy, signals and processes, submitted
EOF

cat << EOF > config/config.env
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

cat << EOF > startup.sh
#!/bin/bash
bash app/reminder.sh
EOF

chmod +x startup.sh

