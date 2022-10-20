import {NativeEventEmitter, NativeModules, Text, View} from 'react-native';
import React, {useEffect, useState} from 'react';

const AppClip = () => {
  const {AppClipLinkingManager} = NativeModules;
  // eslint-disable-next-line react-hooks/exhaustive-deps
  const eventEmitter = new NativeEventEmitter(AppClipLinkingManager);
  const [link, setLink] = useState('');

  useEffect(() => {
    const asyncEffect = async () => {
      const initialLink = (await AppClipLinkingManager.getInitialLink()) || '';
      setLink(initialLink);
    };
    void asyncEffect();
  }, [AppClipLinkingManager]);

  useEffect(() => {
    const subscription = eventEmitter.addListener('onNewUrl', event => {
      if (event && event.url) {
        console.log('[LOG] link from event: ', event.url);
        setLink(event.url);
      }
    });
    return () => {
      subscription.remove();
    };
  }, [eventEmitter]);

  return (
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
        I'm your AppClip!
      </Text>
      <Text
        style={{
          textAlign: 'center',
          margin: 14,
          fontSize: 20,
        }}>
        {`Current invocation URL is: \n ${link}`}
      </Text>
    </View>
  );
};

export default AppClip;
