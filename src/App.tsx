import React, { Component } from "react";
import { View } from "react-native";
import { Button } from "react-native-elements";

export default class App extends Component {
  render() {
    return (
      <View style={{ flex: 1, justifyContent: "center", alignItems: "center" }}>
        <Button title="Hey!" />
      </View>
    );
  }
}
