import React, { Component } from "react";
import { ThemeProvider } from "react-native-elements";
import firebase from "react-native-firebase";
import { createAppContainer } from "react-navigation";

import RootNavigator from "./navigators/RootNavigator";
import { elementsTheme } from "./theme";

const AppContainer = createAppContainer(RootNavigator);

class App extends Component {
  componentDidMount() {
    firebase.auth().onAuthStateChanged(user => {
      // console.log(user);
    });
  }
  render() {
    return (
      <ThemeProvider theme={elementsTheme}>
        <AppContainer />
      </ThemeProvider>
    );
  }
}

export default App;
