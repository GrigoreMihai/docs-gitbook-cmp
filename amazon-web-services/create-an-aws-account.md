---
description: >-
  Create new AWS account/s with preconfigured consolidated billing directly from
  Cloud Management Platform
---

# Create An AWS Account

As a customer, you can create a new AWS account directly from the Cloud Management Platform.

{% hint style="warning" %}
Please note you must be assigned access to the specific Billing Profile under which the domain is managed in order to create a new account.
{% endhint %}

{% hint style="danger" %}
You will see an **OrganizationAccountAccessRole** in the new AWS account. This role is created by AWS and links back to the parent account. When creating the account we will use this role to [create the CloudHealth IAM Role](https://help.doit-intl.com/amazon-web-services/set-up-cloudhealth). The CMP or DoiT International will not use this role afterwards and you will have to **manually remove this role from your account**
{% endhint %}

Start with you logging into the [Cloud Management Platform](https://app.doit-intl.com), and Access the 'Create AWS Account' from the menu on the left-hand side of the page and clicking on Assets.

![](<../.gitbook/assets/assets-icon-1- (4) (5) (5) (4).png>)

On the right-hand side of the page, click the bottom facing arrow and choosing 'Create Account'.

![](<../.gitbook/assets/aws-create-account-doit (1).png>)

Choose the Billing Profile to which you're creating the account for while choosing the name of the account to which the _root email_ is associated with.

![](<../.gitbook/assets/image (140).png>)

Click 'Create' and a popup will appear that the account was created successfully. 

![](../.gitbook/assets/aws-account-successful2.png)

As listed in the popup, an email is sent out for further instructions, here is an example.

![](../.gitbook/assets/aws-doit-success.png)

The following video shows you how to create an AWS Account.

{% embed url="https://www.loom.com/share/f92b0a76aa884a52ad9281f0736f44a1" %}

If you require further assistance please contact our support team at [support.doit-intl.com](https://support.doit-intl.com)
