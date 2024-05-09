---
title: Workshop Overview
---

```editor:append-lines-to-file
file: ~/config.yaml
text: |
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

Should be able to get rid of provider option but CLI not defaulting to custom right now.

```terminal:execute
command: educates admin cluster install --config config.yaml --provider=custom
```

```terminal:execute
command: educates deploy-workshop -f https://github.com/vmware-tanzu-labs/lab-k8s-fundamentals/releases/latest/download/workshop.yaml
```

```terminal:execute
command: educates browse-workshops
```
