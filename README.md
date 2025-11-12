# Problem 2 — Architecture & CI/CD Pipeline Improvements

## Goal (Estimated time: 20–30 minutes)
You are given a minimal Dockerfile, Kubernetes Deployment,  
and GitHub Actions CI workflow. All contain intentional flaws.

Your task is to improve the architecture and pipeline in a realistic and practical way.

## Requirements
1. Convert the Dockerfile into a **multi-stage build** to reduce image size.
2. Add **livenessProbe** and **readinessProbe** to the Kubernetes deployment.
3. Add **rollingUpdate strategy**.
4. Improve CI workflow:
   - Use buildx cache
   - Produce meaningful image tags (e.g., `${{ github.sha }}`)
   - Keep the pipeline simple and maintainable
5. Add 1–2 short notes in the README describing **security or best-practice improvements**  
   (example: image scanning, secrets management).

## What to Deliver
- Updated Dockerfile
- Updated `k8s-deployment.yaml`
- Updated `.github/workflows/ci.yml`
- Notes explaining why your changes improve reliability/maintainability.

## Evaluation Criteria
- Practicality & correctness of the improvements
- Clean, concise modifications
- Awareness of DevOps best practices

## Dockerfile Improvements
- Multi-stage build
- Reduced image size
- Cleaner separation between build-time and runtime dependencies.

## Kubernetes Deployment Enhancements
- Added readinessProbe — ensures the pod only receives traffic when ready.
- livenessProbe to automatically restarts unhealthy containers
- rollingUpdate strategy, performs zero-downtime deployments by updating pods gradually.

## CI/CD Pipeline (GitHub Actions)
- Enabled buildx caching using GitHub Actions’ built-in cache system.
- Used docker/metadata-action for cleaner tagging and labeling.
- Secrets stored in GitHub Secrets (no hardcoding).

## Security and Best Practices
- Image Scanning: Recommend integrating Trivy or Snyk into the CI workflow to automatically detect vulnerabilities in base images
- Secrets Management: DockerHub credentials stored securely via GitHub Secrets.
- Minimal Runtime Image: Smaller final image reduces the surface area for security vulnerabilities.
