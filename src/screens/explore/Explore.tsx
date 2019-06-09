import React from "react";
import { View } from "react-native";
import { Button, colors, Text } from "react-native-elements";
import { colors as myColors } from "../../theme";

const Explore = () => {
  return (
    <View style={{ flex: 1, justifyContent: "center", alignItems: "center" }}>
      <Text h3 h3Style={{ color: myColors.primary }}>
        PRIMARY
      </Text>
      <Text h3 h3Style={{ color: myColors.secondary }}>
        SECONDARY
      </Text>
      <Text h3 h3Style={{ color: myColors.success }}>
        SUCCESS
      </Text>
      <Text h3 h3Style={{ color: myColors.warning }}>
        WARNING
      </Text>
      <Text h3 h3Style={{ color: myColors.error }}>
        ERROR
      </Text>
      <Text h3 h3Style={{ color: myColors.grey0 }}>
        GREY0
      </Text>
      <Text h3 h3Style={{ color: myColors.grey1 }}>
        GREY1
      </Text>
      <Text h3 h3Style={{ color: myColors.grey2 }}>
        GREY2
      </Text>
      <Text h3 h3Style={{ color: myColors.grey3 }}>
        GREY3
      </Text>
      <Text h3 h3Style={{ color: myColors.grey4 }}>
        GREY4
      </Text>
      <Text h3 h3Style={{ color: myColors.grey5 }}>
        GREY5
      </Text>
      <Text h1 h1Style={{ color: colors.greyOutline }}>
        GREY OUTLINE
      </Text>
      <Button title="HEY" type="solid" raised containerStyle={{ width: "100%" }} loading disabled />
    </View>
  );
};

export default Explore;
