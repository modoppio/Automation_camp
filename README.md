# Automation_camp

## How to run

```
cd testcases
robot -i ${tag} -d results  ${tc_name}
robot -e ${tag} -d results  ${tc_name}
robot -i ${tag} -d results -v ENV:${env} ${tc_name}
robot -v env:uat -v lang:en -d results assignment_web.robot

pabot --testlevelsplit ${tc_name}
pabot --processes ${number} ${tc_name}

```
