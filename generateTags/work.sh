# List the current branch name
echo "Current branch:"
git branch --show-current

# List all branches
echo "All branches:"
git branch -a

# Show the last 5 commits
echo "Last 5 commits:"
git log -5 --oneline

# Show the status of the working directory
echo "Working directory status:"
git status

# Show the remote repositories
echo "Remote repositories:"
git remote -v

# Show the git configuration
echo "Git configuration:"
git config --list
