---
description: >-
  How to use attributions to create custom metrics to track and report on KPIs for your cloud
---

# Custom Metrics

## Overview

Custom metrics allows customers to calculate metrics based on existing [attributions](attributing-cloud-spend.md) within the CMP. Often when reporting on cost and usage for cloud environments the dimensions and metrics in your bill are not sufficient to understand key information. By creating formulas with portions of the bill key indicators of performance can be surfaced more cleanly.

For example:

- **Percentage of GCP CUD utilized**

  CUD (committed use discount) Usage / CUD (committed use discount) Commitment

- **Amortized Instance Reservation Consumption**

  Monthly Ec2 Instance type usage / (1 yr Reserved Instance type commitment / 12)

- **Percentage Shared Infrastructure Cost**

  Shared Infrastructure costs / Total Infrastructure Cost

Custom metrics can be particularly useful when tracking consumption of shared services.  Determine what percentage of shared infrastructure is being used by a single app.  Determine distribution of compute types across a set of accounts or projects.

## Structure of a Metric

Custom metrics are created by creating formula's with Attributions.  Each Attribution must have a base metric selected for it.  This can either be: Cost, Usage, or Savings. For more information, see our [Metric selection documentation](editing-your-cloud-report.md#metrics).

![A screenshot showing the _Base Metric_ drop-down menu](../.gitbook/assets/custom-metrics-drop-down.png)]

For instance, if you want to create a metric to track the percentage consumption of a compute commitment, you will require 2 Attributions.

- Compute Usage
- Compute Consumption.

Please ensure these Attributions are created in advance of metric creation

## Create a Metric

Navigate to [Cloud Analytics](create-cloud-report/README.md), and select the Metrics
tab

![A screenshot showing the _Metrics_ tab](../.gitbook/assets/custom-metrics-tab.png)

Select **'New Metric'**

![A screenshot showing the _New Metric_ form](../.gitbook/assets/custom-metrics-new-metric.png)

Provide a name for the new Custom Metric.

Select **Attribution** to set as _A_

Select **'Base Metric'** for Attribution _A_

Repeat as necessary for required attributions

Create a formula to generate the metric desired.

### Formulas

Formulas support standard **Order of Operations**

Custom metric formulas support the following operators:
| Operator | Description              |
| -------- | ------------------------ |
| +        | Addition                 |
| -        | Subtraction              |
| *        | Multiplication           |
| /        | Division                 |
| ()       | Parentheses for grouping |

{% hint style="info" %}
When a valid formula is created it will be automatically saved.
{% endhint %}

A formula is considered invalid if it is:

1. Empty
2. Invalid Variable Definition
   1. Attribution and/or base metric provide no data
   2. Variable is not complete (no metric selected, no attribution selected)
3. Invalid Formula
   1. Yields an error
   2. Divide by zero
   3. Incorrect formatting

When a valid formula is complete a preview will generate below

### Example metric

### GCP N1 Consumption %

N1 Usage / N1 Commitment as  %

![A screenshot of a custom metric formula and preview graph](../.gitbook/assets/custom-metrics-example.png)

## Including Customer Metrics in Cloud Analytics Reports

To include a metric in a report, [create a new report​](create-cloud-report/README.md)

In the Report configuration panel select *'Metric'*

![A screenshot showing the _Metric_ drop-down menu](../.gitbook/assets/custom-metrics-include-metric.png)

Once selected you will be prompted to confirm your choice

![A screenshot showing the confirmation modal dialog](../.gitbook/assets/custom-metrics-confirm-dialog.png)

Once selected you can build your report as normal with the required attributions and run your report
