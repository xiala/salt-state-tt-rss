{% import "tt-rss/vars.sls" as ttrss with context %}

{% set name="auth_imap" %}
{% include "tt-rss/plugins/contrib_base.sls" with context %}



