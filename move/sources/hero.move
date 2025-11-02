module challenge::hero;

use std::string::{Self as string, String};

// ========= STRUCTS =========
public struct Hero has key, store {
    id: UID,
    name: String,
    image_url: String,
    power: u64,
}

public struct HeroMetadata has key, store {
    id: UID,
    timestamp: u64,
}

// ========= FUNCTIONS =========

#[allow(lint(self_transfer))]
public fun create_hero(name: String, image_url: String, power: u64, ctx: &mut TxContext) {
    let hero = Hero {
        id: object::new(ctx),
        name,
        image_url,
        power
    };

    transfer::transfer(hero, ctx.sender());

    let hero_metadata = HeroMetadata {
        id: object::new(ctx),
        timestamp: ctx.epoch_timestamp_ms()
    };

    transfer::freeze_object(hero_metadata);
}

/// Fuse two heroes into one stronger hero
/// The new hero will have:
/// - Combined name: "Name1 (Fused)"
/// - First hero's image_url
/// - Combined power: power1 + power2
#[allow(lint(self_transfer))]
public fun fuse_heroes(
    hero1: Hero,
    hero2: Hero,
    ctx: &mut TxContext
) {
    let Hero { id: id1, name: name1, image_url: image_url1, power: power1 } = hero1;
    let Hero { id: id2, name: _, image_url: _, power: power2 } = hero2;

    object::delete(id1);
    object::delete(id2);

    let fused_power = power1 + power2;
    let mut combined_name = name1;
    string::append(&mut combined_name, string::utf8(b" (Fused)"));

    let fused_hero = Hero {
        id: object::new(ctx),
        name: combined_name,
        image_url: image_url1,
        power: fused_power,
    };

    transfer::transfer(fused_hero, ctx.sender());

    let hero_metadata = HeroMetadata {
        id: object::new(ctx),
        timestamp: ctx.epoch_timestamp_ms()
    };

    transfer::freeze_object(hero_metadata);
}

// ========= GETTER FUNCTIONS =========

public fun hero_power(hero: &Hero): u64 {
    hero.power
}

#[test_only]
public fun hero_name(hero: &Hero): String {
    hero.name
}

#[test_only]
public fun hero_image_url(hero: &Hero): String {
    hero.image_url
}

#[test_only]
public fun hero_id(hero: &Hero): ID {
    object::id(hero)
}

