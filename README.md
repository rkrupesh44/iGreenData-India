# iGreenData-India
Assessment
# iGreenData-India App

## Description

This is a simple Flask application with an endpoint that returns version information.

## Endpoints

- **GET /version**: Returns the version information.

## Setup

### Prerequisites

- Docker
- Kubernetes
- Terraform
- Python
- Jenkins

### Steps

1. **Clone the repository**
    ```sh
    git clone https://github.com/rkrupesh44/iGreenData-India.git
    cd iGreenData-India
    ```

2. **Build the Docker image**
    ```sh
    docker build -t your-docker-repo/iGreenData-India:latest .
    ```

3. **Run the application**
    ```sh
    docker run -p 5000:5000 your-docker-repo/iGreenData-India:latest
    ```

4. **Deploy to Kubernetes**
    ```sh
    kubectl apply -f kubernetes/
    ```

5. **Provision Kubernetes Cluster with Terraform**
    ```sh
    cd terraform
    terraform init
    terraform apply
    ```

## CI/CD

Jenkins is used to build, containerize, and deploy the application to a Kubernetes cluster. The CI/CD pipeline is defined in the `Jenkinsfile`.

## Risks and Shortcomings

- **Security**: Ensure to use proper secret management for sensitive information.
- **Scalability**: Adjust the Kubernetes resources according to the application's load.
- **Reliability**: Implement health checks and monitoring for better reliability.

## License

MIT License
