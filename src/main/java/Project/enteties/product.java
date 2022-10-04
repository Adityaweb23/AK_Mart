package Project.enteties;

public class product {
	private int pid;
	private String ptitle;
	private int price;
	private String pdescription;
	private String pimage;
	private int cid;
	
	public product() {
		
	}

	public product(String ptitle, int price, String pdescription, String pimage, int cid) {
		super();
		this.ptitle = ptitle;
		this.price = price;
		this.pdescription = pdescription;
		this.pimage = pimage;
		this.cid = cid;
	}

	public product(int pid, String ptitle, int price, String pdescription, String pimage, int cid) {
		super();
		this.pid = pid;
		this.ptitle = ptitle;
		this.price = price;
		this.pdescription = pdescription;
		this.pimage = pimage;
		this.cid = cid;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPdescription() {
		return pdescription;
	}

	public void setPdescription(String pdescription) {
		this.pdescription = pdescription;
	}

	public String getPimage() {
		return pimage;
	}

	public void setPimage(String pimage) {
		this.pimage = pimage;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}
}
