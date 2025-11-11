---
layout: default
title: "Integrating AMCP with Kubernetes and Service Mesh"
description: "Complete guide to deploying AMCP in cloud-native environments with Kubernetes and Istio."
date: "July 2025"
author: "AMCP Team"
category: "Integration"
permalink: /blog/kubernetes-integration.html
keywords: "Kubernetes, Istio, service mesh, cloud-native, deployment"
---

# Integrating AMCP with Kubernetes and Service Mesh

**Complete guide to deploying AMCP in cloud-native environments with Kubernetes and Istio.**

---

## Table of Contents

1. [Overview](#overview)
2. [Kubernetes Deployment](#kubernetes-deployment)
3. [Service Mesh Integration](#service-mesh-integration)
4. [Monitoring & Observability](#monitoring--observability)
5. [Best Practices](#best-practices)

---

## Overview

Kubernetes provides the perfect platform for AMCP:

- **Orchestration**: Automatic scaling and management
- **Service Discovery**: Built-in DNS
- **Load Balancing**: Automatic traffic distribution
- **Self-Healing**: Automatic restarts
- **Rolling Updates**: Zero-downtime deployments

---

## Kubernetes Deployment

### Step 1: Create Docker Image

```dockerfile
FROM quay.io/quarkus/quarkus-distroless-image:2.0

COPY target/amcp-agent-1.0.0-runner /application

EXPOSE 8080

CMD ["/application", "-Dquarkus.http.host=0.0.0.0"]
```

Build and push:

```bash
docker build -t myregistry/amcp-agent:1.0.0 .
docker push myregistry/amcp-agent:1.0.0
```

### Step 2: Create Deployment

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: amcp-agent
  namespace: default
spec:
  replicas: 3
  selector:
    matchLabels:
      app: amcp-agent
  template:
    metadata:
      labels:
        app: amcp-agent
    spec:
      containers:
      - name: amcp-agent
        image: myregistry/amcp-agent:1.0.0
        ports:
        - containerPort: 8080
        env:
        - name: KAFKA_BOOTSTRAP_SERVERS
          value: kafka:9092
        - name: AMCP_AGENT_NAME
          valueFrom:
            fieldRef:
              fieldPath: metadata.name
        resources:
          requests:
            memory: "256Mi"
            cpu: "250m"
          limits:
            memory: "512Mi"
            cpu: "500m"
        livenessProbe:
          httpGet:
            path: /health
            port: 8080
          initialDelaySeconds: 30
          periodSeconds: 10
        readinessProbe:
          httpGet:
            path: /health/ready
            port: 8080
          initialDelaySeconds: 20
          periodSeconds: 5
```

### Step 3: Create Service

```yaml
apiVersion: v1
kind: Service
metadata:
  name: amcp-agent
spec:
  selector:
    app: amcp-agent
  ports:
  - protocol: TCP
    port: 8080
    targetPort: 8080
  type: ClusterIP
```

### Step 4: Deploy

```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

# Verify deployment
kubectl get pods -l app=amcp-agent
kubectl get svc amcp-agent
```

---

## Service Mesh Integration

### Install Istio

```bash
# Download Istio
curl -L https://istio.io/downloadIstio | sh -

# Install
cd istio-*
./bin/istioctl install --set profile=demo -y

# Enable sidecar injection
kubectl label namespace default istio-injection=enabled
```

### Create VirtualService

```yaml
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: amcp-agent
spec:
  hosts:
  - amcp-agent
  http:
  - match:
    - uri:
        prefix: /api
    route:
    - destination:
        host: amcp-agent
        port:
          number: 8080
      weight: 100
    timeout: 30s
    retries:
      attempts: 3
      perTryTimeout: 10s
```

### Create DestinationRule

```yaml
apiVersion: networking.istio.io/v1beta1
kind: DestinationRule
metadata:
  name: amcp-agent
spec:
  host: amcp-agent
  trafficPolicy:
    connectionPool:
      tcp:
        maxConnections: 100
      http:
        http1MaxPendingRequests: 100
        http2MaxRequests: 1000
    loadBalancer:
      simple: ROUND_ROBIN
    outlierDetection:
      consecutive5xxErrors: 5
      interval: 30s
      baseEjectionTime: 30s
```

### Create PeerAuthentication

```yaml
apiVersion: security.istio.io/v1beta1
kind: PeerAuthentication
metadata:
  name: default
spec:
  mtls:
    mode: STRICT
```

---

## Monitoring & Observability

### Install Prometheus

```bash
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.15/samples/addons/prometheus.yaml
```

### Install Grafana

```bash
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.15/samples/addons/grafana.yaml
```

### Install Jaeger

```bash
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.15/samples/addons/jaeger.yaml
```

### Create ServiceMonitor

```yaml
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: amcp-agent
spec:
  selector:
    matchLabels:
      app: amcp-agent
  endpoints:
  - port: metrics
    interval: 30s
```

---

## Auto-Scaling

### Horizontal Pod Autoscaler

```yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: amcp-agent-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: amcp-agent
  minReplicas: 3
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 70
  - type: Resource
    resource:
      name: memory
      target:
        type: Utilization
        averageUtilization: 80
```

---

## Best Practices

### 1. Resource Limits

Always set resource requests and limits:

```yaml
resources:
  requests:
    memory: "256Mi"
    cpu: "250m"
  limits:
    memory: "512Mi"
    cpu: "500m"
```

### 2. Health Checks

Implement liveness and readiness probes:

```yaml
livenessProbe:
  httpGet:
    path: /health
    port: 8080
  initialDelaySeconds: 30
  periodSeconds: 10

readinessProbe:
  httpGet:
    path: /health/ready
    port: 8080
  initialDelaySeconds: 20
  periodSeconds: 5
```

### 3. Rolling Updates

Use rolling update strategy:

```yaml
strategy:
  type: RollingUpdate
  rollingUpdate:
    maxSurge: 1
    maxUnavailable: 0
```

### 4. Network Policies

Restrict traffic:

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: amcp-network-policy
spec:
  podSelector:
    matchLabels:
      app: amcp-agent
  policyTypes:
  - Ingress
  - Egress
  ingress:
  - from:
    - podSelector:
        matchLabels:
          app: amcp-agent
  egress:
  - to:
    - podSelector:
        matchLabels:
          app: kafka
```

---

## Troubleshooting

### Check Pod Status

```bash
kubectl get pods -l app=amcp-agent
kubectl describe pod <pod-name>
kubectl logs <pod-name>
```

### Check Service

```bash
kubectl get svc amcp-agent
kubectl get endpoints amcp-agent
```

### Check Istio

```bash
istioctl analyze
istioctl describe pod <pod-name>
```

---

## Performance

### Deployment Metrics

```
Startup Time:      < 100ms
Memory Usage:      256-512MB
CPU Usage:         250-500m
Throughput:        1000+ msg/sec
Latency (p99):     50ms
```

---

**Ready to deploy? Start with Kubernetes today! 🚀**
