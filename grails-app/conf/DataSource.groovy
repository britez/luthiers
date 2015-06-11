dataSource {
    pooled = true
    jmxExport = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
//    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
    flush.mode = 'manual' // OSIV session flush mode outside of transactional context
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
			driverClassName = "org.postgresql.Driver"
			dialect = org.hibernate.dialect.PostgreSQLDialect
			url = "jdbc:postgresql://ec2-174-129-26-115.compute-1.amazonaws.com:5432/d6hu5rm0h833ro"
			username = "wjirgzkjhgbpev"
			password = "vNvzwQulmvZ7o5I3kzcb-fh1lQ"
        }
    }
    test {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
			driverClassName = "org.postgresql.Driver"
			dialect = org.hibernate.dialect.PostgreSQLDialect
			url = "jdbc:postgresql://ec2-174-129-26-115.compute-1.amazonaws.com:5432/d6hu5rm0h833ro"
			username = "wjirgzkjhgbpev"
			password = "vNvzwQulmvZ7o5I3kzcb-fh1lQ"
        }
    }
    production {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
			driverClassName = "org.postgresql.Driver"
			dialect = org.hibernate.dialect.PostgreSQLDialect
			url = "jdbc:postgresql://ec2-174-129-26-115.compute-1.amazonaws.com:5432/d6hu5rm0h833ro"
			username = "wjirgzkjhgbpev"
			password = "vNvzwQulmvZ7o5I3kzcb-fh1lQ"
        }
    }
}
