public class animalTransfer {
    public Animal animal;

	public class Animal {
		public Integer id;
		public String name;
		public String eats;
		public String says;
	}

	
	public static animalTransfer parse(String json) {
		return (animalTransfer) System.JSON.deserialize(json, animalTransfer.class);
	}

}