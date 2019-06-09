import React, { Component } from "react";
import { ThemeProvider } from "react-native-elements";
import { createAppContainer } from "react-navigation";

import RootNavigator from "./navigators/RootNavigator";
import { elementsTheme } from "./theme";

const AppContainer = createAppContainer(RootNavigator);

class App extends Component {
  render() {
    return (
      <ThemeProvider theme={elementsTheme}>
        <AppContainer />
      </ThemeProvider>
    );
  }
}

export default App;
