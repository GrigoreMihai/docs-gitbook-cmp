---
description: >-
  How to create a Google Cloud Billing Account directly from the Cloud
  Management Platform.
---

# Create a Google Billing Account

## Overview

The _Cloud Billing accounts_ are used to define who pays for a given set of Google Cloud resources and _Google Maps Platform APIs_. Access control to a Cloud Billing account is established by IAM roles. A Cloud Billing account is connected to a DoiT International [billing profile](../invoices-and-payments/setting-up-a-new-billing-profile.md).

Use these instructions to create a Google Cloud Billing Account and link it to your company's billing profile using the Cloud Management Platform.

{% hint style="info" %}
Required Permissions: _Assets Manager_
{% endhint %}

{% hint style="warning" %}
Please note: Your user account must be linked to at least one billing profile in the _Cloud Management Platform_.
{% endhint %}

## Create a new billing account

Start with you logging into the [Cloud Management Platform](https://app.doit-intl.com), and select _Manage Licenses & Assets_ from the main dashboard:

![A screenshot showing you CMP dashboard](../.gitbook/assets/dashboard.png)

Once you're at the Assets page, switch to the Google Cloud tab and select _New Billing Account_, located in the top right-hand corner of the screen:

![A screenshot showing the Google Cloud assets screen](../.gitbook/assets/assets-google-cloud.png)

You will be prompted with a pop-up requesting you to enter your Google _Billing Account Name_, _Billing Profile_, and the email addresses of designated _Billing Account Administrators_.

After completing the form, you should now see the new billing account listed on the Google Cloud assets page.

{% hint style="info" %}
Your domain is added as a _Billing Account User_ on the new Billing Accounts you create in the CMP. This allows anyone on the domain to link projects to the billing account.
{% endhint %}

The following video shows you how to create a Google Cloud Billing Account.

{% embed url="https://www.loom.com/share/c2b1e2fe55204fa9aa7bafe7a3cc8c06" %}

## Manage billing account permissions

### CMP

Each billing account card has an arrow icon in the lower right-hand corner. Selecting this icon will expand the card to show you the billing account administrators.

To add a billing account administrator:

1. Expand the list of billing account administrators.

2. Select the icon of a person with a plus sign.

3. When prompted, provide one or more emails to invite new administrators.

To remove a billing account administrator:

1. Expand the list of billing account administrators.

2. Find the email address of the administrator you want to remove.

3. Select the trash can icon located to the right of the email address.

4. You will be prompted to confirm the removal of the administrator.

{% hint style="info" %}
Only current billing account administrators can add or remove other administrators.
{% endhint %}

### Google Cloud

If you prefer to manage billing account permissions using your GCP Console, please follow the steps on GCP documentation:

* [Update Cloud Billing permissions](https://cloud.google.com/billing/docs/how-to/billing-access#update-cloud-billing-permissions)
* [Overview of Cloud Billing roles in IAM](https://cloud.google.com/billing/docs/how-to/billing-access#overview-of-cloud-billing-roles-in-cloud-iam)
