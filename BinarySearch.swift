//
// BinarySearch.swift
//
// Created by Remy Skelton
// Created on 2025-03-27
// Version 1.0
// Copyright (c) 2025 Remy Skelton. All rights reserved.
//
// This program will generate 10 random integers on a line
// between 1 and 100 it will then ask for a user number
// and search for that number in the array
// and return the index of the number using binary search

// Import foundation library
import Foundation

// MAX_ARRAY size constant
let MAX_ARRAY = 10

// Initialize the user number string
var userNumberString: String = ""

// Initialize the user number integer
var userNumber: Int = 0

// Initialize the index variable
var index: Int = 0

// Initialize the array of random integers
var arrayRandomInts: [Int] = []

// Do while to run until 'q' is entered
repeat {
    // Call the function to populate the array with random integers
    arrayRandomInts = populatingArray()

    // Sort the array of random integers
    arrayRandomInts.sort()

    // Print welcome message
    print("What number are you searching for in the list below? Enter 'q' to quit.")

    // Print the array of random integers
    for index in 0 ..< MAX_ARRAY {
        // Print the random integers in a single line
        print("\(arrayRandomInts[index]) ", terminator: "")
    }

    // Ask for a number
    print(" Number: ", terminator: "")

    // Read the user input
    userNumberString = readLine()!

    // Check if the user entered 'q'
    if userNumberString.lowercased() == "q" {
        // Print the goodbye message
        print("Goodbye!")
    } else {
        // Guard to convert the user input to an integer
        guard let userNumber = Int(userNumberString) else {
            // Print an error message if the conversion fails
            print("Invalid input \(userNumberString). Please enter a number.")
            // Continue to restart the loop
            continue
        }

        // Initialize the low and high variables for binary search
        var low = 0
        var high = MAX_ARRAY - 1

        // While loop to search for the number
        while low <= high {
            // Calculate the middle index
            let mid = (low + high) / 2

            // Check if the number is found
            if arrayRandomInts[mid] == userNumber {
                index = mid
                break
            } else if arrayRandomInts[mid] < userNumber {
                // Search in the right half
                low = mid + 1
            } else {
                // Search in the left half
                high = mid - 1
            }
            index = -1
        }
        // Check if the number was found
        if index != -1 {
            // Print the index of the number
            print("The number \(userNumber) is found as early as index \(index).")
        } else {
            // Print a message if the number was not found
            print("The number \(userNumber) was not found in the array.")
        }
    }

// While loop to continue until 'q' is entered
} while userNumberString != "q"

// Function to populate the array with random integers
func populatingArray() -> [Int] {
    // Create an array to hold the random integers
    var arrayRandomInts: [Int] = []

    // FOR loop to generate 10 random integers
    for _ in 0 ..< MAX_ARRAY {
        // Generate a random integer between 1 and 100
        let randomInt = Int.random(in: 1...100)

        // Add the random integer to the array
        arrayRandomInts.append(randomInt)
    }

    // Return the populated array
    return arrayRandomInts
}
