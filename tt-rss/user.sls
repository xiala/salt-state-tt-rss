{% import "tt-rss/vars.sls" as ttrss with context %}

"ttuser":
  user.present:
    - name: '{{ ttrss.user }}'
    - home: '{{ ttrss.base }}'
    - system: True

"ttgroup":
  group.present:
    - name: '{{ ttrss.group }}'
    - system: True

# for debug varset
# ttrss
#   base = {{ ttrss.base }}
#   app = {{ ttrss.app }}
#   cache = {{ ttrss.cache }}
#   lock = {{ ttrss.lock }}
#   user = {{ ttrss.user }}
#   group = {{ ttrss.group }}
#   db
#     user = {{ ttrss.db_user }}
#     pass = {{ ttrss.db_pass }}
#     db = {{ ttrss.db_db }}
