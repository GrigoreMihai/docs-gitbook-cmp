---
description: >-
  This page describes how to create, manage, and use Organizations within the
  CMP to segment your data and provide greater focus to your users.
---

# Manage Organizations

## Overview<a href="overview" id="overview"></a>

Organizations are a feature within the DoiT CMP which allows users to create isolated segments of their data. Over time this feature will empower customers to centrally manage their public cloud while decentralizing the management of each section. These segments are defined using attributions allowing for very flexible and dynamic control.

Today CMP supports Role based access control (RBAC) functionality that enables application admins to limit the permissions of some users within a team. Organizations are a step beyond this allowing customers to represent their organizational structure, business units, and other groupings within the CMP.

Organizations are used to provide a tightly scoped Cloud Analytics experience for a sub-set of your users. By creating an organization, you can help focus its members by automatically scoping all reports to only the attributions used to create it. For instance, if you have a department or group that operates independently within your company (an acquisition, or R\&D initiative), you can use organizations to provide a focused experience within the CMP. By removing the noise of total company spend, insights and trends can be brought into focus faster and with less effort.

{% hint style="info" %}
Required permission to create and manage Organizations: **User Manager**
{% endhint %}

## Terminology <a href="how-to-setup-organizations" id="how-to-setup-organizations"></a>

### Organization

An organization is an automatic set of [attributions](../cloud-analytics/attributing-cloud-spend.md) that filter data for its members. When a user is a member of an organization all reports in Cloud Analytics are automatically filtered to show only relevant data

### Root organization (the default organization)

Every company has a default organization named after their primary domain. This organization, by default, sees all data within a company. It can be restricted by attribution by editing it. When an organization with members is deleted, its users are placed in the default organization rather than being given full access to the company. This allows you the ability to configure a restricted landing zone for users when deleting existing organizations.

### Member

When a user is assigned to an organization, they are said to be a member of that organization. Once a member, they will see only data included in the configured attributions while in Cloud Analytics or Dashboards ([with the exception of Global Dashboards](manage-organizations.md))

## How to setup organizations<a href="how-to-setup-organizations" id="how-to-setup-organizations"></a>

Organizations use attributions to control what data is included.

### Step 1. Configure attributions<a href="step-1-configure-attributions" id="step-1-configure-attributions"></a>

Select _Analytics_ from the top menu bar, then _Attributions_:

![A screenshot showing the Attributions tab](../.gitbook/assets/cmp-attributions-screen.png)

If you already have an attribution configured, select it and confirm that it matches the set of data you would like to use as an organization.

{% hint style="info" %}

[Learn more about attributions](../cloud-analytics/attributing-cloud-spend.md)

{% endhint %}

### Step 2. Create an organization <a href="step-2-create-an-organization" id="step-2-create-an-organization"></a>

Select the _Settings_ icon (a gear) from the top menu bar, then _Identity and access_:

![A screenshot showing the _Identity and access_ screen](../.gitbook/assets/cmp-iam-screen.png)

From this screen, select _Organizations_ from the left-hand menu:

![A screenshot showing the Organizations menu](../.gitbook/assets/cmp-iam-org-screen.png)

On this screen, select the _NEW ORGANIZATION_ button.

### Step 3. Configure your organization <a href="step-3-configure-your-organization" id="step-3-configure-your-organization"></a>

![A screenshot showing the organization configuration screen](../.gitbook/assets/cmp-new-organization-screen.png)

Select the attribution or set of attributions that define your organization.

1. Select the Attributions you want to use to scope this organization
2. Select the users that will be members of the organization
   1. **Note:** A user can only be a member of a single organization.
3. Select your options for Dashboard Visibility
4. \[Optional] Advanced Option
   1. Disable Custom Dashboards -
      1. Use this option if you do not want any data exposure via dashboard widgets. When checked it will remove the ability for users within an organization to customize dashboards and add widgets.

{% hint style="info" %}

**A note about Dashboards and Widgets**

The preset dashboards in CMP (Account, AWS FinOps, BigQuery Lens, and Pulse) have a global scope. Regardless of organization, they always show data from across all configured accounts/projects. If you do not want organization members to see data outside their scope, you can prevent them from seeing these dashboards.

{% endhint %}

## Widgets function differently<a href="widgets-function-differently" id="widgets-function-differently"></a>

For each widget there are two concerns

1. Do you have access to the widget?
   1. Roles in the CMP control what widgets you are able to access.
   2. For instance: the Support Viewer Role provides access to the support tickets graph widget in the Account Dashboard
2. Is the widget scoped to my organization?
   1. Currently most widgets have global scope. The only way to limit access to them is to "Disable Custom Dashboards" in the advanced configuration menu.

## Current Limitations

1. Only the Cloud Analytics feature supports Organizations today
   1. If other roles are granted to users within the organization, they will see all company data
   2. Savings features like [FlexSave](../flexsave-aws/overview.md) are reflective of the total company spend
   3. Anomalies run against all company data, not only an organization
2. Reports shared from outside the organization cannot be seen within the organization
3. Dashboards and Widgets reflect a global scope, they can be made visible, but the data represented is not filtered to the organization
4. Budgets are available only to users with Budgets Manager Permissions
