---
description: How to analyze cloud spend that pre-dates when you started using the CMP
---

# Import Historical Data

## Overview

This feature enables you to upload all your historical Google Cloud billing data into DoiT Cloud Management Platform (CMP) to immediately analyze your cloud spend and promptly identify optimization opportunities through Cloud Analytics, BigQuery Lens, and other CMP features.

To get started, first, you need to ensure that you have a Service Account that connects your Google Cloud Organization to CMP. Then, you'll have to grant two additional required permissions.

## Step 1. Identify the service account linked to CMP

1. From CMP's left side navigation menu, click "**Settings**"
2. Select "**Google Cloud**" tab
3. Locate the "**Service Account**" listed in Configured Accounts

![A screenshot showing the location of the _Settings_ menu item, _Google Cloud_ tab, and _Service Account_listing](<../.gitbook/assets/image (103).png>)

If you do not have this configured yet, you need to create a service account and connect CMP to your Google Cloud Organization. Follow the steps in this link: [Connect Google Cloud Service Account](https://help.doit-intl.com/google-cloud/connect-google-cloud-service-account)

Once you have identified the service account, copy the service account email and proceed to granting it with the the additional required permissions.

## Step 2. Grant the required Permissions

{% hint style="info" %}
You need to have the appropriate IAM role/permission in GCP to grant the required permissions to the service account
{% endhint %}

> ###  Grant the **BigQuery Data Viewer role**

1. From GCP, navigate to the BigQuery Console and open the **dataset** where the billing data is stored, then click  "**Share dataset**"
2. In the Dataset Permissions tab, click "**Add Member**" and paste the **service account** **email** that was linked to CMP as identified in [**Step 1**](import-historical-billing-data.md#step-1-identify-the-service-account-linked-to-cmp).
3. Click "**Select a Role**" highlight BigQuery then choose **BigQuery Data Viewer**
4. Click "**Add**"
5. Click "**Done**"

![A screenshot showing the location of the _Share Dataset_ option](<../.gitbook/assets/image (96).png>)

![A screenshot showing the process of granting the _BigQuery Data Viewer_ role](<../.gitbook/assets/image (94).png>)

> ### Grant the **bigquery.jobs.create permission**
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

![A screenshot showing how to select an organization, access the _IAM & Admin_ menu item, and then select _Roles_](<../.gitbook/assets/image (116).png>)

![A screenshot showing the location of the service account listing](<../.gitbook/assets/image (117).png>)

![A screenshot showing the location of the _Edit Role_ option and the `bigquery.jobs.create` permission listing](<../.gitbook/assets/image (108).png>)

![A screenshot showing the _Add Permissions_ option, a list of permissions, and the _Add_ button](<../.gitbook/assets/image (112).png>)

## Step 3. Link your Google Cloud Direct Billing Account

{% hint style="info" %}
Required Permission: CMP Assets Manager
{% endhint %}

1. From CMP's left side navigation menu, click "**Assets**"
2. Select "**Google Cloud**" tab
3. Click the dropdown button next to "New Billing Account" and select "**Link Direct Account**"

![A screenshot showing the location of the _Assets_ menu item, the _Google Cloud_ tab, and the _Link Direct Account_ option](<../.gitbook/assets/image (107).png>)

You can now import your historical billing data into CMP. You need the following information to complete the process:

* Billing Account ID: _example_ <!-- cspell:disable -->"**01CF51-9FDB87-7894FD**"<!-- cspell:enable -->
* Source Project: Enter the "**Project ID"**
* Source Dataset: Enter the "**Dataset ID"**

![A screenshot of the _Link your Google Cloud Direct Billing Account_ modal dialog](<../.gitbook/assets/image (161).png>)

Once you click "**Import**" a new card will be added to your assets reflecting the details and progress or completion status.

![A screenshot showing the new _Google Cloud_ card with a "Processing" status](<../.gitbook/assets/image (115).png>)

![A screenshot showing the new _Google Cloud_ card with a "Success" status](<../.gitbook/assets/image (118) (1) (1) (1) (1).png>)
