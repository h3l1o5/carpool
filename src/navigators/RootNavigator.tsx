import React from "react";
import { Icon } from "react-native-elements";
import { createBottomTabNavigator, createStackNavigator, NavigationInjectedProps } from "react-navigation";

import SignUp from "../screens/account/SignUp";
import Explore from "../screens/explore/Explore";
import { colors } from "../theme";
import AccountNavigator from "./AccountNavigator";

const RootNavigator = createStackNavigator(
  {
    Main: {
      screen: createBottomTabNavigator(
        {
          Explore: {
            screen: Explore,
            navigationOptions: ({ navigation }: NavigationInjectedProps) => ({
              tabBarLabel: "探索",
              tabBarIcon: ({ tintColor }: { tintColor: string }) => (
                <Icon type="feather" name="search" color={tintColor} />
              ),
            }),
          },
          Account: {
            screen: AccountNavigator,
            navigationOptions: ({ navigation }: NavigationInjectedProps) => ({
              tabBarLabel: "我的帳號",
              tabBarIcon: ({ tintColor }: { tintColor: string }) => (
                <Icon type="feather" name="user" color={tintColor} />
              ),
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
      ),
    },
    SignUp: {
      screen: createStackNavigator(
        {
          SignUp: {
            screen: SignUp,
          },
        },
        {
          headerMode: "none",
          navigationOptions: { gesturesEnabled: false },
        }
      ),
    },
  },
  {
    headerMode: "none",
    mode: "modal",
  }
);

export default RootNavigator;
