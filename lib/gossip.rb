require 'csv'
#require 'pry'

class Gossip
    attr_accessor :author, :content, :id 

  def initialize(author,content)
        @author = author
        @content = content
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|   #Ouvrir le csv en mode écriture ab, qui a pour chemin "./db..."
    csv << [@author, @content]
    end
  end
  
  #renvoie une liste de tous les gossips
  def self.all
    all_gossips = [] #initialise un array vide
    CSV.read("./db/gossip.csv").each do |csv_line|
        all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
  return all_gossips
  end

  def self.find(id)
  #Associe à author l'auteur du potin à l'id fixé dans l'url
 @author = self.all[id.to_i].author
 @content = self.all[id.to_i].content
  return [@author, @content]
  end

end



#binding.pry

#En une seule ligne : 
 #return [self.all[id.to_i].author,  self.all[id.to_i].content].join(" à écrit : ")

    
