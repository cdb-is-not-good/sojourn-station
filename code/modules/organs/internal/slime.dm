/obj/item/organ/internal/bone/slime
	name = "Aulvae cytostructures"
	desc = "The Aulvae equivalent of a 'bone', this cartilaginous slime act as both bone, nerve & muscle all in one."
	icon_state = "blood_vessel-prosthetic"
	nature = MODIFICATION_SLIME
	blood_req = 5
	max_blood_storage = 7.5
	oxygen_req = 2.5
	nutriment_req = 4 // its a non breakable slime bone with muscle. We eat the owner.
	organ_efficiency = list(OP_BONE = 125, OP_MUSCLE = 125, OP_NERVE = 125) //We have slightly higher efficiency, but we also don't have a bone to protect us so any damage to the internals damages all of us
	price_tag = 200
	force = WEAPON_FORCE_NORMAL

/obj/item/organ/internal/bone/slime/removed_mob()
	..()
	visible_message(SPAN_NOTICE("the [src] lose cohesion and become a puddle of goo!"))
	qdel(src)
	return

//organs
/obj/item/organ/internal/stomach/slime
	name = "Aulvae lysosomes"
	desc = "A series of small organs found floating barely-visible within an Aulvae that assist in digestion."
	icon_state = "slime_stomach"
	nature = MODIFICATION_SLIME
	organ_efficiency = list(OP_STOMACH = 125)

/obj/item/organ/internal/stomach/slime/removed_mob()
	..()
	visible_message(SPAN_NOTICE("the [src] lose cohesion and become a puddle of goo!"))
	qdel(src)
	return

//Core(brain)
/obj/item/organ/internal/vital/brain/slime
	name = "Aulvae core"
	desc = "A complex, organic knot of jelly and crystalline particles."
	icon = 'icons/mob/slimes.dmi'
	icon_state = "bluespace slime extract"
	nature = MODIFICATION_SLIME
	parent_organ_base = BP_CHEST
	blood_req = 0
	max_blood_storage = 0
	oxygen_req = 0
/*
This noise doesn't work, nor has it ever.
It is also obsolete as revival for slimepeople is now accomplished via
a tweak to plasma to make it affect dead slimes inmstead of going into the body
this code is maintained for postereity or incase someone wants to try it again themselves -cdb

	var/regenerating = FALSE
	var/revival_chem = "plasma"
	var/respawn_delay = 100 // Delay, in deciseconds (1/10th of a second), before the slime actually revive after being injected.

/obj/item/organ/internal/vital/brain/slime/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/reagent_containers/syringe) && !regenerating)
		var/obj/item/reagent_containers/syringe/S = I
		if(S.mode == 1 && S.reagents.remove_reagent(revival_chem, 5)) // We inject 5u of plasma // the 1 correspond to SYRINGE_INJECT, but we're before the define
			to_chat(user, SPAN_NOTICE("You inject [revival_chem] into [src]."))
			src.visible_message("[src] starts to wobble and wiggle...")
			regenerating = TRUE
			spawn(100) regen_body()

/obj/item/organ/internal/vital/brain/slime/proc/regen_body()
	if(loc != get_turf(src))
		forceMove(src, get_turf(src))
	var/mob/living/carbon/human/host = new(src, FORM_SLIME, FORM_SLIME)
	brainmob?.mind.transfer_to(host)

	src.visible_message("[src] expands into a humanoid form.")
*/
