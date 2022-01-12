---
description: Adding existing AWS accounts to DoiT International consolidated billing
---

# Invite Existing AWS Account

You can add existing AWS accounts to DoiT International's consolidated billing using the Cloud Management Platform.

{% hint style="info" %}
Required Permission: **Licenses Manager**
{% endhint %}

{% hint style="warning" %}
Please note that you must be assigned access to the specific Billing Profile under which the domain is managed in order to invite an existing account.
{% endhint %}

Within the CMP, select _Billing_ from the top navigation bar and then select _Assets_. The CMP will take you to the _Assets_ page.

From the _Assets_ page, select _Amazon Web Services_ from the left-hand menu:

![A screenshot showing the Amazon Web Services assets page](../.gitbook/assets/cmp-assets-aws.png)

From the Amazon Web Services assets page, select the _Invite Account_ button.

The CMP will open a modal dialog:

![A screenshot showing the _Invite Account_ modal dialog](../.gitbook/assets/cmp-assets-aws-invite-account-modal.png)

Then:

1. Select the billing profile you would like to invite
2. Enter the 12-digit AWS Account ID
3. Add invitation notes (optional

When you are done, select _Invite_.

You should then receive an email from Amazon Web Services with a link to accept the invitation:

![A screenshot of an email sent by DoiT](../.gitbook/assets/email-invite-existing-3.png)

If you haven't received the above email within five minutes, please re-enter your AWS Account ID in the DoiT Cloud Management Platform and send the invite again.

To complete the process, sign in to the [AWS Organizations Console](https://console.aws.amazon.com/organizations/). On the Invitations page in the console, you can see your open invitations to join organizations:

![A screenshot of the AWS _Invitations_ screen](../.gitbook/assets/aws-invite-4.png)

Finally, select the _Accept_ button to accept the invitation.

Afterward, you will be redirected to the _Organization overview_ page that provides details about the organization that your account has joined. You can view the organization's ID and the owner's email address.

## Multiple Accounts Under a Master Organization

In the event that you have multiple accounts under a Master account / organization, you will get an error trying to accept the invitation.

In order to successfully accept the invitation, you must remove each linked AWS account from your master account.

{% hint style="info" %}
Note: This will prompt you to input payment details for each linked account if you didn't do so while initially creating them.
{% endhint %}

For each account you must:

1. "Leave" the Organization (no new invites will appear before you do this)
2. Accept the invite from DoiT International in each linked account

## Completing IAM Access for CloudHealth

After signing in to the AWS Console and accepting the invitation, a final email will be sent instructing how to complete the IAM access for CloudHealth.

![A screenshot of an email sent by DoiT](../.gitbook/assets/email-invite-5.png)

## Frequently asked questions

### I've performed all the requested steps, I have spends on my AWS billing account, but my information is still not there. What could be the reason ?

Once successfully completed it takes 24-72 hours for the data to start flowing through from AWS, then our Cloud Management Platform will update.

### I have not received any invitation email. What could have gone wrong?

On your organization's page, check if you can see the invite:

![A screenshot of the _AWS Organizations_ page](../.gitbook/assets/aws-invite-6.png)

If you can't see that invite, check if you have left your organization as specified in the above "Multiple Accounts Under a Master Organization" steps.

If you can see the invite on the organization's page, consider the following:

Is the invite in your spam folder? Did you enter the correct AWS account id when inviting the account?

If you are still having issues, you can [open a support ticket](https://hello.doit-intl.com/support).

### My CloudHealth status shows as "critical" or "unknown", what does it mean?

### My payer account is showing as N/A, what does that mean?

!["CloudHealth Status: Unknown"](../.gitbook/assets/cmp-cloudhealth-status-unknown.png)

It means that your Cloudhealth configuration was not done properly.

**Actions to take:** please [open a support ticket](https://hello.doit-intl.com/support) if you see the CloudHealth status as "critical" or "unknown", or if you see Payer Account: N/A.

**The consequences are the following:**

* Our Cloud Management Platform is not able to properly reflect your reservation data, and you cannot use the FlexSave and Spot Scaling services.
* It also means you will not be able to run reports on this asset, the reason being that the data is not flowing to our platform.
