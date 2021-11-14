# Terraform

To switch billing for projects that are managed via Terraform, you will have to give the Terraform service account a **`billing user`** permission on the DoiT billing account and set/replace the **`billing_account`** value in your script.

## Grant Permission

{% hint style="info" %}
To add the Terraform service account as Billing User, you should be a Billing Account Administrator for the DoiT Billing Account.
{% endhint %}

Reference Links:  ![](<../../.gitbook/assets/image (49).png>) [Overview of Cloud Billing roles in IAM](https://cloud.google.com/billing/docs/how-to/billing-access#overview-of-cloud-billing-roles-in-cloud-iam) /  [Update Cloud Billing permissions](https://cloud.google.com/billing/docs/how-to/billing-access#update-cloud-billing-permissions)

1. Sign in to the [Google Cloud Console](https://console.cloud.google.com/?\_ga=2.46935335.1241116962.1634885894-310662435.1627993656).
2.  Open the Cloud Console Navigation menu, and then select **Billing**.

    If you have more than one cloud billing account, do one of the following:

    ➜ To manage Cloud Billing for the current project, select Go to linked billing account.&#x20;

    ➜ To locate a different Cloud Billing account, select Manage billing accounts and then choose the account that you want to manage.&#x20;

    ![](<../../.gitbook/assets/image (91).png>)


3.  In the Billing navigation menu, click **Account management**.

    ![](<../../.gitbook/assets/image (22).png>)
4. Use the **Permissions panel **to edit permissions for the selected Cloud Billing account. If the panel isn't already visible, click `SHOW INFO PANEL` to open it.
5.  Click **Add Principal**

    ![](<../../.gitbook/assets/image (14).png>)

6\. Input the terraform service account as **New Principal** and select **`Billing Account User`** role, then Save.

![](<../../.gitbook/assets/image (32).png>)



{% hint style="info" %}
**Default Billing Account**

If an identity (in this case the terraform service account) only has access to a single billing account, GCP will use that as the default **`billing_account`**value in Terraform. You could use this behaviour to ensure DoiT Billing Account is selected as the default by removing the Terraform service account's permission to any other billing accounts and/or explicitly set the DoiT Billing Account ID on your Terraform script. See steps below.&#x20;
{% endhint %}

## Set/Replace value for billing\_account&#x20;

Reference Link: ![](<../../.gitbook/assets/image (42).png>) [Terraform Documentation - Google Cloud Platform google\_project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google\_project#billing\_account)

As noted on Terraform documentation for Google Cloud Platform google\_project, one of the arguments supported is **`billing_account`**. To associate the projects, simply set or replace its value with your DoiT Billing Account ID.&#x20;

Example:

```javascript
resource "google_project" "my_project" {
  name       = "My Project"
  project_id = "your-project-id"
  org_id     = "1234567"
  billing_account = "DoiT-Billing-Account-ID"
}
```

##
