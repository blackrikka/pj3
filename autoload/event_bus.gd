extends Node

## Global event bus. Signals only; no state or logic here.

signal currency_changed(kind: String, value: float)
signal stage_changed(n: int)
signal wave_progress(cur: int, total: int)
signal boss_timer(remaining: float, total: float)
signal stage_cleared(n: int)
signal stage_failed(n: int)
signal roster_changed()
signal party_changed()
signal upgrade_changed(id: String)
signal offline_reward_ready(sec: float, gold: float)
