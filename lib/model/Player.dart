class Player {
  final int id;
  final String name;
  final int score;
  final int kills;
  final int deaths;
  final int team;
  final int ping;

  Player({
    this.id,
    this.name,
    this.score,
    this.kills,
    this.deaths,
    this.team,
    this.ping
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['Pid'],
      name: json['Name'],
      score: json['Score'],
      kills: json['Kills'],
      deaths: json['Deaths'],
      team: json['Team'],
      ping: json['Ping']
    );
  }

}