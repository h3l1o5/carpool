import React from "react";
import { Text } from "react-native-elements";
import { createStackNavigator, NavigationScreenProps } from "react-navigation";

import Account from "../screens/account/Account";

const AccountNavigator = createStackNavigator(
  {
    Account: {
      screen: Account,
      navigationOptions: ({ navigation }: { navigation: NavigationScreenProps<any, any> }) => ({
        headerTransparent: true,
      }),
    },
  },
  {
    initialRouteName: "Account",
  }
);

export default AccountNavigator;
