# TODO:: Replace the project id 689092761989 with the your gcp project id, which you can get it from "gcloud projects list" command
# Assign Service account user role to the service account 
gcloud projects add-iam-policy-binding mlops-course-oreilly \
--member=serviceAccount:689092761989@cloudbuild.gserviceaccount.com --role=roles/iam.serviceAccountUser


# Assign Cloud Run role to the service account 
gcloud projects add-iam-policy-binding mlops-course-oreilly \
  --member=serviceAccount:689092761989@cloudbuild.gserviceaccount.com --role=roles/run.admin

#allow anyone on the internet to access this service without a token and avoid error "unauthenticated access is not allowed", you must grant the roles/run.invoker role to allUser  s.
gcloud run services add-iam-policy-binding cloudbuild-flask-app \
    --member="allUsers" \
    --role="roles/run.invoker" \
    --region=us-central1