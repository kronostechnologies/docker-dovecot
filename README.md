# Dovecot
A dovecot configured with confd.

## Confd
This image uses a custom confd binary so it can parse properly the underscore. See https://github.com/kelseyhightower/confd/pull/541
Logs are in `/var/log/confd.log`. The confd pid is in `/var/run/confd.pid`.


## Build argument
### DOVECOT_USER_UID
Specify predictable dovecot uid

### DOVECOT_USER_GID
Specify predictable dovecot gid

## Environment variable

### 10-auth.conf
#### AUTH__VALUES
The values for the actual file content. If you want to sepcify `auth_mechanisms` to value `plain`, you would define `AUTH__VALUES__AUTH_MECHANISMS="plain"`.

#### AUTH__INCLUDES
A space separated list of file to include i.e. `AUTH__INCLUDES="auth-sql-.conf.ext auth-ldap.conf.ext"`.


### 10-mail.conf
#### MAIL__VALUES
See `AUTH_VALUES`,

#### MAIL__NAMESPACES
Define a named namespace i.e. `MAIL__NAMESPACES__INBOX__INBOX=yes` would create `namespace inbox { inbox = yes }`.

#### MAIL__NAMESPACE
Define a default namespace i.e. `MAIL__NAMESPACE__INBOX=yes` would create `namespace { inbox = yes }`.

### 10-logging.conf
#### LOGGING__VALUES
See `AUTH__VALUES`.

#### LOGGING__PLUGIN
Define the plugin element i.e. `LOGGING__PLUGIN__MAIL_LOG_EVENTS=delete` would create `plugin { mail_log_events = delete }`.
 
### 10-master
#### MASTER__VALUES
See `AUTH__VALUES`

#### MASTER__SERVICES
Define a service i.e. `MASTER__SERVICES__IMAP-LOGIN__INTER_LISTENER__IMAP__PORT=143` would create `service imap-login { inet_listener imap { port = 143 } }`.

### 10-ssl.conf
#### SSL
Define values of 10-ssl.conf i.e. `SSL__SSL=yes` would create `ssl = yes`.

### 15-mailboxes.conf
#### MAILBOXES__PROTOCOLS
Define protocols i.e. `MAILBOXES__PROTOCOLS__IMAP__MAIL_PLUGINS=$mail_plugins` would create `protocol imap { mail_plugins = $mail_plugins }`.

#### MAILBOXES__PLUGIN
Define plugin i.e. `MAILBOXES__PLUGIN__ZLIB_SAVE_LEVEL=1` would create `plugin { zlib_save_level = 1 }`.

#### MAILBOXES__NAMESPACES
Define namespaces i.e. `MAILBOXES__NAMESPACES__INBOX__VALUES__PREFIX="INBOX"` would create `namespace inbox { prefix = INBOX }`.

#### MAILBOXES__NAMESPACES__###__MAILBOXES__NAME
Define mailboxes inside namespace ### i.e. `MAILBOXES__NAMESPACES__INBOX__MAILBOXES__DRAFTS__NAME="Drafts"` would create `namespace inbox { mailbox Drafts {} }`.

#### MAILBOXES__NAMESPACES__###__MAILBOXES__###__VALUES
See `AUTH__VALUES`.

### 20-imap.conf
#### IMAP__VALUES
See `AUTH__VALUES`.

#### IMAP__PROTOCOLS
See `MAILBOXES__PROTOCOLS`.

### dovecot.conf
#### DOVECOT__VALUES
See `AUTH__VALUES`.
#### DOVECOT__INCLUDES
Space separated file include value
#### DOVECOT__INCLUDES_TRY
Space separated file try include value
