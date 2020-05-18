# faire un programme qui prend une liste de données financières, et la traite de la façon suivante:
# 1 - obtenir les rendements (différence en pourcentages entre deux résultats quotidiens)
# 2 - assigner une note à chaque rendement
# 3 - pour chaque note assignée, composer la str qui sera shippée à csound

import pandas

# read_csv
data = pandas.read_csv('vix_daily_jan05_jan10.txt')
print(data.head())

# obtenir les rendements en pourcentage
data_pct = data.pct_change()
print(data_pct.head())

data['pct'] = data_pct

print(data.head())

# assigner une note
# pour chaque note assignée, composer la str qui sera shippée à csound
start_time = 0.0
duration = 2.00
print("start of data sonification!")
for index, row in data.iterrows():
    pp = 'i1  ' + str(start_time) +'   '+ str(duration)+ '    ' +str(1000.00*abs(row['pct'])) + '     ' + str(row['price'])
    print(pp)
    start_time = start_time + duration


    


