/*:
## App Exercise - Fitness Tracker: Constant or Variable?
 
 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 There are all sorts of things that a fitness tracking app needs to keep track of in order to display the right information to the user. Similar to the last exercise, declare either a constant or a variable for each of the following items, and assign each a sensible value. Be sure to use proper naming conventions.
 
- Name: The user's name
- Age: The user's age
- Number of steps taken today: The number of steps that a user has taken today
- Goal number of steps: The user's goal for number of steps to take each day
- Average heart rate: The user's average heart rate over the last 24 hours
 */
let name = "Sam";
print("The users name will always remain the same so it can be defined as a constant")
var age = 20;
print("the users age will change every year so we need to make it a variable in order to keep track");
var stepsTaken = 0;
print("The steps taken every day will change so it needs to be a variable")
var stepsGoal = 3000;
print("While the goal will remain the same on a daily basis, I want the user to be able to change their goal so it needs to be a variable.")
var averageHeartRate = 100;
print("The user's average heart reat will always be changing so it needs to be a variable.")


/*:
 Now go back and add a line after each constant or variable declaration. On those lines, print a statement explaining why you chose to declare the piece of information as a constant or variable.
 
[Previous](@previous)  |  page 6 of 10  |  [Next: Exercise - Types and Type Safety](@next)
 */
