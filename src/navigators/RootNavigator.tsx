import React from "react";
import { Icon } from "react-native-elements";
import { createBottomTabNavigator, NavigationInjectedProps } from "react-navigation";

import Account from "../screens/account/Account";
import Explore from "../screens/explore/Explore";
import { colors } from "../theme";

const RootNavigator = createBottomTabNavigator(
  {
    Explore: {
      screen: Explore,
      navigationOptions: ({ navigation }: NavigationInjectedProps) => ({
        tabBarLabel: "探索",
        tabBarIcon: ({ tintColor }: { tintColor: string }) => <Icon type="feather" name="search" color={tintColor} />,
      }),
    },
    Account: {
      screen: Account,
      navigationOptions: ({ navigation }: NavigationInjectedProps) => ({
        tabBarLabel: "我的帳號",
        tabBarIcon: ({ tintColor }: { tintColor: string }) => <Icon type="feather" name="user" color={tintColor} />,
      }),
    },
  },
  {
    initialRouteName: "Account",
    tabBarOptions: {
      activeTintColor: colors.secondary,
      inactiveTintColor: colors.grey2,
      tabStyle: { marginTop: 5 },
    },
  }
);

export default RootNavigator;
