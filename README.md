# Cardápio Flutter

![Badge de build](https://img.shields.io/badge/build-passing-brightgreen) ![License](https://img.shields.io/badge/license-MIT-blue) ![Flutter](https://img.shields.io/badge/Flutter-Android%20%7C%20iOS-blue)

> Aplicativo móvel em Flutter que apresenta um **cardápio de comidas** por categorias, com filtros alimentares, detalhes das receitas e funcionalidade de favoritos.

---

## 🧾 Visão geral

O projeto é um app de receitas, onde o usuário pode navegar por categorias (ex.: Café da manhã, Fácil e rápido, Exótico), visualizar ingredientes e modo de preparo de cada prato, aplicar filtros alimentares (Sem Glúten, Sem Lactose, Vegano, Vegetariano), salvar pratos como favoritos e customizar seus próprios filtros para descobrir comidas que se encaixem nas suas restrições.

Principais características:

- Navegação entre múltiplas telas (lista de categorias, lista de comidas, detalhe da comida, filtros, favoritos).
- Gerenciamento global de estado com **flutter_riverpod**.
- UI responsiva para diferentes tamanhos de tela e com animações leves para melhor experiência.
- Sistema de filtros persistente (local) e favoritos locais.

---

## 🚀 Funcionalidades

- Navegar por categorias de comidas
- Visualizar lista de refeições por categoria
- Ver ingredientes e modo de preparo
- Filtrar refeições por: **Sem Glúten**, **Sem Lactose**, **Vegano**, **Vegetariano**
- Favoritar / desfavoritar refeições
- Salvar filtros do usuário (persistência local)
- UI responsiva e com animações suaves
- Gerenciamento de estado com **flutter_riverpod**

---

## 🧱 Tecnologias

- Flutter (>= 3.x)
- Dart
- flutter_riverpod
- transparent_image

---

## 📁 Estrutura sugerida do projeto

```
/lib
  /data          # dummy data, com listas de Categorias e Comidas
  /models        # modelos (Meal, Category)
  /providers     # providers do Riverpod
  /screens       # telas: Home, Categories, Meals, MealDetails, Filters, Favorites
  /widgets       # widgets utlizados nas telas
  main.dart      # arquivo principal com tematização
/pubspec.yaml
```

---

## ⚙️ Requisitos

- Flutter SDK instalado (versão compatível com o `pubspec.yaml`)
- Android Studio / Xcode (para emular ou rodar em dispositivo físico)
- Dispositivo ou emulador Android / iOS

---

## 🛠️ Instalação e execução

1. Clone o repositório:

```bash
git clone https://github.com/Afonso247/meals-museum.git
cd meals-museum
```

2. Instale dependências:

```bash
flutter pub get
```

3. Rode o app em modo debug:

```bash
flutter run
```

4. Gerar release (Android):

```bash
flutter build apk --release
```

Para iOS, siga as instruções oficiais da documentação do Flutter para `flutter build ipa` e configuração do Xcode.

---

## 🧩 Como funciona o gerenciamento de estado (Riverpod)

- Use `StateNotifier` ou `StateNotifierProvider` para estados complexos (ex.: lista de refeições, favoritos, filtros).
- Use `Provider` para dados estáticos ou serviços.
- Recomendo separar uma camada `repositories/` caso você queira futuramente trocar a fonte de dados (API, DB local, etc.).

Exemplo rápido de `StateNotifier`:

```dart
class FavoritesNotifier extends StateNotifier<Set<String>> {
  FavoritesNotifier(): super({});

  void toggleFavorite(String id) {
    if (state.contains(id)) {
      state = {...state}..remove(id);
    } else {
      state = {...state}..add(id);
    }
    // salvar em persistência local aqui
  }
}

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, Set<String>>((ref) => FavoritesNotifier());
```

---

## 🤝 Como contribuir

1. Fork o repositório
2. Crie uma branch: `feature/nome-da-feature`
3. Faça commits claros e pequenos
4. Abra um Pull Request descrevendo a mudança

Sugestões de melhoria: persistência de dados, adicionar autenticação, sincronização com backend, suporte a múltiplos idiomas, busca por ingredientes, integração com uma API pública de receitas.

---

## 🛡️ Licença

Este projeto está licenciado sob a licença MIT — veja o arquivo `LICENSE` para mais detalhes.

---

## ✉️ Contato

Nome: Afonso Henrique
E-mail: afonsoh.dev@gmail.com
GitHub: https://github.com/Afonso247

---

## 📌 Roadmap (opcional)

- [ ] Persistência de dados
- [ ] Integração com backend (sincronização de favoritos)
- [ ] Login de usuário
- [ ] Pesquisa por ingredientes/receitas
- [ ] Suporte a múltiplos idiomas
- [ ] Integração com uma API pública de receitas

---

