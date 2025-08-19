

Config = {}

Config.LawmenNeeded = 0

Config.StoreRobberies = {
    ['SaintDenis'] = {
        label = 'Rob Saint Denis Store',
        object = 'p_register03x',
        robTime = 5000,
        cooldown = 1000000,
        coords = vector4(2825.14, -1319.89, 46.75, 312.34),
        itemNeeded = {item = 'lockpick', amount = 1},
        rewardAmount = {min = 50, max = 150},
        rewardItems = {
            {item = "bread", itemLabel = "Bread", count = 1, chance = 100}
        },
        animations = {
        ['player'] = {  
                male = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
                female = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
            }
        },
    },
    ['Blackwater'] = {
        label = 'Rob Blackwater Store',
        object = 'p_register03x',
        robTime = 5000,
        cooldown = 1000000, 
        coords = vector4(-785.65, -1322.15, 43.88, 193.17),
        itemNeeded = {item = 'lockpick', amount = 1},
        rewardAmount = {min = 50, max = 150},
        rewardItems = {item = "bread", itemLabel = "Bread", count = 1, chance = 100},
        animations = {
        ['player'] = {  
                male = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
                female = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
            }
        },
    }
}

