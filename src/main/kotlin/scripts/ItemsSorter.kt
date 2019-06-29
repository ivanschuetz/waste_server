package scripts

import scripts.ItemsRow.Blank
import scripts.ItemsRow.Comment
import scripts.ItemsRow.ItemEntry
import scripts.ItemsRow.ItemToCategoryEntry
import java.io.File

fun main() {
    val input = File("./src/main/resources/items_input.sql")
    val itemRows = input.readLines().map { toItemRow(it) }

    val output = File("./src/main/resources/items.sql")
    if (output.exists()) {
        output.delete()
    }
    output.createNewFile()

    val itemToCategoriesMap = itemRows.filterIsInstance(ItemToCategoryEntry::class.java).groupBy { it.itemId }

    val itemsWithAssociations = itemRows.filterIsInstance(ItemEntry::class.java).map { itemEntry ->
        itemToCategoriesMap[itemEntry.id]?.let {
            ItemEntryWithCategoryAssociations(itemEntry, it)
        } ?: {
            throw Error("Invalid state: Item isn't associated with any category. Should be commented out: ${itemEntry}") // To not show empty results in client
        } ()
    }

    // Sort by name and overwrite ids
    val sortedItemsWithAssociations = itemsWithAssociations.sortedBy { it.itemEntry.name }.mapIndexed { index, entry ->
        ItemEntryWithCategoryAssociations(
            ItemEntry(index.toLong(), entry.itemEntry.name),
            entry.associations.map {
                ItemToCategoryEntry(index.toLong(), it.categoryId)
            }
        )
    }

    val comments = itemRows.filterIsInstance(Comment::class.java)

    val outputRows: List<ItemsRow> = sortedItemsWithAssociations.flatMap {
        listOf(it.itemEntry) + it.associations + listOf(Blank)
    } + comments

    for (outputRow in outputRows) {
        when(outputRow) {
            is ItemEntry -> "INSERT INTO item(id, name) VALUES(${outputRow.id}, '${outputRow.name}');\n"
            is ItemToCategoryEntry -> "INSERT INTO item_category(item_id, category_id) VALUES(${outputRow.itemId}, ${outputRow.categoryId});\n"
//            is Comment -> outputRow.str + "\n"
            is Comment -> null
            is Blank -> "\n"
        }.let { lineMaybe ->
            lineMaybe?.let { output.appendText(it) }
        }
    }

    println("Finished generating items output file.")
}

private fun toItemRow(line: String): ItemsRow = when {
    line.isBlank() -> Blank
    line.startsWith("--") -> Comment(line)
    else -> {
        toItemEntry(line) ?: {
            toItemToCategoryEntry(line) ?: {
                throw Error("Unexpected line format: $line")
            }()
        }()
    }
}

private fun toItemEntry(line: String): ItemEntry? {
    val itemRegex = """INSERT INTO item\(.*VALUES\((.*?),.*?'(.*?)'.*""".toRegex()
    return itemRegex.find(line)?.groupValues?.let { values ->
        ItemEntry(values[1].toLong(), values[2])
    }
}

private fun toItemToCategoryEntry(line: String): ItemToCategoryEntry? {
    val itemRegex = """INSERT INTO item_category\(.*VALUES\((.*?),.\s*?(.*?)\).*""".toRegex()
    return itemRegex.find(line)?.groupValues?.let { values ->
        ItemToCategoryEntry(values[1].toLong(), values[2].toLong())
    }
}

sealed class ItemsRow {
    data class ItemEntry(val id: Long, val name: String) : ItemsRow()
    data class ItemToCategoryEntry(val itemId: Long, val categoryId: Long) : ItemsRow()
    object Blank : ItemsRow()
    data class Comment(val str: String) : ItemsRow()
}

data class ItemEntryWithCategoryAssociations(val itemEntry: ItemEntry, val associations: List<ItemToCategoryEntry>)
