# Write a Python script that calculates each
# student's average score using the below dictionary
# as the source of the input data:
data = {"Tom": {"tests": {"2021-02-01": 89, "2021-02-17": 76, "2021-03-20": 98, "2021-04-12": 100, "2021-05-04": 87}}, "Sally": {"tests": {"2021-02-01": 87, "2021-02-17": 94,
                                                                                                                                           "2021-03-20": 98, "2021-04-12": 78, "2021-05-04": 84}}, "Grace": {"tests": {"2021-02-01": 97, "2021-02-17": 88, "2021-03-20": 98, "2021-04-12": 82, "2021-05-04": 83}}}
for key in data:
    for entry, item in data[key].items():
        print(key, sum(item.values()) / len(item.keys()))
