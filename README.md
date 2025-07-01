# Automation_camp

## How to run

```
cd testcases
robot -i ${tag} -d results  ${tc_name}
robot -e ${tag} -d results  ${tc_name}
robot -i ${tag} -d results -v ENV:${env} ${tc_name}

pabot --testlevelsplit ${tc_name}
pabot --processes ${number} ${tc_name}

```
