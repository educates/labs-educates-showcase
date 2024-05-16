---
title: Workshop Overview
---

First up we need to create an Educates configuration for installation into a virtual cluster.

There is a predefined configuration for this which can be selected by setting the provider to `vcluster`, however, to speed up installation we will disable the use of Kyverno as the security policy engine for the cluster and workshops. Either way, we must at least specify the ingress domain for Educates to use. In this case where we are installing Educates into a virtual cluster attached to our workshop session, so we set the ingress domain to be that assigned to this workshop session.

```editor:append-lines-to-file
file: ~/config.yaml
text: |
    clusterInfrastructure:
        provider: vcluster

    clusterPackages:
        kyverno:
            enabled: false

    clusterIngress:
        domain: {{< param session_name >}}.{{< param ingress_domain >}}

    clusterSecurity:
        policyEngine: none

    workshopSecurity:
        rulesEngine: none
```

Now we can install Educates into the virtual cluster using the configuration file we created.

```terminal:execute
command: educates admin cluster install --config config.yaml
```

To verify that installation of Educates was successful, we will deploy a workshop.

```terminal:execute
command: educates deploy-workshop -f https://github.com/vmware-tanzu-labs/lab-k8s-fundamentals/releases/latest/download/workshop.yaml
```

To access the workshop we need to need to open our web browser on the URL for the training portal instance the workshop has been assigned to. This can be done using the command:

```terminal:execute
command: educates browse-workshops
```

If your web browser blocks access to the URL, run the command again (for Chrome, seems to work the second time), or allow popups and redirections for the URL for this training session.
