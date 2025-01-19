# (1)  =>  [[1]]
#
# (2) => [ [1,0],
#          [0,1] ]
#
#        [ [1,0,0,0,0],
#          [0,1,0,0,0],
# (5) =>   [0,0,1,0,0],
#          [0,0,0,1,0],
#          [0,0,0,0,1] ]

arr = [[1 if i == j else 0 for i in range(3)] for j in range(3)]
print(arr)



# def get_matrix(n):
#     # arr = []
#     # for i in range(n):
#     #     for j in range(n):
#     #         arr[i][j] = 0
#     #
#     # return arr

# print(get_matrix(3))