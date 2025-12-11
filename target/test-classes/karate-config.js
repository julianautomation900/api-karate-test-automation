function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue',
    baseUrl: 'http://localhost:3000',
    apiKey: karate.properties['apiKey']
  }
  if (env == 'dev') {
    config.userId = '90000'
    // customize
    // e.g. config.foo = 'bar';

  } else if (env == 'e2e') {
      config.baseUrl = 'http://e2e.localhost:3000'
    // customize
  }
  return config;
}