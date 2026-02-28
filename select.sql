SELECT creatures.name, people.name, incidents.bite_size FROM incidents
JOIN creatures
ON incidents.creature_id = creatures.id
JOIN people
ON incidents.bitten_id = people.people_id
JOIN cities
ON people.city_id = cities.id
JOIN bioservice_record
ON incidents.incident_id = bioservice_record.incident_id
WHERE bioservice_record.is_hospitalized = TRUE AND creatures.planet_id != cities.planet_id
ORDER BY incidents.bite_size;
