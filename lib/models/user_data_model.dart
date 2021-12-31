import 'package:hive/hive.dart';

part 'user_data_model.g.dart';

@HiveType(typeId: 0)
class UserData {
  UserData({
    required this.error,
    required this.response,
    required this.srvNodo,
    required this.server,
    required this.h,
    required this.secs,
    required this.userServer,
    required this.reqXml,
    required this.resServer,
    required this.url,
  });

  @HiveField(1)
  int error;
  @HiveField(2)
  Response response;
  @HiveField(3)
  String srvNodo;
  @HiveField(4)
  Server server;
  @HiveField(5)
  H h;
  @HiveField(6)
  String secs;
  @HiveField(7)
  String userServer;
  @HiveField(8)
  String reqXml;
  @HiveField(9)
  String resServer;
  @HiveField(10)
  String url;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    error: json["error"],
    response: Response.fromJson(json["response"]),
    srvNodo: json["srv_nodo"],
    server: Server.fromJson(json["SERVER"]),
    h: H.fromJson(json["H"]),
    secs: json["secs"],
    userServer: json["server"],
    reqXml: json["reqXML"],
    resServer: json["resServer"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "response": response.toJson(),
    "srv_nodo": srvNodo,
    "SERVER": server.toJson(),
    "H": h.toJson(),
    "secs": secs,
    "server": userServer,
    "reqXML": reqXml,
    "resServer": resServer,
    "url": url,
  };
}

@HiveType(typeId: 1)
class H {
  H({
    required this.xMcSo,
    required this.contentType,
    required this.userAgent,
    required this.accept,
    required this.cacheControl,
    required this.postmanToken,
    required this.host,
    required this.acceptEncoding,
    required this.connection,
    required this.contentLength,
  });

  @HiveField(0)
  String xMcSo;
  @HiveField(1)
  String contentType;
  @HiveField(2)
  String userAgent;
  @HiveField(3)
  String accept;
  @HiveField(4)
  String cacheControl;
  @HiveField(5)
  String postmanToken;
  @HiveField(6)
  String host;
  @HiveField(7)
  String acceptEncoding;
  @HiveField(8)
  String connection;
  @HiveField(9)
  String contentLength;

  factory H.fromJson(Map<String, dynamic> json) => H(
    xMcSo: json["X-MC-SO"] ?? '',
    contentType: json["CONTENT-TYPE"] ?? '',
    userAgent: json["USER-AGENT"] ?? '',
    accept: json["ACCEPT"] ?? '',
    cacheControl: json["CACHE-CONTROL"] ?? '',
    postmanToken: json["POSTMAN-TOKEN"] ?? '',
    host: json["HOST"] ?? '',
    acceptEncoding: json["ACCEPT-ENCODING"] ?? '',
    connection: json["CONNECTION"] ?? '',
    contentLength: json["CONTENT-LENGTH"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "X-MC-SO": xMcSo,
    "CONTENT-TYPE": contentType,
    "USER-AGENT": userAgent,
    "ACCEPT": accept,
    "CACHE-CONTROL": cacheControl,
    "POSTMAN-TOKEN": postmanToken,
    "HOST": host,
    "ACCEPT-ENCODING": acceptEncoding,
    "CONNECTION": connection,
    "CONTENT-LENGTH": contentLength,
  };
}

@HiveType(typeId: 2)
class Response {
  Response({
    required this.usuario,
    required this.cuentas,
  });

  @HiveField(0)
  Usuario usuario;
  @HiveField(1)
  List<Cuenta> cuentas;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    usuario: Usuario.fromJson(json["usuario"]),
    cuentas: List<Cuenta>.from(json["cuentas"].map((x) => Cuenta.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "usuario": usuario.toJson(),
    "cuentas": List<dynamic>.from(cuentas.map((x) => x.toJson())),
  };
}

@HiveType(typeId: 3)
class Cuenta {
  Cuenta({
    required this.lineOfBusiness,
    required this.accountId,
    required this.alias,
    required this.token,
  });

  @HiveField(0)
  String lineOfBusiness;
  @HiveField(1)
  String accountId;
  @HiveField(2)
  String alias;
  @HiveField(3)
  String token;

  factory Cuenta.fromJson(Map<String, dynamic> json) => Cuenta(
    lineOfBusiness: json["LineOfBusiness"],
    accountId: json["AccountId"],
    alias: json["alias"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "LineOfBusiness": lineOfBusiness,
    "AccountId": accountId,
    "alias": alias,
    "token": token,
  };
}

@HiveType(typeId: 4)
class Usuario {
  Usuario({
    required this.nombre,
    required this.apellido,
    required  this.userProfileId,
    required this.documentNumber,
    required this.documentType,
    required this.claveTemporal,
    required this.esUsuarioInspira,
    required this.esSolicitarRegistro,
    required this.esCambioNombreUsuario,
    required this.roleId,
    required this.tipoClienteId,
    required this.tipoUsuarioId,
    required this.tokenSso,
    required this.uid,
  });

  @HiveField(0)
  String nombre;
  @HiveField(1)
  String apellido;
  @HiveField(2)
  String userProfileId;
  @HiveField(3)
  String documentNumber;
  @HiveField(4)
  String documentType;
  @HiveField(5)
  int claveTemporal;
  @HiveField(6)
  int esUsuarioInspira;
  @HiveField(7)
  int esSolicitarRegistro;
  @HiveField(8)
  int esCambioNombreUsuario;
  @HiveField(9)
  String roleId;
  @HiveField(10)
  String tipoClienteId;
  @HiveField(11)
  String tipoUsuarioId;
  @HiveField(12)
  String tokenSso;
  @HiveField(13)
  String uid;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
    nombre: json["nombre"],
    apellido: json["apellido"],
    userProfileId: json["UserProfileID"],
    documentNumber: json["DocumentNumber"],
    documentType: json["DocumentType"],
    claveTemporal: json["claveTemporal"],
    esUsuarioInspira: json["esUsuarioInspira"],
    esSolicitarRegistro: json["esSolicitarRegistro"],
    esCambioNombreUsuario: json["esCambioNombreUsuario"],
    roleId: json["roleID"],
    tipoClienteId: json["tipoClienteID"],
    tipoUsuarioId: json["tipoUsuarioID"],
    tokenSso: json["tokenSSO"],
    uid: json["UID"],
  );

  Map<String, dynamic> toJson() => {
    "nombre": nombre,
    "apellido": apellido,
    "UserProfileID": userProfileId,
    "DocumentNumber": documentNumber,
    "DocumentType": documentType,
    "claveTemporal": claveTemporal,
    "esUsuarioInspira": esUsuarioInspira,
    "esSolicitarRegistro": esSolicitarRegistro,
    "esCambioNombreUsuario": esCambioNombreUsuario,
    "roleID": roleId,
    "tipoClienteID": tipoClienteId,
    "tipoUsuarioID": tipoUsuarioId,
    "tokenSSO": tokenSso,
    "UID": uid,
  };
}

@HiveType(typeId: 5)
class Server {
  Server({
    required this.uniqueId,
    required this.https,
    required this.sslTlsSni,
    required this.httpXMcSo,
    required this.contentType,
    required this.httpUserAgent,
    required this.httpAccept,
    required this.httpCacheControl,
    required this.httpPostmanToken,
    required this.httpHost,
    required this.httpAcceptEncoding,
    required this.httpConnection,
    required this.contentLength,
    required this.path,
    required this.serverSignature,
    required this.serverSoftware,
    required this.serverName,
    required this.serverAddr,
    required this.serverPort,
    required this.remoteAddr,
    required this.documentRoot,
    required this.requestScheme,
    required this.contextPrefix,
    required this.contextDocumentRoot,
    required this.serverAdmin,
    required this.scriptFilename,
    required this.remotePort,
    required this.gatewayInterface,
    required this.serverProtocol,
    required this.requestMethod,
    required this.queryString,
    required this.requestUri,
    required this.scriptName,
    required this.pathInfo,
    required this.pathTranslated,
    required this.phpSelf,
    required this.requestTimeFloat,
    required this.requestTime,
  });

  @HiveField(0)
  String uniqueId;
  @HiveField(1)
  String https;
  @HiveField(2)
  String sslTlsSni;
  @HiveField(3)
  String httpXMcSo;
  @HiveField(4)
  String contentType;
  @HiveField(5)
  String httpUserAgent;
  @HiveField(6)
  String httpAccept;
  @HiveField(7)
  String httpCacheControl;
  @HiveField(8)
  String httpPostmanToken;
  @HiveField(9)
  String httpHost;
  @HiveField(10)
  String httpAcceptEncoding;
  @HiveField(11)
  String httpConnection;
  @HiveField(12)
  String contentLength;
  @HiveField(13)
  String path;
  @HiveField(14)
  String serverSignature;
  @HiveField(15)
  String serverSoftware;
  @HiveField(16)
  String serverName;
  @HiveField(17)
  String serverAddr;
  @HiveField(18)
  String serverPort;
  @HiveField(19)
  String remoteAddr;
  @HiveField(20)
  String documentRoot;
  @HiveField(21)
  String requestScheme;
  @HiveField(22)
  String contextPrefix;
  @HiveField(23)
  String contextDocumentRoot;
  @HiveField(24)
  String serverAdmin;
  @HiveField(25)
  String scriptFilename;
  @HiveField(26)
  String remotePort;
  @HiveField(27)
  String gatewayInterface;
  @HiveField(28)
  String serverProtocol;
  @HiveField(29)
  String requestMethod;
  @HiveField(30)
  String queryString;
  @HiveField(31)
  String requestUri;
  @HiveField(32)
  String scriptName;
  @HiveField(33)
  String pathInfo;
  @HiveField(34)
  String pathTranslated;
  @HiveField(35)
  String phpSelf;
  @HiveField(36)
  double requestTimeFloat;
  @HiveField(37)
  int requestTime;

  factory Server.fromJson(Map<String, dynamic> json) => Server(
    uniqueId: json["UNIQUE_ID"],
    https: json["HTTPS"],
    sslTlsSni: json["SSL_TLS_SNI"],
    httpXMcSo: json["HTTP_X_MC_SO"],
    contentType: json["CONTENT_TYPE"],
    httpUserAgent: json["HTTP_USER_AGENT"],
    httpAccept: json["HTTP_ACCEPT"] ?? '',
    httpCacheControl: json["HTTP_CACHE_CONTROL"] ?? '',
    httpPostmanToken: json["HTTP_POSTMAN_TOKEN"] ?? '',
    httpHost: json["HTTP_HOST"],
    httpAcceptEncoding: json["HTTP_ACCEPT_ENCODING"],
    httpConnection: json["HTTP_CONNECTION"] ?? '',
    contentLength: json["CONTENT_LENGTH"],
    path: json["PATH"],
    serverSignature: json["SERVER_SIGNATURE"],
    serverSoftware: json["SERVER_SOFTWARE"],
    serverName: json["SERVER_NAME"],
    serverAddr: json["SERVER_ADDR"],
    serverPort: json["SERVER_PORT"],
    remoteAddr: json["REMOTE_ADDR"],
    documentRoot: json["DOCUMENT_ROOT"],
    requestScheme: json["REQUEST_SCHEME"],
    contextPrefix: json["CONTEXT_PREFIX"],
    contextDocumentRoot: json["CONTEXT_DOCUMENT_ROOT"],
    serverAdmin: json["SERVER_ADMIN"],
    scriptFilename: json["SCRIPT_FILENAME"],
    remotePort: json["REMOTE_PORT"],
    gatewayInterface: json["GATEWAY_INTERFACE"],
    serverProtocol: json["SERVER_PROTOCOL"],
    requestMethod: json["REQUEST_METHOD"],
    queryString: json["QUERY_STRING"],
    requestUri: json["REQUEST_URI"],
    scriptName: json["SCRIPT_NAME"],
    pathInfo: json["PATH_INFO"],
    pathTranslated: json["PATH_TRANSLATED"],
    phpSelf: json["PHP_SELF"],
    requestTimeFloat: json["REQUEST_TIME_FLOAT"].toDouble(),
    requestTime: json["REQUEST_TIME"],
  );

  Map<String, dynamic> toJson() => {
    "UNIQUE_ID": uniqueId,
    "HTTPS": https,
    "SSL_TLS_SNI": sslTlsSni,
    "HTTP_X_MC_SO": httpXMcSo,
    "CONTENT_TYPE": contentType,
    "HTTP_USER_AGENT": httpUserAgent,
    "HTTP_ACCEPT": httpAccept,
    "HTTP_CACHE_CONTROL": httpCacheControl,
    "HTTP_POSTMAN_TOKEN": httpPostmanToken,
    "HTTP_HOST": httpHost,
    "HTTP_ACCEPT_ENCODING": httpAcceptEncoding,
    "HTTP_CONNECTION": httpConnection,
    "CONTENT_LENGTH": contentLength,
    "PATH": path,
    "SERVER_SIGNATURE": serverSignature,
    "SERVER_SOFTWARE": serverSoftware,
    "SERVER_NAME": serverName,
    "SERVER_ADDR": serverAddr,
    "SERVER_PORT": serverPort,
    "REMOTE_ADDR": remoteAddr,
    "DOCUMENT_ROOT": documentRoot,
    "REQUEST_SCHEME": requestScheme,
    "CONTEXT_PREFIX": contextPrefix,
    "CONTEXT_DOCUMENT_ROOT": contextDocumentRoot,
    "SERVER_ADMIN": serverAdmin,
    "SCRIPT_FILENAME": scriptFilename,
    "REMOTE_PORT": remotePort,
    "GATEWAY_INTERFACE": gatewayInterface,
    "SERVER_PROTOCOL": serverProtocol,
    "REQUEST_METHOD": requestMethod,
    "QUERY_STRING": queryString,
    "REQUEST_URI": requestUri,
    "SCRIPT_NAME": scriptName,
    "PATH_INFO": pathInfo,
    "PATH_TRANSLATED": pathTranslated,
    "PHP_SELF": phpSelf,
    "REQUEST_TIME_FLOAT": requestTimeFloat,
    "REQUEST_TIME": requestTime,
  };
}
