FROM sflyr/sqlplus

MAINTAINER hettling

# Add SQL query script
ADD query.sql /

# Add script to run SQL query 
ADD run.sh /

# Add script to set environment variables
ADD set-env.sh /
	
# Environment variables: User, password and database server
ENV USER ""
ENV PASS ""
ENV SERVER ""

CMD sh /set-env.sh && sh /run.sh
