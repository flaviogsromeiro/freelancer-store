class DatabaseSchema {
  static final table = [
    _products,
  ];

  static const _products = '''
    CREATE TABLE PRODUCTS (
      ID VARCHAR (50),
      TITLE VARCHAR NOT NULL,
      DESCRIPTION VARCHAR NOT NULL,
      TYPE INT NOT NULL,
      PRICE VARCHAR NOT NULL,
      URLIMAGE VARCHAR NOT NULL
    );
  ''';

  
}
