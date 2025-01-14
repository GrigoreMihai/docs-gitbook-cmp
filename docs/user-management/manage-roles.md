---
description: >-
  User Roles allow you to group sets of permissions and assign them to the users
  in your organization.
---

# Manage Roles

If you don't want to give a user full access to the Cloud Management Platform, you can let them perform only a subset of tasks by assigning a role. Roles make it easy to assign multiple permissions and manage users more efficiently in your organization.

{% hint style="info" %}
Required permission to manage and assign roles: **User Manager**
{% endhint %}

{% hint style="warning" %}
Prior to Roles, CMP users were manually assigned permissions. These legacy permissions are forward-compatible, so you will not lose access to any functionalities you previously had access to.
{% endhint %}

## Pre-built roles

There are a few pre-built roles in your account for your convenience. The easiest way to give user privileges is to assign pre-built roles. Each role grants one or more privileges that together, allow performing a common business function. For example, one role allows managing user accounts, another role manages financial aspects, another role manages IT functions, and so on.

### Basic Role

| Privileges | Only users with privilege can:                            |
| ---------- | --------------------------------------------------------- |
| Support    | create new and access existing technical support requests |

### IT Manager

| Privileges     | Only users with privilege can:                            |
| -------------- | --------------------------------------------------------- |
| Support        | Create new and access existing technical support requests |
| Issues Viewer  | Access to cloud outage information                        |
| Assets Manager | View and manage assets (including managing licenses)      |

### Finance User

| Privileges             | Only users with privilege can:                                                                    |
| ---------------------- | ------------------------------------------------------------------------------------------------- |
| Support                | create new and access existing technical support requests                                         |
| Billing Profiles Admin | create new and manage existing billing profiles, including payment method                         |
| Invoice Viewer         | access invoices                                                                                   |
| Cloud Analytics        | create new and access existing [Cloud Analytics Reports](../cloud-analytics/create-cloud-report/) |
| Contracts Viewer       | provides access to the commercial contracts                                                       |
| Perks Viewer           | access and request Perks                                                                          |
| Anomalies Viewer       | access Cost and Usage Anomalies                                                                   |

### Standard User

| Privileges           | Only users with privilege can:                                                                    |
| -------------------- | ------------------------------------------------------------------------------------------------- |
| Support              | create new and access existing technical support requests                                         |
| Cloud Analytics      | create new and access existing [Cloud Analytics Reports](../cloud-analytics/create-cloud-report/) |
| Sandbox User         | create disposable cloud environments (sandboxes) according to company policy                      |
| superQuery           | unlimited access to the superQuery IDE                                                            |
| Contracts Viewer     | provides access to the commercial contracts                                                       |
| Perks Viewer         | access and request Perks                                                                          |
| Anomalies Viewer     | access Cost and Usage Anomalies                                                                   |
| Issues Viewer        | access to cloud outage information                                                                |
| Budgets Manager      | create, delete and manage budgets                                                                 |
| Attributions Manager | create, delete and manage attributions                                                            |

### Power User

| Privileges           | Only users with privilege can:                                                                                                                      |
| -------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| Support              | create new and access existing technical support requests                                                                                           |
| Cloud Analytics      | create new and access existing [Cloud Analytics Reports](../cloud-analytics/create-cloud-report/)                                                   |
| Sandbox User         | [create disposable cloud environments](../cloud-sandbox-management/create-gcp-sandbox-accounts.md) (sandboxes) governed by a company Sandbox policy |
| superQuery           | access superQuery IDE                                                                                                                               |
| Sandbox Admin        | set company [Sandbox policy](../cloud-sandbox-management/configuring-a-policy-for-sandbox-accounts.md) for other users                              |
| FlexRI Admin         | purchase and manage [flexible reservations](../flexsave-aws/overview.md)                                                                            |
| Settings Manager     | manage your Cloud Management Platform account settings                                                                                              |
| Contracts Viewer     | provides access to the commercial contracts                                                                                                         |
| Perks Viewer         | access and request Perks                                                                                                                            |
| Anomalies Viewer     | access Cost and Usage Anomalies                                                                                                                     |
| Issues Viewer        | access to cloud outage information                                                                                                                  |
| Budgets Manager      | create, delete and manage budgets                                                                                                                   |
| Attributions Manager | create, delete and manage attributions                                                                                                              |

### Admin

Has access to all features in the Cloud Management Platform and the CMP API, and can manage every aspect of your organization's account.

## Summary: Pre-built Roles and Permissions

|                       |           |                                                             |                                                           |                                                           |                                                              |                                                                |
| --------------------- | :-------: | :---------------------------------------------------------: | :-------------------------------------------------------: | :-------------------------------------------------------: | :----------------------------------------------------------: | :------------------------------------------------------------: |
| Permissions           | **Admin** | <p><strong>Finance</strong></p><p><strong>User</strong></p> | <p><strong>IT</strong></p><p><strong>Manager</strong></p> | <p><strong>Power</strong></p><p><strong>User</strong></p> | <p><strong>Standard</strong></p><p><strong>User</strong></p> | <p><strong>superQuery</strong></p><p><strong>User</strong></p> |
| Anomalies Viewer      |   **✓**   |                            **✓**                            |                           **✓**                           |                           **✓**                           |                                                              |                                                                |
| Assets Manager        |   **✓**   |                                                             |                           **✓**                           |                                                           |                                                              |                                                                |
| Attributions Manager  |   **✓**   |                                                             |                                                           |                           **✓**                           |                             **✓**                            |                                                                |
| Billing Profile Admin |   **✓**   |                            **✓**                            |                                                           |                                                           |                                                              |                                                                |
| Budgets Manager       |   **✓**   |                                                             |                                                           |                           **✓**                           |                             **✓**                            |                                                                |
| Cloud Analytics       |   **✓**   |                            **✓**                            |                                                           |                           **✓**                           |                             **✓**                            |                                                                |
| Contracts Viewer      |   **✓**   |                            **✓**                            |                                                           |                           **✓**                           |                             **✓**                            |                                                                |
| Flexible RI Admin     |   **✓**   |                                                             |                                                           |                           **✓**                           |                                                              |                                                                |
| Invoice Viewer        |   **✓**   |                            **✓**                            |                                                           |                                                           |                                                              |                                                                |
| Issues Viewer         |   **✓**   |                            **✓**                            |                           **✓**                           |                           **✓**                           |                             **✓**                            |                              **✓**                             |
| Settings Manager      |   **✓**   |                                                             |                                                           |                           **✓**                           |                                                              |                                                                |
| Sandbox Admin         |   **✓**   |                                                             |                                                           |                           **✓**                           |                                                              |                                                                |
| Sandbox User          |   **✓**   |                                                             |                                                           |                           **✓**                           |                             **✓**                            |                                                                |
| Spot0                 |   **✓**   |                                                             |                                                           |                           **✓**                           |                                                              |                                                                |
| Support Requester     |   **✓**   |                            **✓**                            |                           **✓**                           |                           **✓**                           |                             **✓**                            |                              **✓**                             |
| Users Manager         |   **✓**   |                                                             |                                                           |                           **✓**                           |                                                              |                                                                |
| superQuery            |   **✓**   |                                                             |                                                           |                           **✓**                           |                             **✓**                            |                              **✓**                             |

## Custom Roles

If one of the built-in roles doesn't work for you, you can create a custom role with your own set of permissions. To create a custom user role, select the _Settings_ icon (a gear) from the top menu bar, then select _Identity and access_.

![A screenshot of the _Identity and access_ screen](../.gitbook/assets/cmp-iam-screen.png)

From there, select _Roles_ from the left-hand menu:

![A screenshot showing the _Roles_ screen_](../.gitbook/assets/cmp-roles.png)

You will see a list of preset roles as well as any other custom roles created by your team.

Create a new role by selecting the _NEW_ button in the top right-hand of the
screen. Doing this will take you to the _New role_ screen, with a [list of
permissions](user-permissions-explained.md) available for you to group into the new role:

![A screenshot showing the _New role_ screen_](../.gitbook/assets/cmp-permissions.png)

To get started:

1. Give your new User Role a good name.
2. _**Optional:**_ Give the role a description to give additional context around who the role is for.
3. Select the permissions you'd like the role to contain.

### Deleting a custom role

To delete the custom role, you will need to make sure there are no users configured with this role. You cannot delete a role until this condition is satisfied.

Select the role you'd like to delete and click the "Remove" button. You will need to confirm your action and the role will be removed.

{% hint style="info" %}
You can't remove built-in roles.
{% endhint %}

## Setting a default role

A default role is the role a new user on your team is auto-provisioned, until a role is explicitly set by an admin. Both pre-built and custom roles can be designated as a default role.

To set a role as the default role for your team, select the role, then select the _MAKE DEFAULT_ button in the top right-hand corner of the screen.
