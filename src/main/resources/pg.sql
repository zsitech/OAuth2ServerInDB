--建表语句
--oauth_access_token、oauth_client_details、oauth_refresh_token是必须的，其他的表本次没用到
-- Table: oauth2.clientdetails

-- DROP TABLE oauth2.clientdetails;

CREATE TABLE oauth2.clientdetails
(
    appid character varying(256) COLLATE pg_catalog."default" NOT NULL DEFAULT NULL::character varying,
    resourceids character varying(256) COLLATE pg_catalog."default" NOT NULL DEFAULT NULL::character varying,
    appsecret character varying(256) COLLATE pg_catalog."default" NOT NULL DEFAULT NULL::character varying,
    scope character varying(256) COLLATE pg_catalog."default" NOT NULL DEFAULT NULL::character varying,
    granttypes character varying(256) COLLATE pg_catalog."default" NOT NULL DEFAULT NULL::character varying,
    redirecturl character varying(256) COLLATE pg_catalog."default" NOT NULL DEFAULT NULL::character varying,
    authorities character varying(256) COLLATE pg_catalog."default" NOT NULL DEFAULT NULL::character varying,
    access_token_validity integer,
    refresh_token_validity integer,
    additionalinformation character varying(4096) COLLATE pg_catalog."default" NOT NULL DEFAULT NULL::character varying,
    autoapprovescopes character varying(256) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    CONSTRAINT clientdetails_pkey PRIMARY KEY (appid)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE oauth2.clientdetails
    OWNER to auth2;
    
-- Table: oauth2.oauth_access_token

-- DROP TABLE oauth2.oauth_access_token;

CREATE TABLE oauth2.oauth_access_token
(
    token_id character varying(256) COLLATE pg_catalog."default" NOT NULL DEFAULT NULL::character varying,
    token bytea,
    authentication_id character varying(256) COLLATE pg_catalog."default" NOT NULL DEFAULT NULL::character varying,
    user_name character varying(256) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    client_id character varying(256) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    authentication bytea,
    refresh_token character varying(256) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    CONSTRAINT oauth_access_token_pkey PRIMARY KEY (authentication_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE oauth2.oauth_access_token
    OWNER to auth2;
    
-- Table: oauth2.oauth_approvals

-- DROP TABLE oauth2.oauth_approvals;

CREATE TABLE oauth2.oauth_approvals
(
    userid character varying(256) COLLATE pg_catalog."default" NOT NULL DEFAULT NULL::character varying,
    authentication_id character varying(256) COLLATE pg_catalog."default" NOT NULL DEFAULT NULL::character varying,
    clientid character varying(256) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    scope character varying(256) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    status character varying(256) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    expiresat timestamp with time zone,
    lastmodifiedat timestamp with time zone
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE oauth2.oauth_approvals
    OWNER to auth2;
    
-- Table: oauth2.oauth_client_details

-- DROP TABLE oauth2.oauth_client_details;

CREATE TABLE oauth2.oauth_client_details
(
    client_id character varying(256) COLLATE pg_catalog."default" NOT NULL DEFAULT NULL::character varying,
    client_secret character varying(256) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    resource_ids character varying(256) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    scope character varying(256) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    authorized_grant_types character varying(256) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    web_server_redirect_uri character varying(256) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    authorities character varying(256) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    access_token_validity integer,
    refresh_token_validity integer,
    additional_information character varying(256) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    autoapprove character varying(256) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    CONSTRAINT oauth_client_details_pkey PRIMARY KEY (client_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE oauth2.oauth_client_details
    OWNER to auth2;
    
-- Table: oauth2.oauth_client_token

-- DROP TABLE oauth2.oauth_client_token;

CREATE TABLE oauth2.oauth_client_token
(
    token_id character varying(256) COLLATE pg_catalog."default" NOT NULL DEFAULT NULL::character varying,
    token bytea,
    authentication_id character varying(256) COLLATE pg_catalog."default" NOT NULL DEFAULT NULL::character varying,
    user_name character varying(256) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    clientid character varying(256) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    CONSTRAINT oauth_client_token_pkey PRIMARY KEY (authentication_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE oauth2.oauth_client_token
    OWNER to auth2;
    
-- Table: oauth2.oauth_code

-- DROP TABLE oauth2.oauth_code;

CREATE TABLE oauth2.oauth_code
(
    code character varying(256) COLLATE pg_catalog."default" NOT NULL DEFAULT NULL::character varying,
    authentication bytea
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE oauth2.oauth_code
    OWNER to auth2;
    
-- Table: oauth2.oauth_refresh_token

-- DROP TABLE oauth2.oauth_refresh_token;

CREATE TABLE oauth2.oauth_refresh_token
(
    token_id character varying(256) COLLATE pg_catalog."default" NOT NULL DEFAULT NULL::character varying,
    token bytea,
    authentication bytea
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE oauth2.oauth_refresh_token
    OWNER to auth2;
    
    

   