---
description: How to update your user profile on Cloud Management Platform
---

# Your Profile

You can access and edit your user profile to adjust your personal details and/or notifications settings. To access your profile settings, click your profile icon in the upper-right corner of the page header and select **Profile.**

You will be taken to a Profile page, where you'll find the following tabs:

* Profile
* Permissions
* Notifications
* API

Let's go over what can be configured in each tab.

## Profile

* **First / Last Name**
* **Job Function**
* **Phone Number**
* **Default Dashboard** - the default dashboard that appears on your "Homepage" whenever you log in.

## Permissions

This is where you can view your [CMP Role](../user-management/manage-roles.md) (and the associated permissions that come with it) and assign yourself to any [Billing Profiles](../invoices-and-payments/setting-up-a-new-billing-profile.md) (if you have the Admin role).

## Notifications

You can request to be notified on the following events:

**New Invoices** - an email will be sent when a new invoice is uploaded to the Cloud Management Platform

**Credits Utilization** - request to be notified when your credits are 75% exhausted and then again once they have been fully exhausted.

**Cloud Quota Utilization** - notifies you when you exceed 50% usage of any of your Google Cloud and/or AWS service quotas.

**Cost Anomalies** - request to be notified when our system detects abnormal usage of your cloud platform (i.e., AWS and/or Google Cloud). Additionally, you can set at which threshold (Information, Warning, Critical) you'd like to be notified.

**Payment Due/Overdue** - an email will be sent reminding the user to pay the invoice. There are three different instances of when notifications are sent:

* [ ] The first reminder is sent seven days before an invoice is due.
* [ ] The second reminder is sent four days after the invoice's due date.
* [ ] The third reminder is sent 10 days after the invoice's due date.

**Cloud** [**Known Issues**](../tickets/cloud-infrastructure-known-issues.md)

* Get alerted whenever there is an infrastructure issue with Google Cloud and/or AWS that may affect your own workloads.

### Daily Digest Emails

Selecting one or more attributions from the dropdown will generate a daily cost digest sent to your email address. You will receive one email per attribution selected detailing:

* Previous day's cost
* Month to date cost (sum costs accrued in the current month)
* Cost trend (current month cost to date / previous month costs to same date in the previous month)
* Forecasted current month cost

The email will be sent at 6:00 UTC.

![A screenshot of the email that will be sent](../.gitbook/assets/daily-digest-email.png)

### API

This is where you go to generate your API key in order to [programmatically access several CMP features](../apis/developer-hub.md).

After you generate your key, copy and store it somewhere handy, as we won't show it again after you leave the API page.
