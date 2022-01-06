---
description: How to analyze cloud spend that pre-dates when you started using the CMP
---

# Import Historical Data

## Overview

This feature enables you to upload all your historical Google Cloud billing data into DoiT Cloud Management Platform (CMP) to immediately analyze your cloud spend and promptly identify optimization opportunities through Cloud Analytics, BigQuery Lens, and other CMP features.

To get started, first, you need to ensure that you have a Service Account that connects your Google Cloud Organization to CMP. Then, you'll have to grant two additional required permissions.

## Identify the service account

From the top menu, select the gear icon (_Settings_) in the upper right-hand corner, then select _Google Cloud_ under _Cloud settings_:

![A screenshot showing the _Google Cloud_ settings menu item](../.gitbook/assets/google-cloud-settings-menu.png)

This will take you to the Google Cloud settings screen:

![A screenshot showing the _Google Cloud_ settings screen](../.gitbook/assets/google-cloud-settings.png)

If you do not have a service account configured yet, you will need to [create a service account](connect-google-cloud-service-account.md) before you can continue.

Select your desired service account, copy the service account email, and proceed to grant the required permissions (see next section).

## Grant the required Permissions

{% hint style="info" %}
You need to have the appropriate IAM role/permission in GCP to grant the required permissions to the service account
{% endhint %}

> **BigQuery Data Viewer role**

1. From GCP, navigate to the BigQuery Console and open the **dataset** where the billing data is stored, then click "**Share dataset**"
2. In the Dataset Permissions tab, click "**Add Member**" and paste the **service account** **email** that was linked to CMP as identified in [**Step 1**](import-historical-billing-data.md#step-1-identify-the-service-account-linked-to-cmp).
3. Click "**Select a Role**" highlight BigQuery then choose **BigQuery Data Viewer**
4. Click "**Add**"
5. Click "**Done**"

![A screenshot showing the location of the Share Dataset option](../.gitbook/assets/share-dataset-button.png)

![A screenshot showing the process of granting the BigQuery Data Viewer role](../.gitbook/assets/grant-bigquery-role.png)

> **Grant the bigquery.jobs.create permission**
>
> Depending on the features initially enabled from the process [Connect Google Cloud Service Account](https://help.doit-intl.com/google-cloud/connect-google-cloud-service-account), you may already have this permission granted to the role. Follow the steps below to verify / add the permission to the project.

1. From the GCP console, select your **organization** from the dropdown options
2. On the navigation menu, go to "IAM & Admin" then select "**Roles**"
3. Click on the role "**DoiT CMP Service Account**"
4. Check if **bigquery.jobs.create** is included in the assigned permissions, if yes, no further action is needed since these permissions will be inherited by the projects
5. If bigquery.jobs.create permission is not yet added, click on "**Edit Role**"
6. Click "**Add Permissions**"
7. Filter by **"Permission : bigquery.jobs.create**" and check the box for this permission
8. Click "**Add**"

![A screenshot showing how to select an organization, access the IAM & Admin menu item, and then select Roles](../.gitbook/assets/iam-admin-select-roles.png)

![A screenshot showing the location of the service account listing](../.gitbook/assets/services-account-listing.png)

![A screenshot showing the location of the Edit Role option and the bigquery.jobs.create permission listing](../.gitbook/assets/edit-role-permission-listing.png)

![A screenshot showing the Add Permissions option, a list of permissions, and the Add button](../.gitbook/assets/add-permissions.png)

## Link your Google Cloud Direct Billing Account

{% hint style="info" %}
Required Permission: Assets Manager
{% endhint %}

1. From CMP's left side navigation menu, click "**Assets**"
2. Select "**Google Cloud**" tab
3. Click the dropdown button next to "New Billing Account" and select "**Link Direct Account**"

![A screenshot showing the location of the Assets menu item, the Google Cloud tab, and the Link Direct Account option](../.gitbook/assets/assets-google-cloud-link-account.png)

You can now import your historical billing data into CMP. You need the following information to complete the process:

* Billing Account ID: _example_ "**01CF51-9FDB87-7894FD**"
* Source Project: Enter the "**Project ID"**
* Source Dataset: Enter the "**Dataset ID"**

![A screenshot of the Link your Google Cloud Direct Billing Account modal dialog](../.gitbook/assets/link-google-cloud-billing-account-dialog.png

Once you select _Import_, a new card will be added to your Google Cloud assets screen with status information:

![A screenshot showing the new Google Cloud card with a "Processing" status](../.gitbook/assets/google-cloud-card-processing.png)

![A screenshot showing the new Google Cloud card with a "Success" status](../.gitbook/assets/google-cloud-card-success.png)
