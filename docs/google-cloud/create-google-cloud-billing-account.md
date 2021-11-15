---
description: >-
  How to create a Google Cloud Billing Account directly from the Cloud
  Management Platform.
---

# Create Google Billing Account

## Overview

The _Cloud Billing accounts_ are used to define who pays for a given set of Google Cloud resources and _Google Maps Platform APIs_. Access control to a Cloud Billing account is established by IAM roles. A Cloud Billing account is connected to a DoiT International [billing profile](../invoices-and-payments/setting-up-a-new-billing-profile.md).

Use these instructions to create a Google Cloud Billing Account and link it to your company's billing profile using the Cloud Management Platform.

{% hint style="info" %}
Required Permissions: _Assets Manager_
{% endhint %}

{% hint style="warning" %}
Please note: Your user account must be linked to at least one billing profile in the _Cloud Management Platform_.
{% endhint %}

## Create a new Billing Account

Start with you logging into the [Cloud Management Platform](https://app.doit-intl.com), and select _Manage Licenses & Assets_ from the main dashboard:

![A screenshot showing you the location of the Manage Licenses & Assets section](../.gitbook/assets/transfer-projects.png)

Once you're at the Assets page, switch to the Google Cloud tab and select _New Billing Account_, located on the right-hand side of the page.

![A screenshot showing the location of the New Billing Account button](<../.gitbook/assets/image (64).png>)

You will be prompted with a pop-up requesting you to enter your Google _Billing Account Name_, _Billing Profile_, and the email addresses of designated _Billing Account Administrators_.

![A screenshot showing the Create Google Cloud Billing Account modal dialog](<../.gitbook/assets/image (118).png>)

After a few seconds, you should now see the new billing account:

![A screenshot showing the new billing account](<../.gitbook/assets/image (81) (1).png>)

{% hint style="info" %}
Your domain is added as a _Billing Account User_ on the new Billing Accounts you create in the CMP. This allows anyone on the domain to link projects to the billing account.
{% endhint %}

The following video shows you how to create a Google Cloud Billing Account.

{% embed url="https://www.loom.com/share/c2b1e2fe55204fa9aa7bafe7a3cc8c06" %}

## Manage Billing Account Permissions

{% hint style="info" %}
Only current Billing Admin(s) of the DoiT Billing Account can add or remove billing administrators.
{% endhint %}

From CMP navigation pane, select Assets > Google Cloud:

![A screenshot showing the location of the *Assets* icon](<../.gitbook/assets/image (57).png>):

Locate the Billing Account you want to update and click on the ![An image of
the "⌄" icon](<../.gitbook/assets/image (84).png>) icon

![A screenshot showing the location of the *Assets* icon](<../.gitbook/assets/image (10).png>)

### Add a Billing Account Administrator

1. Click the ![An image showing the person icon](<../.gitbook/assets/image (95).png>) icon for *Billing Admins*:

   ![An image showing the location of the person icon](<../.gitbook/assets/image (74).png>)

2. Input the email(s) of users you want to add as Billing Admin(s) then select *Save*:

   [A screenshot showing the location of the person icon](<../.gitbook/assets/image (98).png>)

### Remove a Billing Account Administrator

Find the billing admin you want to remove and click the ![An image showing the
trash can icon](<../.gitbook/assets/image (27).png>) next to their email

![A screenshot showing the location of the trash can icon](<../.gitbook/assets/image (40).png>)

Review and confirm the action by clicking ![An image showing the *APPROVE* button](<../.gitbook/assets/image (51).png>)

![A screenshot showing the *Remove Billing Account Admin* modal dialog](../.gitbook/assets/image.png)

If you prefer to manage Billing Account permissions using your GCP Console, please follow the steps on GCP documentation.

![An image of the GCP icon](<../.gitbook/assets/image (49).png>) [Update Cloud Billing permissions](https://cloud.google.com/billing/docs/how-to/billing-access#update-cloud-billing-permissions)

![An image of the GCP icon](<../.gitbook/assets/image (49).png>) [Overview of Cloud Billing roles in IAM](https://cloud.google.com/billing/docs/how-to/billing-access#overview-of-cloud-billing-roles-in-cloud-iam)&#x20;
