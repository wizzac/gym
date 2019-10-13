package security

class ReflectionController {

	def showFile(){
		String line = "";
		String cont = "";
		try{
			File f = new File(".");
			println f.getAbsolutePath() + " -- " + f.exists();
			File file = new File(params.file);
			println file.getAbsolutePath() + " -- " + file.exists();
			println file.getCanonicalPath() + " -- " + file.exists();
			if (file.exists()){
				if (file.isDirectory()){
					cont="<html>";
					cont += "<body>";
										cont += "<h1>" + file.getCanonicalPath() + "</h1>"
					File [] dirlist = file.listFiles();
					line = "<a href='" + request.contextPath + "/" + this.controllerName + "/" + this.actionName + "?file=" + (file.getCanonicalPath()).replace('\\', '/') + "/.." + "'>" + ".." + "</a>";
					cont += line + "<br>";
					for (File d in dirlist){
						line = "<a href='" + request.contextPath + "/" + this.controllerName + "/" + this.actionName + "?file=" + (d.getCanonicalPath()).replace('\\', '/') + "'>" + d.getName() + "</a>";
						cont += line + "<br>";
					}
					cont += "</body>";
					cont += "</html>";

				} else {
					FileReader fr = new FileReader(file);
					BufferedReader br = new BufferedReader(fr);
					int i = 0;
					boolean seguir = true;
					while((i<10000) && seguir){
						line = br.readLine()
						i++;
						if (line!= null){
							cont += line + "\n";
						} else {
							seguir = false;
						}
					}
					br.close();
					fr.close();
				}
			}
		} catch (Exception ex){
			ex.printStackTrace();
		}
		render cont;
	}

}
