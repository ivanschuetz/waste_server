package com.schuetz.waste

data class DisposalOptionsResult(val categories: List<CategoryDTO>,
                                 val containers: List<ContainerDTO>,
                                 val recipients: List<RecipientDTO>,
                                 val tips: List<TipDTO>)
