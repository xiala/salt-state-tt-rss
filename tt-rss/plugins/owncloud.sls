{% import "tt-rss/vars.sls" as ttrss with context %}

{% set name="owncloud" %}
{% include "tt-rss/plugins/contrib_base.sls" with context %}
