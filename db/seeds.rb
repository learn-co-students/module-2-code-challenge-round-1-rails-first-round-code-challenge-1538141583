Heroine.destroy_all
Power.destroy_all

powers = [
  {name:"super strength", description: "gives the wielder super-human strengths" },
  {name:"flight", description: "gives the wielder the ability to fly through the skies at supersonic speed" },
  {name:"super human senses", description: "allows the wielder to user her senses at a super-human level" },
  {name:"elasticity", description: "can stretch the human body to extreme lengths" },
]

powers.each {|power| Power.create(power)}

heroines = [
  {name: "Kamala Khan", super_name: "Ms. Marvel", img_url: "https://icdn2.digitaltrends.com/image/kamala-khan-ms-marvel.jpg"},
  {name: "Doreen Green", super_name: "Squirrel Girl", img_url: "https://www.slashfilm.com/wp/wp-content/images/squirrelgirl-newwarriors-comiccover.jpg"},
  {name:"Gwen Stacy", super_name:"Spider-Gwen", img_url: "https://vignette.wikia.nocookie.net/thedailybugle/images/a/ad/Spider-Gwen_001.png/revision/latest?cb=20160825164441"},
  {name:"Janet Van Dyne", super_name:"The Wasp", img_url: "https://media.wired.com/photos/5b36b0e59429444844cd0918/master/pass/final.jpg"},
  {name:"Wanda Maximoff", super_name:"Scarlet Witch", img_url: "https://images-na.ssl-images-amazon.com/images/S/cmx-images-prod/Series/42726/42726._SX360_QL80_TTD_.jpg"},
  {name:"Carol Danvers", super_name:"Captain Marvel", img_url: "https://images.complex.com/complex/images/c_limit,w_680/fl_lossy,pg_1,q_auto/if7wyrvfdrzstf5zdsen/captain-marvel"},
  {name:"Jean Grey", super_name:"Dark Phoenix", img_url: "http://sm.ign.com/t/ign_in/gallery/d/dark-phoen/dark-phoenix-every-character-confirmed-for-foxs-next-x-men-m_mhuf.640.jpg"},
  {name:"Ororo Munroe", super_name:"Storm", img_url: "https://www.syfy.com/sites/syfy/files/styles/1200x1200/public/wire/legacy/storm-feat-630x420.jpg?itok=5Pp4TeCz&timestamp=1497663261"},
  {name:"Kitty Pryde", super_name:"Shadowcat", img_url: "https://fsmedia.imgix.net/06/86/8a/09/c53f/4492/8ab4/93edbdd5cb6e/shadowcat---lockheedjpg.jpeg?rect=0%2C216%2C680%2C341&dpr=2&auto=format%2Ccompress&w=650"},
  {name:"Elektra Natchios", super_name:"Elektra", img_url: "https://nerdist.com/wp-content/uploads/2016/11/elektra-header.jpg"}
]

# ---------------
# POWERFUL HEROINES:
# Once you set up your tables and associations the way you want them, you can
# uncomment the following method to associate heroine with a power!
# Just uncomment line 33 and run `rake db:seed` again in your terminal.
# (******Note****** If you try to do this before you set up proper associations, it will error.)
# ---------------
heroines = heroines.map { |heroine| heroine.merge( { power_id: Power.all.sample.id } ) }

# ---------------

heroines.each { |heroine| Heroine.create(heroine) }

squirrel_powers = Power.create(name:"SQUIRREL POWERS", description: "All the powers of a squirrel! And can talk to squirrels!")
squirrel_girl = Heroine.find_by(super_name: "Squirrel Girl").update(power_id: squirrel_powers.id)
