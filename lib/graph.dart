import 'dart:collection';

class Graph {
  Map<int, List<int>> listaDeAdjacencia;

  Graph(this.listaDeAdjacencia);

  Graph.empty() : listaDeAdjacencia = {};

  Graph.fromJson(Map<String, dynamic> json)
      : listaDeAdjacencia = json.map(
          (key, value) => MapEntry(
            int.parse(key.toString()),
            List<int>.from(value),
          ),
        );

  void imprimirGrafo() {
    listaDeAdjacencia.forEach((key, value) {
      print('$key -> ${value.join(", ")}');
    });
  }

  void bfs(Map<int, List<int>> graph, int startNode) {
    List<int> visited = [];
    List<int> queue = [];

    // Marcar o nó inicial como visitado e adicioná-lo à fila
    visited.add(startNode);
    queue.add(startNode);

    while (queue.isNotEmpty) {
      // Remover o primeiro nó da fila
      int currentNode = queue.removeAt(0);
      print('$currentNode ');

      // Adicionar todos os vizinhos não visitados à fila
      for (var neighbor in graph[currentNode] ?? []) {
        if (!visited.contains(neighbor)) {
          visited.add(neighbor);
          queue.add(neighbor);
        }
      }
    }
  }

  void dfs(Map<int, List<int>> graph, int startNode) {
    List<int> visited = [];
    ListQueue<int> stack = ListQueue();

    visited.add(startNode);
    stack.addLast(startNode);

    while (stack.isNotEmpty) {
      int s = stack.removeLast();
      print('$s ');

      for (var n in graph[s]!.reversed) {
        if (!visited.contains(n)) {
          visited.add(n);
          stack.addLast(n);
        }
      }
    }
  }

  
}
