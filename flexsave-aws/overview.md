---
description: How to maximize your EC2 discounts without any commitments
---

# FlexSave for AWS Overview

## Overview

FlexSave helps you maximize EC2 discounts with minimal-to-no commitments.

In order to use FlexSave, your AWS account/s must be consolidated with DoiT International billing organization. DoiT International is a global [AWS Advanced Channel Reseller](https://partners.amazonaws.com/partners/001E000001HPlIAIA1/).

{% hint style="info" %}
Required Permissions: **FlexSave Admin**   
Default roles with this permission: **Power User, Admin**
{% endhint %}

## FlexSave <a id="autopilot"></a>

FlexSave automates the management of AWS Reserved Instances and Saving Plans so that you realize the largest possible EC2 savings without having to make any commitments.

{% hint style="info" %}
FlexSave works by performing a sophisticated, AI-based analysis of your AWS workloads and identifies the ideal blend of Reserved Instances, automatically applying it to your account/s.
{% endhint %}

Navigate to FlexSave by clicking its icon on the left-hand navigation panel.

![](../.gitbook/assets/cleanshot-2021-06-22-at-11.30.57.jpg)

From the FlexSave page, you'll see a preview of your team's potential savings for the following month if you enable FlexSave.

Click "**ENABLE FLEXSAVE**" to turn it on.

![](../.gitbook/assets/cleanshot-2021-08-31-at-12.35.39.jpg)



After enabling FlexSave, you'll see your FlexSave Dashboard which displays important insights into your FlexSave savings. 

Let's go over the elements of your FlexSave Dashboard:

![FlexSave Dashboard with historical, current month&apos;s, and future projected savings](../.gitbook/assets/cleanshot-2021-07-19-at-11.49.44.jpg)

### FlexSave Dashboard

Your FlexSave Dashboard has three widgets, which displays $ savings resulting from using FlexSave:

* **Last month's savings**
* **Current month's savings**
* **Next month's potential savings**

{% hint style="info" %}
If you've never previously used FlexSave or purchased Flexible Reserved Instances through the DoiT CMP,  the "Last month's savings" widget will not appear during the first month you use FlexSave.
{% endhint %}

In addition, each widget contains two statistics that give more context around your realized savings:

* **Savings rate**: The % difference of what you spent on EC2 compute with FlexSave vs. what you would've spent on on-demand instances without it.
* **Net on-demand spend**: Your EC2, net of savings realized from FlexSave

Finally, your FlexSave Dashboard contains a stacked-column chart displaying FlexSave savings and net EC2 spend from previous months, your current month, and a forecast for the next month.

Columns displaying data for the current and previous months contain two parts:

* **Savings**: Your $ savings realized from using FlexSave
* **Net on-demand spend**: Your EC2 spend, net of savings realized from using FlexSave

{% hint style="info" %}
Historical data will only show up if you've previously used FlexSave, or if you purchased Flexible Reserved Instances through the DoiT CMP in the past.
{% endhint %}

The column displaying data for the next month contains two parts as well:

* **Forecasted savings**: Anticipated savings assuming you continue to use FlexSave, based on AI analysis of your AWS workloads.
* **Forecasted net on-demand spend**: Anticipated EC2 spend, net of the forecasted savings from using FlexSave

### **Disabling FlexSave**

If you prefer to turn off FlexSave, click on the vertical ellipsis in the top-right corner of the FlexSave page. Then select "Disable FlexSave".

![](../.gitbook/assets/cleanshot-2021-08-31-at-11.49.41.jpg)

A confirmation pop-up will appear, explaining that FlexSave will continue to generate savings until the end of the month.

Click "Disable" to turn off FlexSave.

![](../.gitbook/assets/cleanshot-2021-08-31-at-11.50.38.jpg)

### FlexSave Invoices

In your monthly bill you'll see a line item with the following details in your invoice:

* **Description**: FlexSave Savings
* **Details**: DoiT FlexSave Savings
* **Units**: -1
* **PPU**: {{Your monthly savings}}

The dollar amount displayed under "PPU" will be subtracted from your overall EC2 spend.

![](../.gitbook/assets/cleanshot-2021-08-31-at-11.25.09.jpg)

