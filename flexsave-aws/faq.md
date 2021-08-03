---
description: Frequently asked questions about FlexSave for Amazon Web Services
---

# FlexSave for AWS FAQ

### Overview

FlexSave helps you maximize EC2 discounts with minimal-to-no commitments.

[Autopilot mode](overview.md#autopilot) ****automates the management of AWS Reserved Instances and Saving Plans so that you realize the largest savings without making any commitments.

[Manual mode](overview.md#manual-mode) lets you commit to EC2 Reserved Instances in one-month intervals while still getting 80%+ of the AWS-listed Reserved Instance discount. That way, you'll eliminate RI lock-in risk for your less predictable workloads.

In order to use FlexSave, your AWS account/s should be consolidated with the DoiT International billing organization. DoiT International is a global [AWS Advanced Channel Reseller](https://partners.amazonaws.com/partners/001E000001HPlIAIA1/).

### How much can I save every month?

You can realize between 80% to a 100% of the discount granted by the applicable AWS Reserved Instance 1-year Full Upfront.

For example, AWS grants a 19.5% discount on reserved instances for instances from the m5 instance family in the us-west-1 region. A FlexSave reservation for this machine/region combination will provide you with a 15.6% \(19.5% \* 0.8\) discount but without the risk of committing to the entire year. 

### Can I use FlexSave if I am using AWS RIs or Saving Plans?

FlexSave reservations are applied to on-demand usage. Usage covered by AWS reserved instances or Savings Plans is excluded from our recommendations and the order user interface. 

### Can I buy FlexSave reservations for 3 months?

Yes, in [FlexSave Manual Mode](overview.md#manual-mode). FlexSave orders can be configured as "recurring" for any number of months. [Recurring orders](overview.md#setting-up-recurring-orders) will be automatically recreated every month. 

### Which AWS services are supported with FlexSave?

At this time, FlexSave supports AWS EC2. Other AWS services such as AWS RDS, VMware or Elasticache aren't supported at this time. Since FlexSave relies on AWS Convertible Reservations, you can check supported instances on [AWS website](https://aws.amazon.com/ec2/pricing/reserved-instances/pricing/). If there is no Convertible Reservations available for your instance type, it's either not supported with FlexSave.

### Can I send a report to the CFO with the actual realized savings?

Your actual savings is displayed in your FlexSave Dashboard. Your CFO has access to this dashboard and would be able to monitor the utilization as well as the actual savings yielded by the FlexSave.

This is your Dashboard in Autopilot Mode:

![](../.gitbook/assets/cleanshot-2021-06-22-at-10.38.04.jpg)

This is your Dashboard in Manual Mode:

![](../.gitbook/assets/cleanshot-2021-06-22-at-11.55.46.jpg)

![Example of the Actual Savings dashboard](../.gitbook/assets/flexri-utilization.jpg)

### Do you send an expiration reminder before the end of the month?

About 5 days before the existing FlexSave reservation/s expires \(unless there is a "recurring" setting enabled\), we will send you an email with a summary of all expiring flexible reservations.

### How exactly is the discount is calculated?

The discount is calculated by applying 80% on the applicable AWS Reserved Instances 1-year Full-Upfront "Savings over On-Demand". You can access AWS RI Pricing [here](https://aws.amazon.com/ec2/pricing/reserved-instances/pricing/).

### Can you make recommendations on the ideal FlexSave reservations I should buy?

Yes, if you use FlexSave [Manual Mode](overview.md#manual-mode). [**FlexSave Recommendations**](recommendations.md) ****identifies your AWS EC2 instances that aren't covered by a billing discount mechanism \(RIs, Savings Plans, etc.\), and calculates the ideal number of FlexSave reservations recommended to optimize your spend. You can then purchase these FlexSave reservations from the DoiT CMP in just a few clicks.

### How do FlexSave Recommendations work? 

[FlexSave Recommendations](recommendations.md) provides clients a list of machines to commit to for the proceeding month. In the background, DoiT monitors your historical EC2 usage and locates EC2 machines that are not covered by any discount regime \(Savings Plans, AWS RIs etc\) and that were not yet ordered for the following month. DoiT will run an algorithm to find the optimal coverage based on the instances' size, region, normalized units, account, operating system and family type.

Upon accepting a recommendation a new order will be created for the following month and the recommendation will be recalculated. Please notice that since some machines are eligible for size-flexibility, ordering a machine from the same family type can affect the recommendation on others. For example: ordering 1 x r5.2xlarge Linux in us-east-1 is equivalent to ordering 2 x  r5.xlarge. of the same type Upon making an order of an r5.2xlarge you may see that r5.xlarge may be eliminated from the recommendations since the first machine covers the exact same workload.

### Can you provide a discount based on consumption?

If you enable [Autopilot Mode](overview.md#autopilot), we will automatically implement recommendations, always optimizing for cost. Under this model, you don't need to think about which Flexible Reservations to purchase or to what hourly spend you're willing to commit. 

### Do you support every Operating System?

Right now, we support Linux and Windows-based \(including with Microsoft SQL Server\) operating systems. RedHat Enterprise Linux \(RHEL\) and SuSe Enterprise Linux \(SLES\) are not yet supported. 

### How is FlexSave different from Reserved Instances or Saving Plans?

In general, while FlexSave reservations do not yield as much discount as AWS Reserved Instances, you're not at risk of underutilizing reservations for longer than 1-month periods.

| Feature | DoiT FlexSave | AWS RIs | AWS Compute Saving Plans |
| :--- | :--- | :--- | :--- |
| Minimum commitment period | 1-month | 12-months | 12-months |
| Automatic renewal | yes | no | no |
| Regional | Yes | Yes | No |
| Instance Type-specific | Yes | Yes | No |
| Cover non-EC2 workloads | No | No | Lambda, Fargate |

### Which regions are supported with FlexSave?

As of the first quarter of 2021, FlexSave reservations are available in 7 AWS regions with more regions becoming available later this year. Please see our [supported regions matrix](flexri-regions.md) for more details.



