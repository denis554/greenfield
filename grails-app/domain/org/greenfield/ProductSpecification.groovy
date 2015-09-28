package org.greenfield

class ProductSpecification {

	SpecificationOption specificationOption
	
	static belongsTo = [ product: Product ]

	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		id generator: 'sequence', params:[sequence:'ID_PRODUCT_SPECIFICATION_PK_SEQ']
    }
	
}
