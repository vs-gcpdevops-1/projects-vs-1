

#Steps

```
chmod +x quickstart.sh

gcloud artifacts repositories create quickstart-docker-repo --repository-format=docker \
    --location=us-west2 --description="Docker repository"

gcloud artifacts repositories list

gcloud config get-value project

gcloud builds submit --region=us-west2 --tag us-west2-docker.pkg.dev/PROJECT_ID/quickstart-docker-repo/quickstart-image:tag1

```

``
gcloud builds submit --region=us-west2 --config cloudbuild.yaml
``
