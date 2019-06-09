import React from "react";
import { View } from "react-native";
import { Button } from "react-native-elements";
import firebase from "react-native-firebase";
import { colors } from "../../theme";

const Explore = () => {
  return (
    <View style={{ flex: 1, justifyContent: "center", alignItems: "center" }}>
      <Button
        title="LOGIN"
        type="outline"
        onPress={async () => {
          try {
            await firebase.auth().signInAnonymously();
          } catch (error) {
            // console.log(error);
          }
        }}
      />
      <Button
        title="LOGOUT"
        type="outline"
        raised
        titleStyle={{ color: colors.secondary }}
        buttonStyle={{ borderColor: colors.secondary }}
        onPress={async () => {
          try {
            await firebase.auth().signOut();
          } catch (error) {
            // console.log(error);
          }
        }}
      />
    </View>
  );
};

export default Explore;
