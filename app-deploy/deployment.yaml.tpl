apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-cybernetics
  labels:
    app: hello-cybernetics
spec:
  replicas: 1
  selector:
    matchLabels:
      app: hello-cybernetics
  template:
    metadata:
      labels:
        app: hello-cybernetics
    spec:
      containers:
      - name: hello-cloudbuild
        image: us-central1-docker.pkg.dev/GOOGLE_CLOUD_PROJECT/docker-registry/hello-cybernetics:COMMIT_SHA
        ports:
        - containerPort: 8080
