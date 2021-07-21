---
description: 'a radically simple, zero disruption onboarding process for our customers'
---

# Import AWS Organizations

### Overview

Customers having their own AWS Organizations \(and willing to preserve them after switching to DoiT billing\) have a new, radically simple onboarding process which eliminates most of the hassle typically involved with consolidation process.

### Step 1 - Readiness \(by Customer\)

After signing a contract with AWS, your customer success manager would contact you to provide you with an onboarding process overview and guide you through the readiness phase. A typical process would be as following:

1. Identify the root AWS account in your AWS Org \(normally referred as Master Payer Account or MPA\)
2. In the MPA, create a new IAM user with "Administrator" policy
3. Change an MPA root email address to one provided by DoiT \(usually this would follow a awsops+{{ID}}@doit-intl.com pattern\)
4. Remove 2FA from the root account \(no worries, we'll re-enable it in the next step\)\]
5. Notify your customer success manager about completing the steps 1-4

### Step 2 - Onboarding \(by DoiT\)

1. Change the root password on AWS MPA account
2. Re-enable 2FA on the root account using software based token \(1password\)
3. Create `doitintl_cmp` IAM role to facilitate access from Cloud Management Platform
4. Create `CloudHealth` IAM role to provide access from CloudHealth
5. Create `AWSAdmin` IAM role \(used to access billing data under AWS Channel Reseller Program\)

### Frequently Asked Questions

**Q: Should I expect anything to break during the process?**

No, the process was designed to be disruption free.

**Q: Will the features dependent on AWS Organizations continue to function?**

 All AWS-organization features \(e.g. AWS SSO, AWS Backup, AWS Firewall Manager, Resource Manager, etc\) will continue to function in exactly the same way as before.

**Q: Can you please share the IAM policies for the roles you're creating on master payer account?**

Absolutely! You can find the policies at https://URL

