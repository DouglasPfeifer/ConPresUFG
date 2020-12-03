//
//  HomeMock.swift
//  ConPresApp
//
//  Created by Douglas Tonetto Pfeifer on 22/11/20.
//  Copyright © 2020 Douglas Tonetto Pfeifer. All rights reserved.
//

import Foundation

struct StudentClassesMock {
    static let today: Date = Date()
    static let tomorrow: Date = Date.tomorrow
    static let yesterday: Date = Date.yesterday
    let mockStudentClass: [Class] = [
        Class(code: "Code 0", schedule: "Schedule 0", status: 0, discipline: "Discipline 0", lecturer: "Lecturer 0", classroom: "Classroom 0", startDate: today, startTime: today, endTime: today, password: "Password 0", latitude: -16.68026407358496, longitude: -49.25654600895208),
        Class(code: "Code 1", schedule: "Schedule 1", status: 0, discipline: "Discipline 1", lecturer: "Lecturer 1", classroom: "Classroom 1", startDate: today, startTime: today, endTime: today, password: "Password 1", latitude: -16.68026407358496, longitude: -49.25654600895218),
        Class(code: "Code 2", schedule: "Schedule 2", status: 0, discipline: "Discipline 2", lecturer: "Lecturer 2", classroom: "Classroom 2", startDate: today, startTime: today, endTime: today, password: "Password 2", latitude: -16.68026407358496, longitude: -49.25654600895228),
        Class(code: "Code 3", schedule: "Schedule 3", status: 0, discipline: "Discipline 3", lecturer: "Lecturer 3", classroom: "Classroom 3", startDate: today, startTime: today, endTime: today, password: "Password 3", latitude: -16.68026407358496, longitude: -49.25654600895238),
        Class(code: "Code 4", schedule: "Schedule 4", status: 0, discipline: "Discipline 4", lecturer: "Lecturer 4", classroom: "Classroom 4", startDate: today, startTime: today, endTime: today, password: "Password 4", latitude: -16.68026407358496, longitude: -49.25654600895248),
        Class(code: "Code 5", schedule: "Schedule 5", status: 0, discipline: "Discipline 5", lecturer: "Lecturer 5", classroom: "Classroom 5", startDate: today, startTime: today, endTime: today, password: "Password 5", latitude: -16.68026407358496, longitude: -49.25654600895258),
        Class(code: "Code 6", schedule: "Schedule 6", status: 0, discipline: "Discipline 6", lecturer: "Lecturer 6", classroom: "Classroom 6", startDate: today, startTime: today, endTime: today, password: "Password 6", latitude: -16.68026407358496, longitude: -49.25654600895268),
        Class(code: "Code 7", schedule: "Schedule 7", status: 0, discipline: "Discipline 7", lecturer: "Lecturer 7", classroom: "Classroom 7", startDate: today, startTime: today, endTime: today, password: "Password 7", latitude: -16.68026407358496, longitude: -49.25654600895278),
        Class(code: "Code 8", schedule: "Schedule 8", status: 0, discipline: "Discipline 8", lecturer: "Lecturer 8", classroom: "Classroom 8", startDate: today, startTime: today, endTime: today, password: "Password 8", latitude: -16.68026407358496, longitude: -49.25654600895288),
        Class(code: "Code 9", schedule: "Schedule 9", status: 0, discipline: "Discipline 9", lecturer: "Lecturer 9", classroom: "Classroom 9", startDate: today, startTime: today, endTime: today, password: "Password 9", latitude: -16.68026407358496, longitude: -49.25654600895298),
        
        Class(code: "Code 10", schedule: "Schedule 0", status: 1, discipline: "Discipline 0", lecturer: "Lecturer 0", classroom: "Classroom 0", startDate: tomorrow, startTime: tomorrow, endTime: tomorrow, password: "Password 0", latitude: -16.68026407358496, longitude: -49.25654600895208),
        Class(code: "Code 11", schedule: "Schedule 1", status: 1, discipline: "Discipline 1", lecturer: "Lecturer 1", classroom: "Classroom 1", startDate: tomorrow, startTime: tomorrow, endTime: tomorrow, password: "Password 1", latitude: -16.68026407358496, longitude: -49.25654600895218),
        Class(code: "Code 12", schedule: "Schedule 2", status: 1, discipline: "Discipline 2", lecturer: "Lecturer 2", classroom: "Classroom 2", startDate: tomorrow, startTime: tomorrow, endTime: tomorrow, password: "Password 2", latitude: -16.68026407358496, longitude: -49.25654600895228),
        Class(code: "Code 13", schedule: "Schedule 3", status: 1, discipline: "Discipline 3", lecturer: "Lecturer 3", classroom: "Classroom 3", startDate: tomorrow, startTime: tomorrow, endTime: tomorrow, password: "Password 3", latitude: -16.68026407358496, longitude: -49.25654600895238),
        Class(code: "Code 14", schedule: "Schedule 4", status: 1, discipline: "Discipline 4", lecturer: "Lecturer 4", classroom: "Classroom 4", startDate: tomorrow, startTime: tomorrow, endTime: tomorrow, password: "Password 4", latitude: -16.68026407358496, longitude: -49.25654600895248),
        Class(code: "Code 15", schedule: "Schedule 5", status: 1, discipline: "Discipline 5", lecturer: "Lecturer 5", classroom: "Classroom 5", startDate: tomorrow, startTime: tomorrow, endTime: tomorrow, password: "Password 5", latitude: -16.68026407358496, longitude: -49.25654600895258),
        Class(code: "Code 16", schedule: "Schedule 6", status: 1, discipline: "Discipline 6", lecturer: "Lecturer 6", classroom: "Classroom 6", startDate: tomorrow, startTime: tomorrow, endTime: tomorrow, password: "Password 6", latitude: -16.68026407358496, longitude: -49.25654600895268),
        Class(code: "Code 17", schedule: "Schedule 7", status: 1, discipline: "Discipline 7", lecturer: "Lecturer 7", classroom: "Classroom 7", startDate: tomorrow, startTime: tomorrow, endTime: tomorrow, password: "Password 7", latitude: -16.68026407358496, longitude: -49.25654600895278),
        Class(code: "Code 18", schedule: "Schedule 8", status: 1, discipline: "Discipline 8", lecturer: "Lecturer 8", classroom: "Classroom 8", startDate: tomorrow, startTime: tomorrow, endTime: tomorrow, password: "Password 8", latitude: -16.68026407358496, longitude: -49.25654600895288),
        Class(code: "Code 19", schedule: "Schedule 9", status: 1, discipline: "Discipline 9", lecturer: "Lecturer 9", classroom: "Classroom 9", startDate: tomorrow, startTime: tomorrow, endTime: tomorrow, password: "Password 9", latitude: -16.68026407358496, longitude: -49.25654600895298),
        
        Class(code: "Code 20", schedule: "Schedule 0", status: 1, discipline: "Discipline 0", lecturer: "Lecturer 0", classroom: "Classroom 0", startDate: yesterday, startTime: yesterday, endTime: yesterday, password: "Password 0", latitude: -16.68026407358496, longitude: -49.25654600895208),
        Class(code: "Code 21", schedule: "Schedule 1", status: 1, discipline: "Discipline 1", lecturer: "Lecturer 1", classroom: "Classroom 1", startDate: yesterday, startTime: yesterday, endTime: yesterday, password: "Password 1", latitude: -16.68026407358496, longitude: -49.25654600895218),
        Class(code: "Code 22", schedule: "Schedule 2", status: 1, discipline: "Discipline 2", lecturer: "Lecturer 2", classroom: "Classroom 2", startDate: yesterday, startTime: yesterday, endTime: yesterday, password: "Password 2", latitude: -16.68026407358496, longitude: -49.25654600895228),
        Class(code: "Code 23", schedule: "Schedule 3", status: 1, discipline: "Discipline 3", lecturer: "Lecturer 3", classroom: "Classroom 3", startDate: yesterday, startTime: yesterday, endTime: yesterday, password: "Password 3", latitude: -16.68026407358496, longitude: -49.25654600895238),
        Class(code: "Code 24", schedule: "Schedule 4", status: 1, discipline: "Discipline 4", lecturer: "Lecturer 4", classroom: "Classroom 4", startDate: yesterday, startTime: yesterday, endTime: yesterday, password: "Password 4", latitude: -16.68026407358496, longitude: -49.25654600895248),
        Class(code: "Code 25", schedule: "Schedule 5", status: 1, discipline: "Discipline 5", lecturer: "Lecturer 5", classroom: "Classroom 5", startDate: yesterday, startTime: yesterday, endTime: yesterday, password: "Password 5", latitude: -16.68026407358496, longitude: -49.25654600895258),
        Class(code: "Code 26", schedule: "Schedule 6", status: 1, discipline: "Discipline 6", lecturer: "Lecturer 6", classroom: "Classroom 6", startDate: yesterday, startTime: yesterday, endTime: yesterday, password: "Password 6", latitude: -16.68026407358496, longitude: -49.25654600895268),
        Class(code: "Code 27", schedule: "Schedule 7", status: 1, discipline: "Discipline 7", lecturer: "Lecturer 7", classroom: "Classroom 7", startDate: yesterday, startTime: yesterday, endTime: yesterday, password: "Password 7", latitude: -16.68026407358496, longitude: -49.25654600895278),
        Class(code: "Code 28", schedule: "Schedule 8", status: 1, discipline: "Discipline 8", lecturer: "Lecturer 8", classroom: "Classroom 8", startDate: yesterday, startTime: yesterday, endTime: yesterday, password: "Password 8", latitude: -16.68026407358496, longitude: -49.25654600895288),
        Class(code: "Code 29", schedule: "Schedule 9", status: 1, discipline: "Discipline 9", lecturer: "Lecturer 9", classroom: "Classroom 9", startDate: yesterday, startTime: yesterday, endTime: yesterday, password: "Password 9", latitude: -16.68026407358496, longitude: -49.25654600895298),
    ]
}
