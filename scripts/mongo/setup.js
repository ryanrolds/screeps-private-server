db.createUser({
    user: 'screeps',
    pwd: 'password',
    roles: [
        {
            role: 'dbOwner',
            db: 'screeps',
        },
    ],
});