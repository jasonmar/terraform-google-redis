com.google.cloud.broker {
broker {
    bind-address = "${bindaddress}"
    port = 80
    principals = "${principal}"
    keytab = "/etc/tokenbroker/broker.keytab"
    tls {
        enabled = false
        key = "/etc/tokenbroker/broker.pem"
        crt = "/etc/tokenbroker/broker.crt"
    }
    session {
        #ttl = 604800000
        #renew-period = 86400000
        #local-cache-time = 30
    }
    #proxy-user-whitelist = YARN
    #client-secret-path = "/etc/tokenbroker/keyfile.json"
    #scope-whitelist = "https://www.googleapis.com/auth/devstorage.read_write"
}
oauth {
    #callback-uri = "https://localhost/oauth2callback"
    #backend = "default"
    client-id = ""
    client-secret = ""
    #domain = ""
    #test = false
    #ttl = 30
    json {
        #scope = "https://www.googleapis.com/auth/devstorage.read_write"
        #keyfile-dir = ""
    }
}
authorizer {
    #host = "localhost"
    #port = 8080
    #kdc = "127.0.0.1"
    #realm = "EXAMPLE.COM"
    #principal = "HTTP/localhost@EXAMPLE.COM"
    keytab = "/home/broker/authorizer.keytab"
    #krb5ini = "krb5.ini"
    #jaas-conf = "/etc/tokenbroker/jaas.conf"
    #enable-spnego = true
    #spnego-subject-creds = false
}
encryption {
    crypto-key = "mem"
    dek-uri = ""
}
database {
    url = "jdbc:h2:mem:;MODE=PostgreSQL;DATABASE_TO_LOWER=TRUE"
    user = ""
    pass = ""
}
}
