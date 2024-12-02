import 'dart:collection';

class GraphTeste {
  Map<int, List<int>> listaDeAdjacencia;

  GraphTeste(this.listaDeAdjacencia);

  GraphTeste.empty() : listaDeAdjacencia = {};

  GraphTeste.fromJson(Map<String, dynamic> json)
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

  void bfs(int startNode) {
    List<int> visited = [];
    List<int> queue = [];

    visited.add(startNode);
    queue.add(startNode);

    while (queue.isNotEmpty) {
      int currentNode = queue.removeAt(0);
      print('$currentNode ');

      for (var neighbor in listaDeAdjacencia[currentNode] ?? []) {
        if (!visited.contains(neighbor)) {
          visited.add(neighbor);
          queue.add(neighbor);
        }
      }
    }
  }

  void dfs(int startNode) {
    List<int> visited = [];
    ListQueue<int> stack = ListQueue();

    visited.add(startNode);
    stack.addLast(startNode);

    while (stack.isNotEmpty) {
      int s = stack.removeLast();
      print('$s ');

      for (var n in listaDeAdjacencia[s]!.reversed) {
        if (!visited.contains(n)) {
          visited.add(n);
          stack.addLast(n);
        }
      }
    }
  }

  List<int?>? bfsMenorCaminho(int origem, int destino) {
    Set<int> visited = {};
    Map<int, int> parent = {};
    Queue<int> queue = Queue();

    visited.add(origem);
    queue.add(origem);
    parent[origem] = -1; // Origem não tem pai

    while (queue.isNotEmpty) {
      int current = queue.removeFirst();

      if (current == destino) {
        List<int?> path = [];
        int? node = destino;
        while (node != -1) {
          path.insert(0, node);
          node = parent[node];
        }
        return path;
      }

      for (var neighbor in listaDeAdjacencia[current] ?? []) {
        if (!visited.contains(neighbor)) {
          visited.add(neighbor);
          parent[neighbor] = current;
          queue.add(neighbor);
        }
      }
    }

    return null; // Se não houver caminho
  }

  int? calculateTTL(int origem, int destino) {
    final shortestPath = bfsMenorCaminho(origem, destino);
    if (shortestPath != null) return shortestPath.length - 1;
    return null;
  }
}
