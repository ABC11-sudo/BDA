import hashlib

def hash_value(x, seed=0):
    return int(hashlib.md5((str(x) + str(seed)).encode()).hexdigest(), 16)

def trailing_zeros(n):
    return len(bin(n)) - len(bin(n).rstrip('0'))

def flajolet_martin(data, num_hashes=10):
    max_trailing_zeros = [0] * num_hashes
    for d in data:
        for i in range(num_hashes):
            h_value = hash_value(d, seed=i)
            b_value = bin(h_value)[-3:]
            t_zeros = trailing_zeros(h_value)
            print(f"Element: {d}, Hash Value: {h_value % 8}, Binary Equivalent: {b_value}, Trailing Zeros: {t_zeros}")
            max_trailing_zeros[i] = max(max_trailing_zeros[i], t_zeros)
    avg_max_trailing_zeros = sum(max_trailing_zeros) / num_hashes
    distinct_elements_estimate = 2 ** avg_max_trailing_zeros
    return distinct_elements_estimate

input_data = input("Enter Data: ")
data = list(map(int, input_data.split()))
num_hashes = 2
estimated_count = flajolet_martin(data, num_hashes=num_hashes)
actual_count = len(set(data))

print(f"r: {num_hashes}")
print(f"No of Distinct Elements: {actual_count}")
print(f"Estimated No of Distinct Elements: {estimated_count:.0f}")
