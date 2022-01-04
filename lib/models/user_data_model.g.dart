// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDataAdapter extends TypeAdapter<UserData> {
  @override
  final int typeId = 0;

  @override
  UserData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserData(
      error: fields[1] as int,
      response: fields[2] as Response,
      srvNodo: fields[3] as String,
      server: fields[4] as Server,
      h: fields[5] as H,
      secs: fields[6] as String,
      userServer: fields[7] as String,
      reqXml: fields[8] as String,
      resServer: fields[9] as String,
      url: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserData obj) {
    writer
      ..writeByte(10)
      ..writeByte(1)
      ..write(obj.error)
      ..writeByte(2)
      ..write(obj.response)
      ..writeByte(3)
      ..write(obj.srvNodo)
      ..writeByte(4)
      ..write(obj.server)
      ..writeByte(5)
      ..write(obj.h)
      ..writeByte(6)
      ..write(obj.secs)
      ..writeByte(7)
      ..write(obj.userServer)
      ..writeByte(8)
      ..write(obj.reqXml)
      ..writeByte(9)
      ..write(obj.resServer)
      ..writeByte(10)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HAdapter extends TypeAdapter<H> {
  @override
  final int typeId = 1;

  @override
  H read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return H(
      xMcSo: fields[0] as String,
      contentType: fields[1] as String,
      userAgent: fields[2] as String,
      accept: fields[3] as String,
      cacheControl: fields[4] as String,
      postmanToken: fields[5] as String,
      host: fields[6] as String,
      acceptEncoding: fields[7] as String,
      connection: fields[8] as String,
      contentLength: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, H obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.xMcSo)
      ..writeByte(1)
      ..write(obj.contentType)
      ..writeByte(2)
      ..write(obj.userAgent)
      ..writeByte(3)
      ..write(obj.accept)
      ..writeByte(4)
      ..write(obj.cacheControl)
      ..writeByte(5)
      ..write(obj.postmanToken)
      ..writeByte(6)
      ..write(obj.host)
      ..writeByte(7)
      ..write(obj.acceptEncoding)
      ..writeByte(8)
      ..write(obj.connection)
      ..writeByte(9)
      ..write(obj.contentLength);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ResponseAdapter extends TypeAdapter<Response> {
  @override
  final int typeId = 2;

  @override
  Response read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Response(
      usuario: fields[0] as Usuario,
      cuentas: (fields[1] as List).cast<Cuenta>(),
    );
  }

  @override
  void write(BinaryWriter writer, Response obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.usuario)
      ..writeByte(1)
      ..write(obj.cuentas);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CuentaAdapter extends TypeAdapter<Cuenta> {
  @override
  final int typeId = 3;

  @override
  Cuenta read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cuenta(
      lineOfBusiness: fields[0] as String,
      accountId: fields[1] as String,
      alias: fields[2] as String,
      token: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Cuenta obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.lineOfBusiness)
      ..writeByte(1)
      ..write(obj.accountId)
      ..writeByte(2)
      ..write(obj.alias)
      ..writeByte(3)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CuentaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UsuarioAdapter extends TypeAdapter<Usuario> {
  @override
  final int typeId = 4;

  @override
  Usuario read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Usuario(
      nombre: fields[0] as String,
      apellido: fields[1] as String,
      userProfileId: fields[2] as String,
      documentNumber: fields[3] as String,
      documentType: fields[4] as String,
      claveTemporal: fields[5] as int,
      esUsuarioInspira: fields[6] as int,
      esSolicitarRegistro: fields[7] as int,
      esCambioNombreUsuario: fields[8] as int,
      roleId: fields[9] as String,
      tipoClienteId: fields[10] as String,
      tipoUsuarioId: fields[11] as String,
      tokenSso: fields[12] as String,
      uid: fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Usuario obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.nombre)
      ..writeByte(1)
      ..write(obj.apellido)
      ..writeByte(2)
      ..write(obj.userProfileId)
      ..writeByte(3)
      ..write(obj.documentNumber)
      ..writeByte(4)
      ..write(obj.documentType)
      ..writeByte(5)
      ..write(obj.claveTemporal)
      ..writeByte(6)
      ..write(obj.esUsuarioInspira)
      ..writeByte(7)
      ..write(obj.esSolicitarRegistro)
      ..writeByte(8)
      ..write(obj.esCambioNombreUsuario)
      ..writeByte(9)
      ..write(obj.roleId)
      ..writeByte(10)
      ..write(obj.tipoClienteId)
      ..writeByte(11)
      ..write(obj.tipoUsuarioId)
      ..writeByte(12)
      ..write(obj.tokenSso)
      ..writeByte(13)
      ..write(obj.uid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsuarioAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ServerAdapter extends TypeAdapter<Server> {
  @override
  final int typeId = 5;

  @override
  Server read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Server(
      uniqueId: fields[0] as String,
      https: fields[1] as String,
      sslTlsSni: fields[2] as String,
      httpXMcSo: fields[3] as String,
      contentType: fields[4] as String,
      httpUserAgent: fields[5] as String,
      httpAccept: fields[6] as String,
      httpCacheControl: fields[7] as String,
      httpPostmanToken: fields[8] as String,
      httpHost: fields[9] as String,
      httpAcceptEncoding: fields[10] as String,
      httpConnection: fields[11] as String,
      contentLength: fields[12] as String,
      path: fields[13] as String,
      serverSignature: fields[14] as String,
      serverSoftware: fields[15] as String,
      serverName: fields[16] as String,
      serverAddr: fields[17] as String,
      serverPort: fields[18] as String,
      remoteAddr: fields[19] as String,
      documentRoot: fields[20] as String,
      requestScheme: fields[21] as String,
      contextPrefix: fields[22] as String,
      contextDocumentRoot: fields[23] as String,
      serverAdmin: fields[24] as String,
      scriptFilename: fields[25] as String,
      remotePort: fields[26] as String,
      gatewayInterface: fields[27] as String,
      serverProtocol: fields[28] as String,
      requestMethod: fields[29] as String,
      queryString: fields[30] as String,
      requestUri: fields[31] as String,
      scriptName: fields[32] as String,
      pathInfo: fields[33] as String,
      pathTranslated: fields[34] as String,
      phpSelf: fields[35] as String,
      requestTimeFloat: fields[36] as double,
      requestTime: fields[37] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Server obj) {
    writer
      ..writeByte(38)
      ..writeByte(0)
      ..write(obj.uniqueId)
      ..writeByte(1)
      ..write(obj.https)
      ..writeByte(2)
      ..write(obj.sslTlsSni)
      ..writeByte(3)
      ..write(obj.httpXMcSo)
      ..writeByte(4)
      ..write(obj.contentType)
      ..writeByte(5)
      ..write(obj.httpUserAgent)
      ..writeByte(6)
      ..write(obj.httpAccept)
      ..writeByte(7)
      ..write(obj.httpCacheControl)
      ..writeByte(8)
      ..write(obj.httpPostmanToken)
      ..writeByte(9)
      ..write(obj.httpHost)
      ..writeByte(10)
      ..write(obj.httpAcceptEncoding)
      ..writeByte(11)
      ..write(obj.httpConnection)
      ..writeByte(12)
      ..write(obj.contentLength)
      ..writeByte(13)
      ..write(obj.path)
      ..writeByte(14)
      ..write(obj.serverSignature)
      ..writeByte(15)
      ..write(obj.serverSoftware)
      ..writeByte(16)
      ..write(obj.serverName)
      ..writeByte(17)
      ..write(obj.serverAddr)
      ..writeByte(18)
      ..write(obj.serverPort)
      ..writeByte(19)
      ..write(obj.remoteAddr)
      ..writeByte(20)
      ..write(obj.documentRoot)
      ..writeByte(21)
      ..write(obj.requestScheme)
      ..writeByte(22)
      ..write(obj.contextPrefix)
      ..writeByte(23)
      ..write(obj.contextDocumentRoot)
      ..writeByte(24)
      ..write(obj.serverAdmin)
      ..writeByte(25)
      ..write(obj.scriptFilename)
      ..writeByte(26)
      ..write(obj.remotePort)
      ..writeByte(27)
      ..write(obj.gatewayInterface)
      ..writeByte(28)
      ..write(obj.serverProtocol)
      ..writeByte(29)
      ..write(obj.requestMethod)
      ..writeByte(30)
      ..write(obj.queryString)
      ..writeByte(31)
      ..write(obj.requestUri)
      ..writeByte(32)
      ..write(obj.scriptName)
      ..writeByte(33)
      ..write(obj.pathInfo)
      ..writeByte(34)
      ..write(obj.pathTranslated)
      ..writeByte(35)
      ..write(obj.phpSelf)
      ..writeByte(36)
      ..write(obj.requestTimeFloat)
      ..writeByte(37)
      ..write(obj.requestTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
