leaf<- read.csv("leaf.csv", header = F)

colnames(leaf)<-c("Species", "Specimen Number", "Eccentricity", "Aspect Ratio", "Elongation", "Solidity", "Stochastic Convexity", "Isoperimetric Factor", "Maximal Indentation Depth", "Lobedness", "Average Intensity", "Average Contrast", "Smoothness", "Third moment", "Uniformity", "Entropy")

leaf$Species <- as.factor(leaf$Species)

leaf$`Specimen Number`<-NULL

levels(leaf$Species)<- c("Quercus suber", "Salix atrocinera", "Populus nigra", "Alnus sp.","Quercus robur","Crataegus monogyna","Ilex aquifolium", "Nerium oleander", "Betula pubescens", "Tilia tomentosa", "Acer palmatum", "Celtis sp.", "Corylus avellana", "Castanea sativa", "Populus alba",  "Primula vulgaris", "Erodium sp.", "Bougainvillea sp.", "Arisarum vulgare", "Euonymus japonicus", "Ilex perado ssp. azorica", "Magnolia soulangeana", "Buxus sempervirens", "Urtica dioica", "Podocarpus sp.", "Acca sellowiana", "Hydrangea sp.", "Pseudosasa japonica", "Magnolia grandiflora", "Geranium sp.")
