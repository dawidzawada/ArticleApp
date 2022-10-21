/**
 * @format
 */

import React from 'react';
import {AppRegistry, View, Text} from 'react-native';
import {name as appName} from './app.json';

const InstantApp = () => (
  <View
    style={{
      justifyContent: 'center',
      alignItems: 'center',
      marginTop: 50,
    }}>
    <Text
      style={{
        fontSize: 40,
        margin: 10,
        textAlign: 'center',
      }}>
      Hello,
    </Text>
    <Text
      style={{
        fontSize: 20,
        margin: 10,
        textAlign: 'center',
      }}>
      I'm your Instant App!
    </Text>
  </View>
);

AppRegistry.registerComponent(appName, () => InstantApp);
