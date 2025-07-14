# Automation_camp

## How to run

```
cd testcases
robot -i ${tag} -d results  ${tc_name}
robot -e ${tag} -d results  ${tc_name}
robot -i ${tag} -d results -v ENV:${env} ${tc_name}

for assignment_web
robot -v env:uat -v lang:en -d results assignment_web.robot

for assignment_api
#need to install java before running
#checking command : java --version
cd API_Automation
java -jar doppio_api.jar
robot -d results assignment_api.robot

pabot --testlevelsplit ${tc_name}
pabot --processes ${number} ${tc_name}

```
