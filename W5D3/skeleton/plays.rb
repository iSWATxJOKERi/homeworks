require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_playwright(name)
    # raise "#{name} doesn't exist yet" unless playwrights.name = name
    PlayDBConnection.instance.execute("SELECT * FROM plays JOIN playwrights ON plays.playwright_id = playwrights.id WHERE playwrights.name = name")
  end

  def self.find_by_title(title)
    PlayDBConnection.instance.execute("SELECT * FROM plays WHERE Title IS title")
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end

class Playwright
  attr_accessor :id, :name, :birth_year
  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map { |datum| Playwright.new(datam)}
  end

  def self.find_by_name(name)
    PlayDBConnection.instance.execute("SELECT * FROM playwrights WHERE name IS name")
  end

  def new(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.id, self.name, self.birth_year)
    INSERT INTO
      playwrights (id, name, birth_year)
    VALUES 
      (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.id, self.name, self.birth_year)
    UPDATE
      playwrights
    SET
      name = ?, birth_year = ?
    WHERE
      id = ?
    SQL
  end

  def get_plays
    PlayDBConnection.instance.execute("SELECT * FROM playwrights JOIN plays ON playwrights.id = plays.playwright_id")
  end

end
