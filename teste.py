def dfs(graph, node):
    visited = []
    stack = deque()

    visited.append(node)
    stack.append(node)

    while stack:
        s = stack.pop()
        print(s, end = " ")

        for n in reversed(graph[s]):
            if n not in visited:
                visited.append(n)
                stack.append(n)

graph = {
    1: [2, 3],
    2: [1, 4, 5],
    3: [1, 6],
    4: [2],
    5: [2],
    6: [3],
}