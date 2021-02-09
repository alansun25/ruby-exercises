def bubble_sort(arr)
    (arr.length).times do
        for i in 0..(arr.length - 2)
            if arr[i] > arr[i + 1]
                temp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = temp
            end
        end
    end

    arr
end

# Tests
p bubble_sort([4,3,78,2,0,2])
p bubble_sort([1,2,3,4])
p bubble_sort([8,7,6,5])
p bubble_sort([7,5,2,6,4,2,6,4])