def create_dgim_buckets(data, window_size):
    # Limit the data to the window size
    data = data[-window_size:]
    result = []
    power = 0

    while data:
        # Skip trailing zeros
        data = data.rstrip('0')
        if not data:
            break

        count = 0
        bucket_string = ""

        # Create a bucket by counting up to 2^power '1's
        for i in range(len(data)-1, -1, -1):
            bucket_string = data[i] + bucket_string
            if data[i] == "1":
                count += 1
            if count == 2 ** power:
                result.append((bucket_string, 2 ** power))
                data = data[:i]  # Remove the processed part
                break
        else:
            result.append((bucket_string, 2 ** power))
            break

        power += 1

    # Display the result
    print("Buckets:")
    for bucket in result:
        print(f"{bucket[0]} (size: {bucket[1]})")

    # Visual Representation
    if result:
        print("\nVisual Representation:")
        print("... ", end="")
        for bucket in result:
            print(f"{bucket[0]} ", end="")
        print("...")
        print(" ", end="")
        for bucket in result:
            size_str = f"2^{int(bucket[1]).bit_length() - 1} ({bucket[1]})"
            print(f"{size_str:>{len(bucket[0])}}", end=" ")
        print()
    else:
        print("No buckets created.")
    
    return result


# User input
data = input("Enter the binary data string: ")
window_size = int(input("Enter the window size: "))

# Validate input
if not all(c in '01' for c in data) or window_size <= 0:
    print("Invalid input. Please ensure the data string contains only binary digits and the window size is a positive integer.")
else:
    create_dgim_buckets(data, window_size)
