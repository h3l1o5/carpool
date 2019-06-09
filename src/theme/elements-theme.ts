import { Platform } from "react-native";
import { Theme } from "react-native-elements";
import colors from "./colors";

const elementsTheme: Theme = {
  colors: {
    primary: colors.primary,
    secondary: colors.secondary,
    grey0: colors.grey0,
    grey1: colors.grey1,
    grey2: colors.grey2,
    grey3: colors.grey3,
    grey4: colors.grey4,
    grey5: colors.grey5,
  },
  Button: {
    buttonStyle: {
      borderRadius: Platform.OS === "ios" ? 50 : 0,
    },
  },
};

export default elementsTheme;
