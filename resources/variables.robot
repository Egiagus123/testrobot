*** Variables ***
# ${HOST}                   icinga2.opusb.id
${HOST}                   dev.opusb.id
#${HOST}                   10.71.5.51
#${HOST}                   192.168.8.113
# ${LOGIN_URL}              https://bhp.opusb.id/webui/
# ${LOGIN_URL}             http://10.71.5.18:8082/webui/
# ${LOGIN_URL}              http://robot.opusb.id/webui/
# ${LOGIN_URL}                 https://bhp2.opusb.id/webui/
# ${LOGIN_URL}                 https://dev.opusb.id/dev/
# ${LOGIN_URL}              https://icinga2.opusb.id/webui/

#
${LOGIN_URL}              https://${HOST}/webui/
#${LOGIN_URL}              https://${HOST}/dev/
#${LOGIN_URL}              http://${HOST}:8082/webui/
# ${LOGIN_URL}              https://bhp.opusb.id/webui/
#
#
${BROWSER}		          Chrome
#${BROWSER}		          HeadlessChrome
#${DELAY}                  0.08
${DELAY}                  0.10
# &{SUPERUSER}              USERNAME=superusr             PASSWORD=SysAdmin
# &{ADMIN}                  USERNAME=Egi      PASSWORD=Alivtampan100%
&{ADMIN}                  USERNAME=Egi      PASSWORD=@Juni2019
&{SUPERVISOR}             USERNAME=automation_supervisor      PASSWORD=111
&{MANAGER}                USERNAME=automation_manager      PASSWORD=111
# &{ADMIN}                  USERNAME=SuperUser     PASSWORD=SysAdmin
&{LOGIN_INFO}             CLIENT=Test Framework         ROLE=Test Framework Admin    ORGANIZATION=Test Framework    WAREHOUSE=WH DEMO / BACKUP
# &{LOGIN_INFO}             CLIENT=OpusB Solution Technology         ROLE=OpusB Solution Technology Admin    ORGANIZATION=Head Quarters    WAREHOUSE=JAKARTA
${LOGLEVEL}               INFO
@{LOGCONSOLE}             ERROR                         WARNING                      INFO                           DEBUG
${DATA}                   data
${DATA_DIR}               ${CURDIR}${/}..${/}${DATA}
${DECIMAL_SEPARATOR}      .
${THOUSANDS_SEPARATOR}    ,
