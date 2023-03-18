# 参考記事

- [Rails + React + GraphQL + ApolloClient で画面表示されるまでのハンズオン！](https://qiita.com/sasaki-sota/items/2f65d9bec3753d48bbc0)
- [[Rails]rails new した後からアプリ名を変更する方法](https://qiita.com/ryoya-s/items/66e426f1a0dd5d87cd6f)

# API

## 操作

`rails s`で api を起動すると、  
http://localhost:3000/graphql で query, mutation など GraphQL の操作ができる。  
![picture 1](images/1d64ae89098fcd56d3c9c525fdc00e23c4d20a434b19e57d98aa244d9c0e8b51.png)

## フロントからの叩き方

### REST

RESTful API の場合は、  
http://localhost:3000/users のように、  
レスポンスを API 側で指定したエンドポイントを叩いてほしいデータを取得する。

### GraphQL

http://localhost:3000/graphql に対して、  
以下のような QUERY をフロント側から送りつけてほしいレスポンスを得る。

```ts
const GET_USERS = gql`
  {
    users {
      id
      name
      age
      books {
        id
        title
        body
      }
    }
  }
`;
```

N+1 は普通に発生するが、JOIN を使うと GraphQL の思想から逸れるので、  
DataLoader を使うのが一般的。[参考](https://zenn.dev/alea12/articles/15d73282c3aacc)

## SQL クエリのログ

ローカルだと terminal などに普通に出る。

```
User Load (0.2ms)  SELECT "users".* FROM "users"
```

# コマンド

## frontend

- `yarn start` でサーバー起動

## backend

- `rails s`でサーバー起動
- `rails db:seed`で seed データ作成

# エラー

### Uncaught TypeError: Cannot read properties of undefined (reading 'bind')

```javascript
// frontend/src/App.js
import React from "react";
import { ApolloClient, InMemoryCache, ApolloProvider } from "@apollo/client";
import Demo from "./Demo";
const client = new ApolloClient({
  uri: "http://localhost:3001/graphql", // backendのエンドポイントを設定する
  cache: new InMemoryCache(),
});

const App = () => {
  return (
    <ApolloProvider client={client}>
      <div className="App">
        <Demo />
      </div>
    </ApolloProvider>
  );
};

export default App;
```

として解決。

### ActionController::RoutingError (No route matches [OPTIONS] "/graphql")

backend サーバー再起動で解決
