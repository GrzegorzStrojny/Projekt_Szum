% Main script for running Gazebo a'la Turtlebot simulation
rosshutdown
rosinit('http://localhost:11311')

global joint1_positionPublisher;
global joint1_positionMessage;
global joint2_positionPublisher;
global joint2_positionMessage;
global joint3_positionPublisher;
global joint3_positionMessage;
global joint4_positionPublisher;
global joint4_positionMessage;
global vel_publisher;
global vel_message;
global gripper_position_publisher;
global gripper_position_message;
global gripper_subposition_publisher;
global gripper_subposition_message;

[joint1_positionPublisher, joint1_positionMessage] = rospublisher('/om_with_tb3/joint1_position/command','std_msgs/Float64');
[joint2_positionPublisher, joint2_positionMessage] = rospublisher('/om_with_tb3/joint2_position/command','std_msgs/Float64');
[joint3_positionPublisher, joint3_positionMessage] = rospublisher('/om_with_tb3/joint3_position/command','std_msgs/Float64');
[joint4_positionPublisher, joint4_positionMessage] = rospublisher('/om_with_tb3/joint4_position/command','std_msgs/Float64');
[vel_publisher, vel_message] = rospublisher('/om_with_tb3/cmd_vel');
[gripper_position_publisher, gripper_position_message] = rospublisher('/om_with_tb3/gripper_position/command');
[gripper_subposition_publisher, gripper_subposition_message] = rospublisher('/om_with_tb3/gripper_sub_position/command');


% 
% msg.Data = 0.21
% joint1_positionMessage.Data = 0.21
% joint2_positionMessage.Data = 0.21
% joint3_positionMessage.Data = 0.21
% joint4_positionMessage.Data = 0.21
% vel_message.Linear = [1,2,3];
% send(vel_publisher, vel_message);
Grip(-0.2)
pause(5)
drive(0.5, 0.5, 0)
pause(3)
drive(0,0,0);
move(0.21, 0.15, 0.10, 0.33);
pause(3);
Grip(1);
move(-1, -1, -1, -1);

%move(0.21, 0.15, 0.10, 0.33);
%drive(0.5, 0.5, 0);

function Grip(x)
    global gripper_position_publisher;
    global gripper_position_message;
    gripper_position_message.Data = x;
    send(gripper_position_publisher, gripper_position_message);
end

function drive(x, y , z)
    global vel_publisher;
    global vel_message;
    vel_message.Linear.X = x;
    vel_message.Linear.Y = y;
    vel_message.Linear.Z = z;
    send(vel_publisher, vel_message);
end

function move(joint1, joint2, joint3, joint4)
    global joint1_positionPublisher;
    global joint1_positionMessage;
    global joint2_positionPublisher;
    global joint2_positionMessage;
    global joint3_positionPublisher;
    global joint3_positionMessage;
    global joint4_positionPublisher;
    global joint4_positionMessage;
    joint1_positionMessage.Data = joint1;
    joint2_positionMessage.Data = joint2;
    joint3_positionMessage.Data = joint3;
    joint4_positionMessage.Data = joint4;

    send(joint1_positionPublisher, joint1_positionMessage);
    send(joint2_positionPublisher, joint2_positionMessage);
    send(joint3_positionPublisher, joint3_positionMessage);
    send(joint4_positionPublisher, joint4_positionMessage);
end


















