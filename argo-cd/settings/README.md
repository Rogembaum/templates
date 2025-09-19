# ArgoCD Settings - Initial Setup Configuration

This directory contains the initial configuration files for setting up ArgoCD with proper project structure and application management. These files provide a foundation for GitOps workflows and multi-project management.

## Files Overview

### `project.yaml`
**Purpose**: Defines the main ArgoCD project for infrastructure settings
- **Project Name**: `argo-cd-settings`
- **Scope**: Infrastructure and ArgoCD management
- **Permissions**: Restricted to ArgoCD Application and ApplicationSet resources only
- **Repositories**: Configured to use this templates repository

### `app-of-apps.yaml`
**Purpose**: Application of Applications pattern for managing multiple projects
- **Application Name**: `app-of-apps`
- **Source**: Points to the `argocd/projects` directory
- **Auto-sync**: Enabled with prune and self-heal
- **Recursive**: Automatically discovers and manages all YAML files in the projects directory

## Initial Setup Instructions

### Prerequisites
1. ArgoCD must be installed and running in your Kubernetes cluster
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

2. `kubectl` configured to access your cluster
3. Access to the ArgoCD namespace (`argocd`)

### Step 1: Apply the Project Configuration
```bash
# Apply the main project configuration
kubectl apply -f project.yaml
```

This creates the `argo-cd-settings` project with:
- Restricted permissions for security
- Access to the templates repository
- Proper RBAC configuration

### Step 2: Apply the App-of-Apps Configuration
```bash
# Apply the app-of-apps application
kubectl apply -f app-of-apps.yaml
```

This creates the main application that will:
- Automatically discover and manage all projects in `argocd/projects/`
- Enable auto-sync with prune and self-heal capabilities
- Create the namespace if it doesn't exist

### Step 3: Verify the Setup
```bash
# Check if the project was created
kubectl get appproject argo-cd-settings -n argocd

# Check if the app-of-apps application was created
kubectl get application app-of-apps -n argocd

# Check the sync status
kubectl describe application app-of-apps -n argocd
```

### Step 4: Access ArgoCD UI
```bash
# Port forward to access ArgoCD UI
kubectl port-forward svc/argocd-server -n argocd 8080:443

# Get the initial admin password
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

Access the UI at: `https://localhost:8080`
- Username: `admin`
- Password: (from the command above)

## Configuration Details

### Project Security Model
The `argo-cd-settings` project is configured with:
- **Cluster Resource Blacklist**: Denies all cluster-level resources
- **Namespace Resource Whitelist**: Only allows ArgoCD Application and ApplicationSet resources
- **Source Repository**: Restricted to the templates repository

### App-of-Apps Pattern
The `app-of-apps` application:
- **Source**: `https://github.com/Rogembaum/templates.git`
- **Path**: `argocd/projects`
- **Recursive**: `true` (discovers all YAML files)
- **Auto-sync**: Enabled with prune and self-heal
- **Target**: Local cluster (`https://kubernetes.default.svc`)

## Adding New Projects

To add new projects to be managed by ArgoCD:

1. Create a new project YAML file in the `argocd/projects/` directory
2. The app-of-apps will automatically discover and manage it
3. Ensure the project follows the same structure as `stream-project-1.yaml`

## Troubleshooting

### Common Issues

1. **Application not syncing**
   ```bash
   # Check application status
   kubectl describe application app-of-apps -n argocd
   
   # Force sync
   kubectl patch application app-of-apps -n argocd --type merge -p '{"operation":{"sync":{"syncStrategy":{"force":true}}}}'
   ```

2. **Permission denied errors**
   - Verify the project has correct RBAC permissions
   - Check if the source repository is accessible
   - Ensure the target namespace exists

3. **Repository access issues**
   - Verify the repository URL is correct
   - Check if the repository is accessible from the cluster
   - Ensure proper authentication if required

### Useful Commands

```bash
# List all applications
kubectl get applications -n argocd

# Get application details
kubectl get application <app-name> -n argocd -o yaml

# Check project details
kubectl get appproject <project-name> -n argocd -o yaml

# View application logs
kubectl logs -n argocd -l app.kubernetes.io/name=argocd-application-controller
```

## Next Steps

After applying these initial settings:

1. **Configure RBAC**: Set up proper user groups and permissions
2. **Add Projects**: Create additional projects in the `argocd/projects/` directory
3. **Configure Notifications**: Set up webhooks and notifications for sync events
4. **Set up Monitoring**: Configure monitoring and alerting for ArgoCD
5. **Backup Configuration**: Ensure proper backup of ArgoCD configuration

## Security Considerations

- The project configuration restricts cluster-level resource access
- Only ArgoCD Application and ApplicationSet resources are allowed
- Source repository is restricted to the templates repository
- Consider implementing additional RBAC policies based on your organization's requirements

## Support

For issues and questions:
- Check ArgoCD documentation: https://argo-cd.readthedocs.io/
- Review Kubernetes logs for detailed error information
- Ensure all prerequisites are met before applying configurations


kubectl delete appproject argo-cd-settings -n argocd

kubectl patch appproject argo-cd-settings -n argocd --type=json -p='[{"op": "remove", "path": "/metadata/finalizers"}]'

kubectl delete appproject argo-cd-settings -n argocd --ignore-not-found