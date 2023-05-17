class Transaction {
  String id = '';
  String amount = '';
  String senderName = '';
  String recieverName = '';
  String senderId = '';
  String recieverId = '';
  String senderAccount = '';
  String recieverAccount = '';
  String date = '';
  String time = '';
  String note = '';
  String type = '';

  Transaction(
      this.id,
      this.amount,
      this.senderName,
      this.recieverName,
      this.senderId,
      this.recieverId,
      this.senderAccount,
      this.recieverAccount,
      this.date,
      this.time,
      this.note,
      this.type);

  String getId() {
    return id;
  }

  void setId(String id) {
    this.id = id;
  }

  String getAmount() {
    return amount;
  }

  void setAmount(String amount) {
    this.amount = amount;
  }

  String getSenderName() {
    return senderName;
  }

  void setSenderName(String senderName) {
    this.senderName = senderName;
  }

  String getRecieverName() {
    return recieverName;
  }

  void setRecieverName(String recieverName) {
    this.recieverName = recieverName;
  }

  String getSenderId() {
    return senderId;
  }

  void setSenderId(String senderId) {
    this.senderId = senderId;
  }

  String getRecieverId() {
    return recieverId;
  }

  void setRecieverId(String recieverId) {
    this.recieverId = recieverId;
  }

  String getSenderAccount() {
    return senderAccount;
  }

  void setSenderAccount(String senderAccount) {
    this.senderAccount = senderAccount;
  }

  String getRecieverAccount() {
    return recieverAccount;
  }

  void setRecieverAccount(String recieverAccount) {
    this.recieverAccount = recieverAccount;
  }

  String getDate() {
    return date;
  }

  void setDate(String date) {
    this.date = date;
  }

  String getTime() {
    return time;
  }

  void setTime(String time) {
    this.time = time;
  }

  String getNote() {
    return note;
  }

  void setNote(String note) {
    this.note = note;
  }

  String getType() {
    return type;
  }

  void setType(String type) {
    this.type = type;
  }
}
