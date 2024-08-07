/*TODO: Make this not shitcurdy
/datum/individual_objective/familiar_face
	name = "A Familiar Face"
	req_department = list(DEPARTMENT_SECURITY)
	var/mob/living/carbon/human/target

/datum/individual_objective/familiar_face/can_assign(mob/living/L)
	if(!..())
		return FALSE
	var/list/candidates = (GLOB.player_list & GLOB.living_mob_list & GLOB.human_mob_list) - L
	return candidates.len

/datum/individual_objective/familiar_face/assign()
	..()
	var/list/candidates = (GLOB.player_list & GLOB.living_mob_list & GLOB.human_mob_list) - mind_holder
	target = pick(candidates)
	desc = "You swear you saw to [target] somewhere before, and in your line of job it cannot mean good. Search them, \
	remove their backpack or empty their pockets."
	RegisterSignal(mind_holder, COMSIG_EMPTY_POCKETS, PROC_REF(task_completed))

/datum/individual_objective/familiar_face/task_completed(n_target)
	if(n_target == target)
		completed()

/datum/individual_objective/familiar_face/completed()
	if(completed) return
	UnregisterSignal(mind_holder, COMSIG_EMPTY_POCKETS)
	..()
*/
/datum/individual_objective/time_to_action
	name = "Time for Action"
	req_department = list(DEPARTMENT_SECURITY, DEPARTMENT_BLACKSHIELD)
	units_requested = 20

/datum/individual_objective/time_to_action/assign()
	..()
	desc = "Slay or observe the slaying of 20 hostiles (Roaches, Spiders, ect)."
	RegisterSignal(mind_holder, COMSIG_MOB_DEATH, PROC_REF(task_completed))

/datum/individual_objective/time_to_action/task_completed(mob/mob_death)
	..(1)

/datum/individual_objective/time_to_action/completed()
	if(completed) return
	UnregisterSignal(owner, COMSIG_MOB_DEATH)
	..()
/* TODO: make this not be shitcurdy
/datum/individual_objective/paranoia
	name = "Paranoia"
	req_department = list(DEPARTMENT_SECURITY)
	var/list/vitims = list()

/datum/individual_objective/paranoia/assign()
	..()
	units_requested = rand(3,4)
	desc = "The criminals are here, somewhere, you can feel that. Search [units_requested] people, \
			remove their backpack or empty their pockets."
	RegisterSignal(mind_holder, COMSIG_EMPTY_POCKETS, PROC_REF(task_completed))

/datum/individual_objective/paranoia/task_completed(mob/living/carbon/n_target)
	if((n_target in vitims) || !n_target.client)
		return
	vitims += n_target
	..(1)

/datum/individual_objective/paranoia/completed()
	if(completed) return
	UnregisterSignal(mind_holder, COMSIG_EMPTY_POCKETS)
	..()
*/
/*
/datum/individual_objective/danger
	name = "Absolute Danger"
	req_department = list(DEPARTMENT_SECURITY)
	limited_antag = TRUE
	rarity = 4
	var/obj/item/target

/datum/individual_objective/danger/can_assign(mob/living/L)
	if(!..())
		return FALSE
	return pick_faction_item(L)

/datum/individual_objective/danger/assign()
	..()
	target = pick_faction_item(mind_holder)
	desc = "\The [target] is clear danger to colony. Destroy it with any means possible."
	RegisterSignal(mind_holder, COMSIG_OBJ_FACTION_ITEM_DESTROY, PROC_REF(task_completed))

/datum/individual_objective/danger/task_completed(obj/item/I)
	if(target.type == I.type)
		..(1)

/datum/individual_objective/danger/completed()
	if(completed) return
	UnregisterSignal(mind_holder, COMSIG_OBJ_FACTION_ITEM_DESTROY)
	..()
*/
/datum/individual_objective/guard
	name = "Guard"
	req_department = list(DEPARTMENT_SECURITY, DEPARTMENT_BLACKSHIELD)
	var/area/target_area

/datum/individual_objective/guard/assign()
	..()
	target_area = random_ship_area()
	desc = "[target_area] needs fortification for colony safety. All sorts of bugs and monsters tunnel into the colony constantly. Have a turret built there, preferably an Artificer Guild turret."
	RegisterSignal(target_area, COMSIG_TURRENT, PROC_REF(task_completed))

/datum/individual_objective/guard/task_completed()
		completed()

/datum/individual_objective/guard/completed()
	if(completed) return
	UnregisterSignal(target_area, COMSIG_TURRENT)
	..()
