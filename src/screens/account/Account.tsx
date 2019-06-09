import React, { useEffect, useState } from "react";
import { SafeAreaView, TouchableOpacity, View } from "react-native";
import { Avatar, Button, Divider, Icon, Text } from "react-native-elements";
import firebase, { RNFirebase } from "react-native-firebase";
import { colors } from "../../theme";

const Account = () => {
  const [user, setUser] = useState<RNFirebase.auth.OrNull<RNFirebase.User>>(null);

  useEffect(() => {
    firebase.auth().onAuthStateChanged(user => {
      setUser(user);
    });
  }, []);

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <View style={{ flex: 1, padding: 24 }}>
        {user ? (
          <View style={{ flexDirection: "row", justifyContent: "space-between", alignItems: "center" }}>
            <View>
              <Text h3 h3Style={{ marginBottom: 10 }}>
                訪客
              </Text>
              <Text style={{ color: colors.grey2 }}>請登入以繼續使用大部分功能</Text>
            </View>
            <Avatar rounded size="medium" icon={{ name: "person" }} />
          </View>
        ) : (
          <View style={{ flexDirection: "row", justifyContent: "space-between", alignItems: "center" }}>
            <View>
              <Text h3 h3Style={{ marginBottom: 10 }}>
                訪客
              </Text>
              <Text style={{ color: colors.grey2 }}>請登入以繼續使用大部分功能</Text>
            </View>
            <Avatar rounded size="medium" icon={{ name: "person" }} />
          </View>
        )}
        <Divider style={{ marginVertical: 24 }} />
        {user ? (
          <View style={{ flex: 1, justifyContent: "center", alignItems: "center" }}>
            <Text>已登入</Text>
          </View>
        ) : (
          <View style={{ flex: 1, justifyContent: "center", alignItems: "center", paddingHorizontal: 30 }}>
            <Button
              title="使用 Google 登入"
              raised
              icon={
                <Icon
                  type="antdesign"
                  name="google"
                  size={25}
                  color="white"
                  containerStyle={{ width: 25, height: 25, position: "absolute", left: 15 }}
                />
              }
              titleStyle={{ fontSize: 16 }}
              containerStyle={{ width: "100%", marginVertical: 5 }}
              buttonStyle={{ backgroundColor: "#db4437", elevation: 0 }}
            />
            <Button
              title="使用 Facebook 登入"
              raised
              icon={
                <Icon
                  type="font-awesome"
                  name="facebook"
                  size={25}
                  color="white"
                  containerStyle={{ width: 25, height: 25, position: "absolute", left: 15 }}
                />
              }
              titleStyle={{ fontSize: 16 }}
              containerStyle={{ width: "100%", marginVertical: 10 }}
              buttonStyle={{ backgroundColor: "#4267b2" }}
            />
            <Button
              title="使用帳號密碼登入"
              type="outline"
              titleStyle={{ fontSize: 16 }}
              containerStyle={{ width: "100%", marginTop: 40 }}
            />
            <View
              style={{
                width: "100%",
                flexDirection: "row",
                justifyContent: "flex-end",
                alignItems: "center",
                paddingTop: 15,
              }}
            >
              <Text style={{ color: colors.grey2 }}>還沒有帳號？</Text>
              <Button
                title="註冊"
                type="clear"
                TouchableComponent={TouchableOpacity}
                titleStyle={{ fontSize: 14 }}
                buttonStyle={{ padding: 0 }}
              />
            </View>
          </View>
        )}
      </View>
    </SafeAreaView>
  );
};

export default Account;
