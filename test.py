def count_evens(numbers):
    count = 0
    for number in numbers:
        if number % 2 == 0:
            count += 1
        else:
            continue
    return count

# 例
nums = [1, 2, 3, 4, 5, 6, 7, 8, 9]
result = count_evens(nums)
print("Number of even numbers:", result)
