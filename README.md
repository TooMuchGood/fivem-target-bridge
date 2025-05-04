---

### ✅ `README.md` pour ton bridge

```markdown
# 🔗 FiveM Target Bridge

This is a lightweight and modular bridge for FiveM that allows seamless switching between `ox_target` and `qb-target`.

## 💡 Features

- Automatically detects if `ox_target` or `qb-target` is active
- Unified functions for adding:
  - Box Zones
  - Target Models
  - Target Entities
  - Target Bones
  - Target Player actions
- Fallback warnings in console if no target system is active
- Debug poly support

## 🧠 Why use this?

Some servers want to gradually migrate to `ox_target` without rewriting all their custom scripts. This bridge provides an abstraction layer, so your scripts remain agnostic of the target system used.

## 📁 File Structure

```

target\_bridge/
├── client/
│   └── test\_target.lua          # Sample usage (optional)
├── fxmanifest.lua
├── target\_bridge.lua            # Main logic
└── README.md

````

## ⚙️ How to use

### 1. Add it to your `server.cfg` **before** any script using target functions

```cfg
ensure ox_lib
ensure ox_target
ensure target_bridge
````

### 2. Replace your direct calls to `exports['qb-target']` or `exports['ox_target']` with:

```lua
TargetBridge.AddBoxZone(...)
TargetBridge.AddTargetModel(...)
TargetBridge.AddTargetEntityBridge(...)
TargetBridge.AddTargetBone(...)
TargetBridge.AddTargetPlayer(...)
```

### 3. Make sure your scripts depend on the bridge

In your `fxmanifest.lua`:

```lua
dependency 'target_bridge'
```

## 🧪 Sample BoxZone

```lua
CreateThread(function()
    TargetBridge.AddBoxZone("test_zone", vector3(437.39, -981.96, 30.69), 1.5, 1.5, {
        name = "test_zone",
        heading = 0,
        debugPoly = true,
        options = {
            {
                icon = "fas fa-eye",
                label = "Interaction Test",
                action = function()
                    print("✅ Interaction successful!")
                end
            }
        }
    })
end)
```

## 🙌 Credits

Made with ❤️ by [TooMuchGood](https://github.com/TooMuchGood) and [GothamRP](https://github.com/gothamrp24)

---

## ✅ License

MIT — Free to use and modify.

```
