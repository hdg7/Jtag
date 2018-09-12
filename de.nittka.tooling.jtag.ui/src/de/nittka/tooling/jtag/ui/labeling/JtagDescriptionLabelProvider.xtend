/*
* generated by Xtext
*/
package de.nittka.tooling.jtag.ui.labeling

import de.nittka.tooling.jtag.jtag.JtagPackage
import org.eclipse.xtext.resource.IEObjectDescription
import org.eclipse.xtext.resource.IReferenceDescription
import org.eclipse.xtext.resource.IResourceDescription
import org.eclipse.xtext.ui.label.DefaultDescriptionLabelProvider

//import org.eclipse.xtext.resource.IEObjectDescription

/**
 * Provides labels for a IEObjectDescriptions and IResourceDescriptions.
 * 
 * see http://www.eclipse.org/Xtext/documentation.html#labelProvider
 */
class JtagDescriptionLabelProvider extends DefaultDescriptionLabelProvider {

	// Labels and icons can be computed like this:
	
	override text(IEObjectDescription ele) {
		if(ele.EClass===JtagPackage.Literals.FILE){
			val title=ele.getUserData("title")
			return (if(title!==null)'''«ele.name» - «title»''' else '''«ele.name»''').toString
		} else if(ele.EClass===JtagPackage.Literals.SEARCH){
			return ele.qualifiedName.toString
		}
		super.text(ele)
	}

	override image(IEObjectDescription ele) {
		val clazz = ele.EClass
		switch clazz{
			case JtagPackage.eINSTANCE.file: return JtagLabelProvider.getJtagFileIcon(ele.qualifiedName.toString)
			case JtagPackage.eINSTANCE.jtagConfig: return "categorytype.gif"
			case JtagPackage.eINSTANCE.search: return "search.png"
		} 
	}

	override image(IResourceDescription element) {
		if(!element.getExportedObjectsByType(JtagPackage.eINSTANCE.file).empty){
			return "folder.png"
		} else if(!element.getExportedObjectsByType(JtagPackage.eINSTANCE.categoryType).empty){
			return "categories.gif"
		} else{
			return "searches.png"
		}
	}

	override text(IReferenceDescription referenceDescription) {
		if(referenceDescription.sourceEObjectUri.toString.contains("/@search/")){
			return "unnamed search"
		}
	}

	override image(IReferenceDescription referenceDescription) {
		if(referenceDescription.sourceEObjectUri.toString.contains("/@search/")){
			return "search.png"
		}
	}

}
