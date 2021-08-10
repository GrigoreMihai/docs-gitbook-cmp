---
description: >-
  This page describes how to create, manage, and use Organizations within the
  CMP to segment your data and provide greater focus to your users.
---

# Manage Organizations

## Overview‌ <a id="overview"></a>

Organizations are a feature within the DoiT CMP which allows users to create isolated segments of their data. Over time this feature will empower customers to centrally manage their public cloud while decentralizing the management of each section. These segments are defined using attributions allowing for very flexible and dynamic control.‌

Today CMP supports Role based access control \(RBAC\) functionality that enables application admins to limit the permissions of some users within a team. Organizations are a step beyond this allowing customers to represent their organizational structure, business units, and other groupings within the CMP.‌

Organizations are used to provide a tightly scoped Cloud Analytics experience for a sub-set of your users. By creating an organization, you can help focus its members by automatically scoping all reports to only the attributions used to create it. For instance, if you have a department or group that operates independently within your company \(an acquisition, or R&D initiative\), you can use organizations to provide a focused experience within the CMP. By removing the noise of total company spend, insights and trends can be brought into focus faster and with less effort.‌

## How to Setup Organizations <a id="how-to-setup-organizations"></a>

‌Organizations use attributions to control what data is included.‌

### Step 1. Configure Attributions.‌ <a id="step-1-configure-attributions"></a>

Navigate to Cloud Analytics → Attributions

![Cloud Analytics - Attributions tab](https://lh5.googleusercontent.com/CuLRqLzE2QHApJfQQE3SWTalDbciarx_NxD5YG3aWtzOInscWSe_UqswSAq-hrmVMJgJyjA_thbD1x5Mj1zOs2gQCPEYWcHDny0kTxB-BICCVCY1PSuUVcyGFpOcpSdkrMS7s1fg)

If you already have an attribution configured, select it and confirm that it matches the set of data you would like to use as an organization.‌

​[Please click here to learn more about attributions](https://help.doit-intl.com/cloud-analytics/attributing-cloud-spend#creating-an-attribution)‌

### Step 2. Create an Organization‌ <a id="step-2-create-an-organization"></a>

Navigate to the Users and Roles menu and select the ‘Organizations’ Menu

![Identity &amp; Access Tabs](https://lh5.googleusercontent.com/A23RKCjEGjtOySAWXGUT9q67YMHFK50W2J3_7qcQmWtzZCWENlbENc7dWH9J9J81DrWBIwJ-n7KRxU_XnrM4uVmUYMLexS1GXbYWkr9HoYaDHuF3_H5d2SjEmTSRCgIiQ2skfpf0)

Select ‘New Organization’![](https://lh5.googleusercontent.com/A9a_5brRrvimNNpj6x_0vvHV-E1W3AmYfdz3D2hIKr-pnle5Igd1D9wu5syJO-QUgBjs2erU8mH0aG2IWaYtmtI73V1SwWQiUuD6tkLgnhgWJFumYQnlcXiRbW54ob31O1KlrezG)‌

### Step 3. Configure your Organization <a id="step-3-configure-your-organization"></a>

![Organization Configuration](https://lh5.googleusercontent.com/4JFPldWrHQmagJYqzrtfClY4qTwlz5M_C8Ij-N68gppm_sBjwvbqRRKF_UOU6Th25WzyToRLAxG9ncwdPqYLFQES788PqZFW3OxtACgdpW9B7m80on_gCNQj1sCCEUcJV6tTCoS-)

_‌_Select the attribution or set of attributions that define your organization.

1. Select the Attributions you want to use to scope this organization
2. Select the users that will be members of the organization
   1. **Note:** A user can only be a member of a single organization.
3. Select your options for Dashboard Visibility
4. \[Optional\] Advanced Option
   1. Disable Custom Dashboards -
      1. Use this option if you do not want any data exposure via dashboard widgets. When checked it will remove the ability for users within an organization to customize dashboards and add widgets.

{% hint style="info" %}
**A note about Dashboards and Widgets**

The preset dashboards in CMP \(Account, AWS FinOps, BigQuery FinOps, and Pulse\) have a global scope. Regardless of organization, they always show data from across all configured accounts/projects. If you do not want organization members to see data outside their scope, you can prevent them from seeing these dashboards‌
{% endhint %}

#### Widgets function differently‌ <a id="widgets-function-differently"></a>

For each widget there are two concerns‌

1. Do you have access to the widget?
   1. Roles in the CMP control what widgets you are able to access.
   2. For instance: the Support Viewer Role provides access to the support tickets graph widget in the Account Dashboard
2. Is the widget scoped to my organization?
   1. Currently most widgets have global scope. The only way to limit access to them is to “Disable Custom Dashboards” in the advanced configuration menu.

### ‌Current Limitations

1. Only the Cloud Analytics feature supports Organizations today
   1. If other roles are granted to users within the organization, they will see all company data
   2. Savings features like FlexSave are reflective of the total company spend
   3. Anomalies run against all company data, not only an organization
2. Reports shared from outside the organization cannot be seen within the organization
3. Dashboards and Widgets reflect a global scope, they can be made visible, but the data represented is not filtered to the organization
4. Budgets are available only to users with Budgets Manager Permissions

