require 'nokogiri'
require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# ADMIN TESTING SEED

# 50.times do
#   pw = "12345678"
#   User.create(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     salutation: Faker::Name.prefix,
#     email: Faker::Internet.email,
#     password: "12345678",
#     password_confirmation: "12345678",
#     phone_number: Faker::PhoneNumber.phone_number,
#     user_type: "citizen",
#     vat_number: Faker::Number.number(8),
#     active: true)
# end



# 100.times do
#   Transaction.create(
#     transaction_type: "transfer",
#     sender: Account.all.sample,
#     receiver: Account.all.sample,
#     amount: rand(10..150),
#     reference: "DFCH-Z4353V",
#     status: "confirmed",
#     communication: "my favorite transaction")
# end

# 1 - USERS
# 1A - CITIZENS

user1 = User.new(
  first_name: "Frederic",
  last_name: "Lambrechts",
  salutation: "Mr.",
  email: "f.lambrechts@gmail.com",
  password: "12345678",
  password_confirmation: "12345678",
  phone_number: "+32478132163",
  user_type: "citizen",
  vat_number: "",
  pin: "123456",
  active: true,
  admin: true)
user1.save

user2 = User.new(
  first_name: "Ruben",
  last_name: "Brands",
  salutation: "Mr.",
  email: "ruben@ruben.com",
  password: "12345678",
  password_confirmation: "12345678",
  phone_number: "+32478132163",
  user_type: "citizen",
  vat_number: "",
  pin: "123456",
  active: true)
user2.save

user3 = User.new(
  first_name: "Martin",
  last_name: "Van Aken",
  salutation: "Mr.",
  email: "martin@joyouscoding.com",
  password: "12345678",
  password_confirmation: "12345678",
  phone_number: "+32486899652",
  user_type: "citizen",
  vat_number: "",
  pin: "123456",
  active: true)
user3.save

user4 = User.new(
  first_name: "Anne",
  last_name: "Collet",
  salutation: "Mme.",
  email: "collet.anne@gmail.com",
  password: "12345678",
  password_confirmation: "12345678",
  phone_number: "+32476785764",
  user_type: "citizen",
  vat_number: "",
  pin: "123456",
  active: true)
user4.save

# B - SHOPS

user10 = User.new(
  user_type: "shop",
  shopname: "Champs Libres",
  email: "info@champs-libres.coop",
  description: "Champs Libres fournit des services en logiciels libres. La coopérative crée des applications ou du support pour les logiciels existants. Son originalité consiste à concevoir, pour ses clients, des solutions informatiques qui allient la simplicité d’usage et la garantie de la liberté de l’utilisateur : pas de licence à renouveler, pas de contrainte vis-à-vis d’un éditeur de logiciels, … La coopérative Champs Libres, c’est toute la puissance du libre à votre portée ! Champs Libres est spécialisée dans la géomatique : le traitement d’informations géographiques par l’informatique. Cette activité pointue se décline dans divers domaines tels que l’élaboration de cartes en papier, pour le web ou l’analyse de données complexes. La petite équipe développe aussi des applications pour le suivi social, à travers le logiciel Chill (http://demo.chill.social). Champs Libres est une société coopérative à finalité sociale. Ses clients sont essentiellement d’autres entreprises à finalité sociale, des associations ou des pouvoirs publics. Membre du réseau « Libre Entreprise » (www.libre-entreprise.org/), Champs Libres y partage, avec les autres partenaires, les mêmes valeurs et modes de fonctionnement  fondés sur la démocratie, la transparence et la compétence. Cet échange permet à Champs Libres de vous proposer également des services du réseau en Valeureux.",
  website: "http://www.champs-libres.coop/",
  address: "Rue Jean Bury, 23 4000 Liège",
  password: "12345678",
  password_confirmation: "12345678",
  phone_number: "+32478132163",
  vat_number: "",
  pin: "123456",
  active: true
  )
user10.save

user11 = User.new(
  user_type: "shop",
  shopname: "La Bourrache",
  email: "info@labourrache.org",
  description: "La Bourrache est une entreprise sociale qui possède des valeurs sociales et environnementales fortes. Elle est active dans la formation en maraîchage biologique et en entretien écologique de jardins. Pour profiter de leurs délicieux légumes, plusieurs options s’offrent à vous : soit en vous abonnant à leurs paniers de légumes, soit en venant acheter les légumes en vrac directement sur le terrain (entre juin et novembre). Les légumes de La Bourrache sont aussi vendus dans différents magasins bio à Liège. En ce qui concerne les services d’entretiens de jardins, vous pouvez faire aménager ou entretenir votre jardin par une équipe de La Bourrache.Il vous suffit de contacter le formateur « parcs et jardins » de La Bourrache au 0487/412.908, qui vous proposera de vous rencontrer afin de faire le point sur vos attentes et vous remettra un devis gratuit pour les travaux envisagés. Ce service est écologique parce que nous n’utilisons pas de pesticides ni de produits chimiques pour réaliser les travaux.",
  website: "www.labourrache.org",
  address: "Rue du Beau-Mur 48 4030 Liege",
  password: "12345678",
  password_confirmation: "12345678",
  phone_number: "+32478132163",
  vat_number: "",
  pin: "123456",
  active: true
  )
user11.save

user12 = User.new(
  user_type: "shop",
  shopname: "Vive le vin",
  email: "info@vivelevin.be",
  description: "Vive le vin sélectionne avec soin, pour vous, des vins de France et du monde provenant majoritairement de l’agriculture bio ou de la culture en biodynamique. Vous y trouverez des vins de qualité, authentiques et originaux : Philippe Devos travaille directement avec les domaines ! Vive le vin propose plusieurs service comme la préparation de votre commande, la reprise des bouteilles non consommées lors d’un événement, l‘organisation de dégustation privées, la visite de la cave. Les vendredis d’été ensolleillé, Vive le vin organise des apéros dans son jardin. Vive le vin, c’est une invitation à la découverte. Philippe Devos partagera, avec plaisir, ses conseils avisés pour guider votre choix vers le vin qui vous plaira !",
  website: "www.vivelevin.be",
  address: "Rue des Vennes, 214 4020 Liège",
  password: "12345678",
  password_confirmation: "12345678",
  phone_number: "+32478132163",
  vat_number: "",
  pin: "123456",
  active: true
  )
user12.save

user13 = User.new(
  user_type: "shop",
  shopname: "RElab",
  email: "ben@relab.be",
  description: "Le RElab, est le premier FabLab de Wallonie. Fab Lab (de « fabrication laboratory » en anglais) est un lieu ouvert au public proposant toutes sortes d’outils, notamment des machines-outils pilotées par ordinateur, pour la conception et la réalisation d’objets. Les Fab Lab s’adressent aux entrepreneurs, aux designers, aux artistes, aux bricoleurs, aux étudiants ou aux hackers en tout genre, qui veulent accéder plus facilement aux phases de prototypage et de mise au point de leurs idées pour déployer plus rapidement leur projet. Ils constituent également un espace de rencontre et de création collaborative qui permet, entre autres, de fabriquer des objets uniques: objets décoratifs, objets de remplacement, prothèses, orthèses, outils… Comme tout Fab Lab, le RElab de Liège est donc un atelier numérique ouvert au public et une structure de développement créatif local. Ceci dit, la spécificité du RElab de Liège réside dans l’utilisation de matériaux de récupération comme matière première et dans l’étude de nouveaux procédés sociaux, créatifs et économiques de surcyclage (« upcycling » en anglais), en liaison avec les nouveaux moyens de fabrication et de communication numérique. Le RElab, c’est aussi une équipe pluridisciplinaire composée d’artistes numériques, de designers, de web developers, tous connectés grâce à leur passion pour les nouvelles technologies et encadrés par la structure administrative de l’asbl ETNIK’Art.",
  website: "www.relab.be",
  address: "Rue Lambert Lombard, 1 4000 Liège",
  password: "12345678",
  password_confirmation: "12345678",
  phone_number: "+32478132163",
  vat_number: "",
  pin: "123456",
  active: true
  )
user13.save

user14 = User.new(
  user_type: "shop",
  shopname: "Maison des Cyclistes",
  email: "liege@maisondescyclistes.be",
  description: "La Maison des Cyclistes est un lieu d’accueil pour tous : cyclistes du quotidien, touristes ou néophytes. L’objectif de la Maison des Cyclistes est de conforter le (futur) cycliste (quotidien) dans son choix de mobilité en lui proposant une série de services : un atelier de réparation, la possibilité de louer ou de tester des vélos, un atelier libre-service, l’occasion de graver gratuitement son numéro d’identité nationale sur le cadre de son vélo, des formations à l’entretien ou à la réparation de son vélo, une boutique, des informations et des conseils. Idéalement située à la gare de Liège Guillemins, la Maison des Cyclistes renseigne les cyclistes liégeois comme les gens de passage sur les activités événementielles ou touristiques, les parkings pour vélo, les itinéraires utiles et sur les différentes facilités mises à disposition de tous ceux qui veulent découvrir ou vivre Liège en vélo ! Gérée par Pro Velo SERVICE, la Maison des Cyclistes fait partie du réseau des points vélo. Elle accepte les Valeureux pour tous ses services sauf pour la location des vélos de la Ville de Liège (Vélocité).",
  website: "http://www.maisondescyclistes.be/contacts/liege",
  address: "Place des Guillemins, 2 4000 Liège",
  password: "12345678",
  password_confirmation: "12345678",
  phone_number: "+32478132163",
  vat_number: "",
  pin: "123456",
  active: true
  )
user14.save

user15 = User.new(
  user_type: "shop",
  shopname: "Tricotea",
  email: "",
  description: "Après quelques années passées dernière un bureau à Namur, Géraldine a fait de sa passion pour la laine et le tricot, sa reconversion ! En octobre dernier, Géraldine a donc ouvert une petite boutique dans le Laveu. Si l’on y trouve de la laine de toutes les couleurs, des crochets, Tricotea est plus qu’un simple magasin. En effet, Géraldine a voulu aménager un espace convivial et chaleureux où chacun peut venir passer un moment en toute quiétude loin du stress de la ville. Autour de la grande table, c’est en sirotant un bon thé et en bavardant que les clients tricotent et profitent des précieux conseils de Géraldine. Pour ceux qui souhaitent progresser dans l’art de confectionner bonnets, écharpes et pulls pour l’hiver, des ateliers sont programmés certains soirs. Débutants et confirmés y trouvent leur bonheur !",
  website: "www.tricotea.be",
  address: "Rue du Laveu, 30 4000 Liège",
  password: "12345678",
  password_confirmation: "12345678",
  phone_number: "+32478132163",
  vat_number: "",
  pin: "123456",
  active: true
  )
user15.save

user16 = User.new(
  user_type: "shop",
  shopname: "Graines d’épices",
  email: "",
  description: "Graines d’épices Graines d’épices Graines d’épices Graines d’épices Graines d’épices",
  website: "https://fr-fr.facebook.com/graines.depices",
  address: "Rue de Serbie, 7 4000 Liège",
  password: "12345678",
  password_confirmation: "12345678",
  phone_number: "+32478132163",
  vat_number: "",
  pin: "123456",
  active: true
  )
user16.save

user17 = User.new(
  user_type: "shop",
  shopname: "Peuchère",
  email: "",
  description: "Jamila a ouvert son épicerie en février 2013 place Général Leman. Son pari : rendre le bio accessible au plus grand nombre et combattre l’idée que le bio, c’est forcément cher.Pour Jamila, la seule manière de contrecarrer les multinationales, le système et la malbouffe qui nous sape la santé, c’est le circuit court, la nourriture biologique et naturelle. Osons Bio Peuchère vous propose, entre autres, un vaste choix de produits laitiers régionaux, du poulet belge, du pain et des pâtisseries de chez « Le Pont » (une entreprise de formation par le travail de Sprimont), des fruits de Crisnée, des céréales et des fruits secs en vrac et une grande variété de légumes. Jamila peut également vous préparer votre panier composé selon vos goûts ! Avec Osons Bio peuchère, le prix n’est plus une excuse !",
  website: "www.facebook.com/PeuchereOsonsBio",
  address: "Place Général Leman, 43 4000 Liège",
  password: "12345678",
  password_confirmation: "12345678",
  phone_number: "+32478132163",
  vat_number: "",
  pin: "123456",
  active: true
  )
user17.save

user18 = User.new(
  user_type: "shop",
  shopname: "Temps des Cerises",
  email: "tdcerises@skynet.be",
  description: "Le Temps des Cerises vous propose fruits, légumes et produits frais variés, ainsi qu’une sélection de délicieux pains frais et une gamme de pâtisseries variées. Vous trouverez également, en magasin, une large gamme de produits alimentaires de qualité bio et souvent locaux. Le Temps des Cerises, c’est aussi un comptoir crèmerie à la découpe, avec un beau choix de fromages de la région et une sélection de céréales, de légumineuses et de fruits secs en vrac. Vous y trouverez aussi la possibilité de remplir vos bidons d’adoucissant, de produit pour la lessive ou la vaisselle. Le Temps des Cerises est un endroit chaleureux ou une équipe informée et motivée vous conseille sans hésiter ! Au Temps des Cerises, faire ses courses n’est décidément plus une corvée !",
  website: "www.tdcerises.be",
  address: "Rue du Laveu, 20 4000 Liège",
  password: "12345678",
  password_confirmation: "12345678",
  phone_number: "+32478132163",
  vat_number: "",
  pin: "123456",
  active: true
  )
user18.save

user19 = User.new(
  user_type: "shop",
  shopname: "Un Pain c'est tout",
  email: "ags.asbl@gmail.com",
  description: "Situé au 20 rue de la Loi, dans un quartier d’Outremeuse où vivent étudiants, jeunes ménages et personnes âgées, la boulangerie et son atelier préservent le calme de cette charmante place et ont su recréer une cohabitation entre activités artisanales et habitat. Mais « Un pain c’est tout ! », c’est surtout du bon pain, du pain à l’ancienne, goûteux et bourratif, du pain sain et bon afin de lutter contre la malbouffe et le pain industriel ! La boulangerie vous propose donc pains, croissants, miches, gosettes, demi-tartes aux fruits de saison, craquelins d’épeautre, entre autres. À côté de la boulangerie, le rayon épicerie fine s’étoffe au fil des rencontres avec les artisans locaux. Aujourd’hui, on vous y propose huile d’olive, épices, confitures, sirops, fromages, légumes, miel, saucissons et produits laitiers locaux ! « Un pain c’est tout!” est également un lieu de dépôt pour les paniers bio de l’asbl Cynorhodon.",
  website: "",
  address: "Rue de la Loi, 20 4020 Liège",
  password: "12345678",
  password_confirmation: "12345678",
  phone_number: "+32478132163",
  vat_number: "",
  pin: "123456",
  active: true
  )
user19.save

user20 = User.new(
  user_type: "shop",
  shopname: "La Barricade",
  email: "info@barricade.be",
  description: "Lieu d’émancipation collective et de création d’alternatives, l’asbl Barricade s’est développée depuis 1996 dans le quartier de Pierreuse à Liège via diverses expérimentations culturelles, sociales et économiques. Sa librairie Entre-Temps, à la fois militante et généraliste, est emblématique du projet. À l’intersection du secteur de l’économie sociale et de l’éducation permanente, elle revendique un fonctionnement autogestionnaire ainsi qu’une finalité culturelle et sociale plutôt que de profit. Barricade est également un espace public de débat et une plate-forme favorisant la rencontre des différents mondes militants, de l’éducation permanente à l’altermondialisme en passant par la coopération au développement, l’économie sociale et solidaire ou encore les syndicats et les mutuelles. En pratique, Barricade, c’est un espace qui propose un café-librairie « Entre-Temps », une revuethèque, un espace d’exposition, un Groupe d’Achat Commun (GAC), des conférences-débats, des Midis de l’égalité, des tables de conversation féministe en anglais, des rencontres littéraires, des ateliers de théâtre forum, des ateliers d’écriture mais aussi des veillées contes, des concerts, des spectacles et, depuis 2011, des activités de recherche et de publication.",
  website: "www.barricade.be",
  address: "Rue Pierreuse 19 4000 Liège",
  password: "12345678",
  password_confirmation: "12345678",
  phone_number: "+32478132163",
  vat_number: "",
  pin: "123456",
  active: true
  )
user20.save

user21 = User.new(
  user_type: "shop",
  shopname: "Al’Binète",
  email: "liege@albinete.be",
  description: "L’histoire commence en 1984, Paul Mathieu et son épouse lancent une petite entreprise de production maraîchère à Saint Georges et vendent leurs fruits et légumes 100% biologiques sur leur étal de quatre mètres au marché de Verviers. Sept ans plus tard, l’étal a doublé, la clientèle a grandi, s’est diversifiée. Le 1er avril 1991, avec Philippe Schoenmackers, nos pionniers créent la coopérative Al’Binète. La coopérative compte aujourd’hui deux points de vente, au Centre ville de Liège et à Rocourt. A deux pas des bâtiments de l’université au XX août, la coopérative liégeoise s’épanouit désormais sur 210 m², et est devenue une des références liégeoises en matière d’alimentation biologique. Un système de nébulisation assure aux légumes une conservation et une fraîcheur naturelles. On y trouve également un grand choix de compléments alimentaires, d’huiles essentielles, de cosmétiques bio et de produits spécifiques aux régimes particuliers",
  website: "www.albinete.be",
  address: "Place Cockerill, 18 4000 Liège",
  password: "12345678",
  password_confirmation: "12345678",
  phone_number: "+32478132163",
  vat_number: "",
  pin: "123456",
  active: true
  )
user21.save

# 2 - TRANSACTIONS - TRANSFERS

20.times do
  Transaction.create(
    transaction_type: "transfer",
    sender: User.all.sample.account,
    receiver: User.all.sample.account,
    amount: rand(10..150),
    status: "confirmed",
    communication: "sample text")
end

# 3 - TRANSACTIONS - QRTRANSFERS

20.times do
  Transaction.create(
    transaction_type: "qrtransfer",
    sender: User.all.sample.account,
    receiver: User.all.sample.account,
    amount: rand(10..150),
    status: "confirmed",
    communication: "sample text")
end

# 4 - TOPUPS

# 20.times do
#   Topup.create(
#     receiver: User.all.sample.account,
#     sender: User.first.account,
#     amount: rand(10..150),
#     status: "confirmed",
#     reference: "your top up")
# end

# url = "http://valeureux.be/les-commerces/"

# doc = Nokogiri::HTML(open(url))

# links = doc.css(".valquoi a").map do |link |
#  link.attr("href")
# end

# links.each do |url|
#   shop = Nokogiri::HTML(open(url))
#   user = {}
#   shop.xpath("//meta").each do |elem|
#     user[:shopname] = elem.attr("content") if elem.attr("property") == "og:title"
#     user[:description] = elem.attr("content") if elem.attr("property") == "og:description"
#     allmails = shop.xpath('//a[starts-with(@href, "mailto")]').map { |elem| elem.attr('href')}
#     allmails.delete("mailto:info@valeureux.be")
#     mail = allmails.first
#     mail.to_s.slice! "mailto:"
#     user[:email] = mail
#   end
#   User.create(
#     shopname: user[:shopname],
#     description: user[:description],
#     address: "",
#     website: "",
#     phone_number: "",
#     email: user[:email],
#     password: "12345678",
#     password_confirmation: "12345678",
#     user_type: "shop",
#     vat_number: "BE035345745",
#     active: true
#     )
# end


