import 'package:simuladorp2p/graph.dart';
import 'package:simuladorp2p/graph_teste.dart';

void main(List<String> args) {
  final listaDeAdjacencia = {
    1: [2],
    2: [1, 3, 4, 5],
    3: [2],
    4: [2, 9, 10],
    5: [2, 6, 8],
    6: [5, 7],
    7: [6],
    8: [5],
    9: [4],
    10: [4, 11],
    11: [10, 12],
    12: [11, 13],
    13: [12]
  };

  final graph = Graph(listaDeAdjacencia);

  // graph.imprimirGrafo();
  print('----------');
  print('DFS');
  graph.dfs(listaDeAdjacencia, 13);
  print('----------');
  print('BFS');
  graph.bfs(listaDeAdjacencia, 13);

  print('---------------------------------------');

  final graph2 = GraphTeste(listaDeAdjacencia);

  // graph2.imprimirGrafo();
  print('----------');
  print('DFS');
  graph2.dfs(13);
  print('----------');
  print('BFS');
  graph2.bfs(13);

  print('mijo');
  print(graph2.bfsMenorCaminho(1, 1));
  /// TODO: ver a questao do TTL. nao lembro se o no da origem  entra na lista de shortest path
  print(graph2.calculateTTL(1, 13));
}
