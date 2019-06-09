import 'Player.dart';

class Server {
  final String ipAddress;
  final int queryPort;
  final String country;
  final String serverName;
  final String gameName;
  final String gameVersion;
  final int gamePort;
  final String modName;
  final String mapName;
  final String gameMode;
  final int mapSize;
  final int numPlayers;
  final int maxPlayers;
  final int reservedSlots;
  final String gameStatus;
  final bool password;
  final int timeLimit;
  final int numRounds;
  final String os;
  final bool dedicated;
  final bool ranked;
  final bool punkbuster;
  final bool battleRecorder;
  final String battleRecorderIndex;
  final String battleRecorderDownload;
  final bool voip;
  final bool autoBalance;
  final bool friendlyFire;
  final String teamKillMode;
  final double startDelay;
  final double spawnTime;
  final String serverText;
  final String serverLogo;
  final String communityWebsite;
  final int scoreLimit;
  final double ticketRatio;
  final double teamRatio;
  final String teamOneName;
  final String teamTwoName;
  final bool coopEnabled;
  final bool pure;
  final bool unlocks;
  final double fps;
  final bool plasma;
  final int coopBotRatio;
  final int coopBotCount;
  final int coopBotDifficulty;
  final bool noVehicles;
  final List<Player> players;

  Server({
    this.ipAddress,
    this.queryPort,
    this.country,
    this.serverName,
    this.gameName,
    this.gameVersion,
    this.gamePort,
    this.modName,
    this.mapName,
    this.gameMode,
    this.mapSize,
    this.numPlayers,
    this.maxPlayers,
    this.reservedSlots,
    this.gameStatus,
    this.password,
    this.timeLimit,
    this.numRounds,
    this.os,
    this.dedicated,
    this.ranked,
    this.punkbuster,
    this.battleRecorder,
    this.battleRecorderIndex,
    this.battleRecorderDownload,
    this.voip,
    this.autoBalance,
    this.friendlyFire,
    this.teamKillMode,
    this.startDelay,
    this.spawnTime,
    this.serverText,
    this.serverLogo,
    this.communityWebsite,
    this.scoreLimit,
    this.ticketRatio,
    this.teamRatio,
    this.teamOneName,
    this.teamTwoName,
    this.coopEnabled,
    this.pure,
    this.unlocks,
    this.fps,
    this.plasma,
    this.coopBotRatio,
    this.coopBotCount,
    this.coopBotDifficulty,
    this.noVehicles,
    this.players
  });

  factory Server.fromJson(Map<String, dynamic> json) {
    //Parse player list
    Iterable playerIterable = json['Players'];
    final List<Player> players = playerIterable.map((model) =>
        Player.fromJson(model)).toList();

    return Server(
      ipAddress: json['IPAddress'],
      queryPort: json['QueryPort'],
      country: json['Country'],
      serverName: json['ServerName'],
      gameName: json['GameName'],
      gameVersion: json['GameVersion'],
      gamePort: json['GamePort'],
      modName: json['ModName'],
      mapName: json['MapName'],
      gameMode: json['GameMode'],
      mapSize: json['MapSize'],
      numPlayers: json['NumPlayers'],
      maxPlayers: json['MaxPlayers'],
      reservedSlots: json['ReservedSlots'],
      gameStatus: json['GameStatus'],
      password: json['Password'],
      timeLimit: json['TimeLimit'],
      numRounds: json['NumRounds'],
      os: json['OS'],
      dedicated: json['Dedicated'],
      ranked: json['Ranked'],
      punkbuster: json['PunkBuster'],
      battleRecorder: json['BattleRecorder'],
      battleRecorderIndex: json['BRIndex'],
      battleRecorderDownload: json['BRDownload'],
      voip: json['Voip'],
      autoBalance: json['AutoBalance'],
      friendlyFire: json['FriendlyFire'],
      teamKillMode: json['TKMode'],
      startDelay: json['StartDelay'],
      spawnTime: json['SpawnTime'],
      serverText: json['ServerText'],
      serverLogo: json['ServerLogo'],
      communityWebsite: json['CommunityWebsite'],
      scoreLimit: json['ScoreLimit'],
      ticketRatio: json['TicketRatio'],
      teamRatio: json['TeamRatio'],
      teamOneName: json['Team1Name'],
      teamTwoName: json['Team2Name'],
      coopEnabled: json['CoopEnabled'],
      pure: json['Pure'],
      unlocks: json['Unlocks'],
      fps: json['Fps'].toDouble(),
      plasma: json['Plasma'],
      coopBotRatio: json['CoopBotRatio'],
      coopBotCount: json['CoopBotCount'],
      coopBotDifficulty: json['CoopBotDifficulty'],
      noVehicles: json['NoVehicles'],
      players: players
    );
  }
}