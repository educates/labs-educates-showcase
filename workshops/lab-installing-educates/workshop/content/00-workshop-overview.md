---
title: Workshop Overview
---

Note that once `vcluster` provider config added to CLI as one of the set of opinionated configs, this can be simplified.

```editor:append-lines-to-file
file: ~/config.yaml
text: |
    clusterInfrastructure:
        provider: custom

    clusterPackages:
        contour:
            enabled: false
        kyverno:
            enabled: false

    clusterIngress:
        domain: {{< param session_name >}}.{{< param ingress_domain >}}

    clusterSecurity:
        policyEngine: none

    workshopSecurity:
        rulesEngine: none

    imageRegistry:
        host: registry.default.svc.cluster.local

    imagePuller:
        enabled: false
```

```terminal:execute
command: educates admin cluster install --config config.yaml
```

```terminal:execute
command: educates deploy-workshop -f https://github.com/vmware-tanzu-labs/lab-k8s-fundamentals/releases/latest/download/workshop.yaml
```

```terminal:execute
command: educates browse-workshops
```
