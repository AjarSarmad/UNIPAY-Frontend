class Scholarship {
  String id = "";
  String name = "";
  String description = "";

  Scholarship(this.id, this.name, this.description);

  String getId() {
    return id;
  }

  void setId(String id) {
    this.id = id;
  }

  String getName() {
    return name;
  }

  void setName(String name) {
    this.name = name;
  }

  String getDescription() {
    return description;
  }

  void setDescription(String description) {
    this.description = description;
  }
}
