d = {
    "emp1": {"name": "John", "salary":  7500},
    "emp2": {"name": "Emma", "salary":  8000},
    "emp3": {"name": "Brad", "salary":  6500},
}

print(d['emp3'])
print(d['emp3']['salary'])
d['emp3']['salary'] = 8500

for i in d:
    print(i)
    for j in d[i]:
        print("\t", j, ":", d[i][j])
