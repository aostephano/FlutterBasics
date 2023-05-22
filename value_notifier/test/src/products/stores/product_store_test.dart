import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:value_listenable_test/value_listenable_test.dart';
import 'package:value_notifier/src/products/services/products_service.dart';
import 'package:value_notifier/src/products/states/product_state.dart';
import 'package:value_notifier/src/products/stores/product_store.dart';

class ProductServiceMock extends Mock implements ProductService {}

void main() {
  final service = ProductServiceMock();
  final store = ProductStore(service);

  testWidgets('Deve alterar estado para sucesso', (tester) async {
    when(() => service.fetchProducts()).thenAnswer((_) async => []);

    await store.fetchProducts();

    //Fluxo de States que deve seguir
    expect(
        store,
        emitValues(
          [
            isA<LoadingProductState>(),
            isA<SucessProductState>(),
          ],
        ));
  });

  testWidgets('Deve alterar estado para erro', (tester) async {
    when(() => service.fetchProducts()).thenThrow(Exception('Error'));

    await store.fetchProducts();

    // expect(store.value, isA<ErrorProductState>());
    //Fluxo de States que deve seguir
    expect(
        store,
        emitValues(
          [
            isA<LoadingProductState>(),
            isA<ErrorProductState>(),
          ],
        ));
  });

  // testWidgets(description, (widgetTester) => null)
}
