---
description: Filter on included metrics to provide additional focus in your reports
---

# Understanding Metric Filters

Metric Filters are a feature that allow you to filter the data composing your report at query time. Often when performing analysis it is helpful to hide values below or above certain thresholds in order to add additional focus and remove outliers.

## Add a Metric Filter

You can add a metric filter by selecting the link below the Metric dropdown or via the filter chip:

![A screenshot of the Metric input](../.gitbook/assets/cmp-metric-input.png)

![A screenshot of the search menu](../.gitbook/assets/cmp-search-menu.png)

Selecting this option will allow you to configure your filter based on a set a criterion you select

Select the metric you would like to filter, the operator, and the value.

![Metric Configuration Window](../.gitbook/assets/cmp-metric-configuration-window.png)

{% hint style="info" %}
You can filter on a Metric that is not visible! For instance you can chart **Usage**, but filter any interval with a **Cost < $50**
{% endhint %}

We support a range of operators:

![A screenshot of the Metric filter form](../.gitbook/assets/cmp-metric-filter-form.png)

When applied a filter chip will appear in the metric bar:

![A screenshot of the operators drop-down menu](../.gitbook/assets/cmp-operators-menu.png)

This chip will be blue when applied to the currently shown metric, and white while filtering a metric not currently shown in the report:

![A screenshot of the Metric filter chip](../.gitbook/assets/cmp-metric-filter-chip.png)
