# Command to run the build using cloudbuild.yaml
# We pass the current git commit SHA as a substitution variable because $COMMIT_SHA is only populated automatically during git trigger builds.
gcloud builds submit --region us-central1 --no-source-staging-cache --substitutions=COMMIT_SHA=$(git rev-parse --short HEAD 2>/dev/null || echo "latest")