package com.schuetz.waste

data class DisposalOptionsResult(val categories: List<CategoryDTO>,
                                 val containers: List<ContainerDTO>,
                                 val pContainers: List<PContainerDTO>,
                                 val companies: List<PickupCompanyResultDTO>)
