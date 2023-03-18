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
