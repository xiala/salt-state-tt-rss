{% import "tt-rss/vars.sls" as ttrss with context %}

include:
  - tt-rss.base

"{{ ttrss.base }}/contrib":
  git.latest:
    - name: "git@git.xiala.net:xiala-forks/tt-rss-contrib.git"
    - target: "{{ ttrss.base }}/contrib"

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
