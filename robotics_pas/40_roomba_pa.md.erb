---
title: "PA: ROS Roomba"
desc: Robot acts like a Roomba vacuum cleaner without vacuum 
---
## Assignment

You will write ROS code to make a robot act in ways that are reminiscent of a [Roomba vacuum](https://www.youtube.com/watch?v=09Wc4Q_R3Ac). It will traverse a space in a random pattern, avoiding obstacles using LiDAR. Once the room is "clean" it will return to where it started in a straight line.

### Learning goals

* Learn and practice Python
* Learn and practice ROS Concepts
* Experience the fact that there's noise in the sensors
* Write a more complicated behavior which has multiple modes

## Steps

* Start with a basic turtlebot3 gazebo space: `roslaunch turtlebot3_gazebo turtlebot3_stage_1.launch`
* Write a new program which has a robot drive through a walled space, and act something like a variation on a Roomba.
* In the first stage (patrolling) the robot drives around randomly
* It drives straight, until it comes close to a wall, rotates in place, and continues in a new direction.
  * It's not immediately clear how much to rotate.
  * Should it rotate some amount each time or should the amount of rotation vary randomly?
* The second stage (return to base) begins after 60 seconds.
* Now the robot drives in a straight line to whatever coordinate it started at
  * Make the line as straight, non-wavy, as you can
  * Stop when you are back where you started

### Ideas on making it more interesting

* Use a more complicated space like stage_2 or stage_4 which will contain obstacles
* Allow for the case that the obstacle is in the first stage (patrolling)
* Allow for the case that the obstacle is in the second stage (return to base)
* Instead of simply waiting 60 seconds, come up with another way to decide that the room is clean

## Deliverables

<%= callout("NB", " While you are welcome to look at code from examples you need to write this from scratch! (We will check!)", :small) %>

* Directory with your solution, zipped up
  * All source files
  * A readme explaining the structure, interesting algorithm, and any other relevant information
  * Link to a video showing your solution run in the simulator

* Video
  * Don't worry about production values as long as we can understand what we are seeing
  * Imagine giving Pito a demo as you explain what you were showing
  * There needs to be casual narration


### Tips

1. The LiDAR data comes via a subscription to `/scan` topic with message type [`LaserScan.msg`](http://docs.ros.org/melodic/api/sensor_msgs/html/msg/LaserScan.html). In Python it will be delivered to you as an object of class `LaserScan`
1. `LaserScan` has lots of fields, see if you can understand them. A key one is `.ranges`/
1. `ranges` in a python list structure and can be easily manipulated as any other list. you can break the data down into relevant chunks (front view, rear view, etc). for more information, try googling: python list slicing, list comprehension, list basics, could be a few staring points.
1. Notice that the in `ranges` is a little noisy. Before you use it, you need to do some filtering. You will find a min_value in the `LaserScan`. Check each value you get and if it's less than the min_value or if its equal to `inf` consider it to be zero.
1. Consider writing a separate filter node which takes "raw" LiDAR data (subscribes to /scan) and publishes "cleaned up" LiDAR data (publishes for example to /scan/clean). A related approach is to subscribe to /scan and publish something like /scan/semantic that instead of just cleaning up the data also computes some mins and maxes in different directions of interest.
1. When you pick a turning method, reason with yourself why you are choosing your method example: "I am choosing to make the robot turn exactly 90 degrees every turn because most corners are 90 degrees and most walls are flat, so one or two 90 degree turns should always get a robot unstuck" Then, think of all the ways your turning method could fail - sort of a proof by counterexample. if you come up with failure cases, your next step is to either A: accept, and create both simulation and real life environments where that condition doesn't exist (you may lose points for this) B: add more cases/ states to your robot. example: "turn 90 degrees if x and 45 degrees if Y" or C: pick a completely new turning method
1. Get code to run in simulation before real life. Make note of sensor readings- like lidar (using rostopic in the command line). Then, run the exact same code on a real robot. How does the behavior change? Maybe go back and forth a 1 or 2 times without changing anything, just observe and begin to form hypotheses. does the sensor data look different? Add to your code to account for real world inconsistencies that are not present in simulation. 
1. Hint: The angle between two points (forming a line) and the x axis of the coordinate system can be calculated by: angle = arctan((y2 - y1)/(x2-x1))