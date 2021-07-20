class Board {
  final String number;
  final String title;
  final String id;
  final String pw;
  final DateTime time;
  final DateTime realTime;

  Board(this.realTime, {this.number, this.title, this.id, this.pw, this.time});
}
