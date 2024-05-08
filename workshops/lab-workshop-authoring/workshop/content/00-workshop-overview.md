---
title: Workshop Overview
---

```terminal:execute
command: educates new-workshop lab-test-workshop
```

```terminal:execute
command: cd lab-test-workshop
```

```terminal:execute
command: educates publish-workshop
```

```terminal:execute
command: educates deploy-workshop
```

```terminal:execute
command: educates browse-workshops
```

```terminal:execute
command: educates list-portals
```

```terminal:execute
command: educates view-credentials
```

```dashboard:open-url
url: http://educates-cli-ui.{{< param session_name >}}.{{< param ingress_domain >}}
```

Need proxy-host option because vcluster no longer returning correct name from DNS when calculating it.

```terminal:execute
command: educates serve-workshop --patch-workshop --proxy-host=loopback.default.svc.cluster.local
```

