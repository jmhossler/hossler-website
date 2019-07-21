import pkg_resources


def generate_kubeconfig():
    config = f"""
apiVersion: apps/v1beta2
kind: Deployment
metadata:
  name: test-website
  labels:
    name: test-website
spec:
  replicas: 1
  selector:
    matchLabels:
      name: test-website
  template:
    metadata:
      name: test-website
      labels:
        name: test-website
    spec:
      containers:
        - name: test-website
          image: docker.io/jmhossler/hossler-website:{pkg_resources.get_distribution('hossler_website').version}
          imagePullPolicy: Always
          ports:
            - containerPort: 8080
          resources:
            requests:
              memory: 256Mi
            limits:
              memory: 512Mi"""
    print(config)
