---
title: Workshop Overview
---

Note that once `vcluster` provider config added to CLI as one of the set of opinionated configs, this can be simplified.

Download Javascript and CSS files for CookieConsent package from the CDN.

```terminal:execute
command: curl -L -o cookieconsent.css https://cdn.jsdelivr.net/gh/orestbida/cookieconsent@3.0.1/dist/cookieconsent.css
```

```terminal:execute
command: curl -L -o cookieconsent.umd.js https://cdn.jsdelivr.net/gh/orestbida/cookieconsent@3.0.1/dist/cookieconsent.umd.js
```

Create `.css` and `.js` files for the training portal.

```terminal:execute
command: cat cookieconsent.css > training-portal.css
```

```terminal:execute
command: cat cookieconsent.umd.js > training-portal.js
```

```terminal:execute
command: |
    cat << EOF >> training-portal.js
    /**
    * All config. options available here:
    * https://cookieconsent.orestbida.com/reference/configuration-reference.html
    */
    CookieConsent.run({

        categories: {
            necessary: {
                enabled: true,  // this category is enabled by default
                readOnly: true  // this category cannot be disabled
            },
            analytics: {}
        },

        language: {
            default: 'en',
            translations: {
                en: {
                    consentModal: {
                        title: 'We use cookies',
                        description: 'Cookie modal description',
                        acceptAllBtn: 'Accept all',
                        acceptNecessaryBtn: 'Reject all',
                        showPreferencesBtn: 'Manage Individual preferences'
                    },
                    preferencesModal: {
                        title: 'Manage cookie preferences',
                        acceptAllBtn: 'Accept all',
                        acceptNecessaryBtn: 'Reject all',
                        savePreferencesBtn: 'Accept current selection',
                        closeIconLabel: 'Close modal',
                        sections: [
                            {
                                title: 'Somebody said ... cookies?',
                                description: 'I want one!'
                            },
                            {
                                title: 'Strictly Necessary cookies',
                                description: 'These cookies are essential for the proper functioning of the website and cannot be disabled.',

                                //this field will generate a toggle linked to the 'necessary' category
                                linkedCategory: 'necessary'
                            },
                            {
                                title: 'Performance and Analytics',
                                description: 'These cookies collect information about how you use our website. All of the data is anonymized and cannot be used to identify you.',
                                linkedCategory: 'analytics'
                            },
                            {
                                title: 'More information',
                                description: 'For any queries in relation to my policy on cookies and your choices, please <a href="#contact-page">contact us</a>'
                            }
                        ]
                    }
                }
            }
        }
    });
    EOF
```

Create a Kubernetes secret using these as theme files.

```terminal:execute
command: kubectl create ns educates-themes
```

```terminal:execute
command: kubectl create secret generic cookieconsent-theme -n educates-themes --from-file=training-portal.css --from-file=training-portal.js
```

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

    websiteStyling:
        defaultTheme: cookieconsent-theme
        themeDataRefs:
        - name: cookieconsent-theme
          namespace: educates-themes
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
