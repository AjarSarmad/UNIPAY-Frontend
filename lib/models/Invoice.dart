class invoice {
  String name = '';
  String amount = '';
  String account = '';
  String receiver = '';
  String note = '';
  String date = '';

  invoice() {}

  void setname(String name) {
    this.name = name;
  }

  void setamount(String amount) {
    this.amount = amount;
  }

  void setaccount(String account) {
    this.account = account;
  }

  void setreceiver(String receiver) {
    this.receiver = receiver;
  }

  void setnote(String note) {
    this.note = note;
  }

  void setdate(String date) {
    this.date = date;
  }

  String getname() {
    return this.name;
  }

  String getamount() {
    return this.amount;
  }

  String getaccount() {
    return this.account;
  }

  String getreceiver() {
    return this.receiver;
  }

  String getnote() {
    return this.note;
  }

  String getdate() {
    return this.date;
  }
}
