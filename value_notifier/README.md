## 🔍🤔 What i learned from this project?

- RESUMÃO

O ValueNotifier Pattern consiste no uso dos pacotes nativos do Flutter
para implementar o Padrão de Projeto State no Flutter. Este 
Ggerenciador de Estados consiste em estruturar o projeto em quatro pastas:

Dado um Product de um projeto:

**Model:**
Pasta que possui os atributos e métodos relativos ao produto. Além dos encodamentos para Json, caso utilize essa estrutura de bd.

**Services:**
Camada que comunica-se com o Banco ou API externa.
```Future<List<ProductModel>> fetchProducts() async```

**States:**
Camada que possui todos os Estados de Product. As classes aqui **ESTEDEM** ValueNotifier, o que permite utilizar os métodos notifyListerners() sem a necessidade de chamar o método diretamente, além de que esta herança permite manipular um **"value" herdado**.
Exemplo de Estados para um Product Model:
```
abstract class ProductState {}

class InitialProductState extends ProductState {}

class SuccessProductState extends ProductState {
  final List<ProductModel> products;

  SuccessProductState(this.products);
}

class LoadingProductState extends ProductState {}

class ErrorProductState extends ProductState {
  final String message;

  ErrorProductState(this.message);
}
```
**Stores:**
Esta pasta é a intermediária entre o Serviço e os Estados. Observe como os estados são alterádos em função das respostas de .fetchProducts (do Service):
```
  Future fetchProducts() async {
    value = LoadingProductState();
    await Future.delayed(const Duration(seconds: 3));
    try {
      final products = await service.fetchProducts();
      value = SuccessProductState(products);
    } catch (e) {
      value = ErrorProductState(e.toString());
    }
  }
```

- **Dartion:** Servidor RESTful feito em Dart para testes simples.
- **Testes de Widget e Requisições:** É possível realizar testes facilmente desde que mocke devidamente, como:
```
  final service = ProductServiceMock();
  final store = ProductStore(service);  
```

## 📚 Content flashcards questions checklist:
- [x] Q1
- [ ] Q2
- [ ] Q3
- [ ] Q4
- [ ] Q5

Expand All
@@ -21,9 +89,9 @@
```

## 📝 English flashcards checklist:
- [x] W1
- [ ] W2
- [ ] W3
- [ ] W4
- [ ] W5