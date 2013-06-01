
{% set ttrss = pillar.get("ttrss", {}) -%}
{% set ttrss_base = ttrss.get("base", "/srv/tt-rss") -%}
{% set ttrss_app = ttrss.get("app", ttrss_base + "/www") -%}
{% set ttrss_cache = ttrss.get("cache", ttrss_base + "/data") -%}
{% set ttrss_lock = ttrss.get('lock', ttrss_base + "/lock") -%}
{% set ttrss_user = ttrss.get('user', 'ttrss') -%}
{% set ttrss_group = ttrss.get('group', 'ttrss') -%}
{% set ttrss_db = ttrss.get('db', {}) -%}
{% set ttrss_db_user = ttrss_db.get('user', 'ttrss') -%}
{% set ttrss_db_pass = ttrss_db.get('pass', None) -%}
{% set ttrss_db_db = ttrss_db.get('db', 'ttrss') -%}
# for debug varset
# ttrss
#   base = {{ ttrss_base }}
#   app = {{ ttrss_app }}
#   cache = {{ ttrss_cache }}
#   lock = {{ ttrss_lock }}
#   user = {{ ttrss_user }}
#   group = {{ ttrss_group }}
#   db
#     user = {{ ttrss_db_user }}
#     pass = {{ ttrss_db_pass }}
#     db = {{ ttrss_db_db }}
