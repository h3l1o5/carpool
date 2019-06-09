import React from "react";
import { SafeAreaView, Text, View } from "react-native";
import { Icon } from "react-native-elements";
import { NavigationInjectedProps } from "react-navigation";
import { colors } from "../../theme";

const SignUp: React.FC<NavigationInjectedProps> = props => {
  const handleClosePressed = () => {
    props.navigation.dismiss();
  };

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <View style={{ flex: 1, justifyContent: "center", alignItems: "center", padding: 36 }}>
        <Icon
          type="antdesign"
          name="close"
          color={colors.grey0}
          containerStyle={{ position: "absolute", left: 20, top: 20 }}
          onPress={handleClosePressed}
        />
        <Text>Sign up</Text>
      </View>
    </SafeAreaView>
  );
};

export default SignUp;
