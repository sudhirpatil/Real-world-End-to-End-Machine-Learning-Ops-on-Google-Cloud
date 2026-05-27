# Step-1 : Create bucket and upload file
# Search "cloud storage" GCP UI, create bucket mlops-course-oreilly and upload us-states.csv file. 
# Get gs://URI by right click on three dots in end & copy gsutil uri. Replace with copied gs:// bucket path in main.py. 

# Step-2
docker build --platform linux/amd64 --pull=false -t demo-flask-app .

# Push to Container Registry 
docker tag demo-flask-app gcr.io/mlops-course-oreilly/demo-flask-app
docker push gcr.io/mlops-course-oreilly/demo-flask-app

gcloud run deploy demo-flask-app --image gcr.io/mlops-course-oreilly/demo-flask-app --region us-central1


# Push to Artifact Registry 
docker tag demo-flask-app us-central1-docker.pkg.dev/mlops-course-oreilly/python-apps/demo-flask-app
docker push us-central1-docker.pkg.dev/mlops-course-oreilly/python-apps/demo-flask-app

gcloud run deploy demo-flask-app2 \
--image us-central1-docker.pkg.dev/mlops-course-oreilly/python-apps/demo-flask-app \
--region us-central1

# If you want to skip running docker build, docker tag, and docker push entirely on your local machine, Google Cloud allows you to deploy directly from your source directory.
# Google Cloud CLI packages your source files and uploads them to a secure Cloud Storage bucket.
# Google Cloud Build reads your optimized Dockerfile in the cloud, builds the container image securely using Google's ultra-fast network, and registers it.
# Cloud Run automatically deploys the newly built image.
gcloud run deploy demo-flask-app --source . --region us-central1

# Stop & Start the service, without requiring re-deploy
gcloud run services update demo-flask-app \
    --max-instances 0 \
    --region us-central1
gcloud run services update demo-flask-app \
    --max-instances 10 \
    --region us-central1
