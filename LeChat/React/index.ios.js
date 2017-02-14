import React,{ Component } from 'react';
import { AppRegistry, StyleSheet, Image, Text, View, TextInput, ScrollView, ListView } from 'react-native';



class PropsDemo extends React.Component {
  render() {
    let pic = {
      uri: 'https://upload.wikimedia.org/wikipedia/commons/d/de/Bananavarieties.jpg'
    };
    return (
      <Image source={pic} style={{width: 193, height: 110}}/>
    );
  }
}
AppRegistry.registerComponent('PropsDemo', () => PropsDemo);



class  StateDemo extends React.Component {
  constructor(props) {
    super(props);
    this.state = { valShow: true};

    setInterval( () => {
      this.setState({valShow : !this.state.valShow})
    }, 1000);
  }

  render() {
    let display = this.state.valShow ? 'on show' : 'on hidden';
    return (
      <Text>{display}</Text>
    );
  }
}
AppRegistry.registerComponent('StateDemo', () => StateDemo);




const styles = StyleSheet.create({
  bigblue: {
    color: 'blue',
    fontWeight: 'bold',
    fontSize: 30,
  },
  red: {
    color: 'red',
  },
});

class StyleDemo extends React.Component {
    render() {
      return (
        <View>
          <Text style={styles.red}>just red</Text>
          <Text style={styles.bigblue}>just bigblue</Text>
          <Text style={[styles.bigblue, styles.red]}>bigblue, then red</Text>
          <Text style={[styles.red, styles.bigblue]}>red, then bigblue</Text>
        </View>
      )
  }
}
AppRegistry.registerComponent('StyleDemo', () => StyleDemo);


class SizeDemo extends React.Component {
  render() {
    return (
      <View>
        <View style={{width: 50, height: 50, backgroundColor: 'powderblue'}} />
        <View style={{width: 100, height: 100, backgroundColor: 'skyblue'}} />
        <View style={{width: 150, height: 150, backgroundColor: 'steelblue'}} />
      </View>
    );
  }
}
AppRegistry.registerComponent('SizeDemo', () => SizeDemo);


class LayoutDemo extends React.Component {
  render() {
    return (
      // Try setting `flexDirection` to `column`.
      <View style={{flex: 1, flexDirection: 'row'}}>
        <View style={{width: 50, height: 50, backgroundColor: 'powderblue'}} />
        <View style={{width: 50, height: 50, backgroundColor: 'skyblue'}} />
        <View style={{width: 50, height: 50, backgroundColor: 'steelblue'}} />
      </View>
    );
  }
}
AppRegistry.registerComponent('LayoutDemo', () => LayoutDemo);


class TextInputDemo extends React.Component {
  constructor(props) {
    super(props);
    this.state = {text : ''};
  }
  render() {
    return(
      <View style={{padding: 10}}>
       <TextInput
         style={{height: 40}}
         placeholder="Type here to translate!"
         onChangeText={(text) => this.setState({text})}
       />
       <Text style={{padding: 10, fontSize: 42}}>
         {this.state.text.split(' ').map((word) => word && '🍕').join(' ')}
       </Text>
      </View>
    );
  }
}
AppRegistry.registerComponent('TextInputDemo', () => TextInputDemo);


class ScrollViewDemo extends React.Component {
  render() {
      return(
        <ScrollView>
          <Text style={{fontSize:96}}>Scroll me plz</Text>
            <Image source={require('./img/favicon.png')} />
            <Image source={require('./img/favicon.png')} />
            <Image source={require('./img/favicon.png')} />
            <Image source={require('./img/favicon.png')} />
            <Image source={require('./img/favicon.png')} />
            <Text style={{fontSize:96}}>If you like</Text>
            <Image source={require('./img/favicon.png')} />
            <Image source={require('./img/favicon.png')} />
            <Image source={require('./img/favicon.png')} />
            <Image source={require('./img/favicon.png')} />
            <Image source={require('./img/favicon.png')} />
            <Text style={{fontSize:96}}>Scrolling down</Text>
            <Image source={require('./img/favicon.png')} />
            <Image source={require('./img/favicon.png')} />
            <Image source={require('./img/favicon.png')} />
            <Image source={require('./img/favicon.png')} />
            <Image source={require('./img/favicon.png')} />
        </ScrollView>
    );
  }
}
AppRegistry.registerComponent('ScrollViewDemo', () => ScrollViewDemo);



class ListViewDemo extends React.Component {
  // Initialize the hardcoded data
  constructor(props) {
    super(props);
    const ds = new ListView.DataSource({rowHasChanged: (r1, r2) => r1 !== r2});
    this.state = {
      dataSource: ds.cloneWithRows([
        'John', 'Joel', 'James', 'Jimmy', 'Jackson', 'Jillian', 'Julie', 'Devin'
      ])
    };
  }
  render() {
    return (
      <View style={{flex: 1, paddingTop: 22}}>
        <ListView
          dataSource={this.state.dataSource}
          renderRow={(rowData) => <Text>{rowData}</Text>}
        />
      </View>
    );
  }
}
AppRegistry.registerComponent('ListViewDemo', () => ListViewDemo);


