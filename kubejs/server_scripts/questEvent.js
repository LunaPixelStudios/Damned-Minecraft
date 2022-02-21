// this will only fire for quests tagged with "codex"
onEvent('ftbquests.completed.#codex', event => {
    if(event.object.objectType.id == "quest") {
        const task = event.object.tasks[0]
        const first = true
        event.player.clear(Ingredient.custom((stack) => {
            if(first && task.test(stack.stack)) {
                first = false;
                return true;
            }
            return false;
        }))
    }
})