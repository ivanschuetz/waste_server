package com.schuetz.waste

data class DisposalOptionsResult(val categories: List<CategoryDTO>,
                                 val containers: List<ContainerDTO>,
                                 val itemRecipients: List<RecipientDTO>,
                                 val categoryRecipients: List<RecipientDTO>,
                                 val itemTips: List<TipDTO>,
                                 val categoryTips: List<TipDTO>)
