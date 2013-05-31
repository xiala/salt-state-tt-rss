"/srv/tt-rss-contrib":
  git.latest:
    - name: "git@git.xiala.net:xiala-forks/tt-rss-contrib.git"

extends:
  file:
    "/etc/tt-rss/config.php":
      - auth_imap: False
      - auth_ldap: False
      - auth_radius: False
      - digest: False
      - flattr: False
      - googleplus: False
      - identica: False
      - modile: False
      - owncloud: False
      - pintrest: False
      - pocket: False
      - tweet: False

