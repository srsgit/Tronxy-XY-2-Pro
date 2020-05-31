; Configuration for Tronxy XY-2 Pro-A ChiTu board
;
; Tweaked E-Steps
; Tweaked PI parameters to stop massive over/undershoots 
;
; Support for power-off save or not, it will take effect after restart
; 0: indicates not supported 1: indicates supported
M8000 I1
;
; Support for printing is complete or not, restart after setting is effective
; 0: indicates not supported 1: indicates supported
M8001 I1
; ====================================
; The following is the step motor direction control
; The directions of I1 and I-1 are exactly opposite, so if the direction of the motor is not correct, either change the wiring or change this direction parameter
; X stepper motor direction, I1 or I-1
M8002 I1
; ====================================
;
;
; Y stepper motor direction
M8003 I1
; ====================================
;
;
; Z stepper motor direction
M8004 I-1
; ====================================
;
;
; E stepper motor direction
M8005 I1
; ====================================
; XYZ axis extrusion head / platform movement configuration, it only affects the actual movement direction of the manual interface button
; 0: X-axis direction Extrusion head movement 1: X-axis direction Platform movement
; Most machines currently on the market are X-axis extrusion head movements
M8005 X0
; ====================================
; 0: Y axis direction Extrusion head movement
; 1: Y-axis direction Platform movement
; Currently I3 structure Y axis is platform movement, delta, ultimaker and makerbot Y axis is extrusion head movement
M8005 Y-1
; ====================================
; 0: Z axis movement of extrusion head
; 1: Z axis direction platform movement
; At present, the Z axis of I3 structure and delta structure is the movement of the extrusion head, and the Z axis of ultimaker and makerbot structure is the movement of the platform
M8005 Z0
; ====================================
Speed-related settings, with speed in mm / s and acceleration in mm / s ^ 2
; The maximum starting speed, when the speed of movement past this speed, will use this speed as the starting point, this speed is mainly to prevent out of step,
; If this value is too small, it will cause the rail corners to bulge when rounding * 80
M8006 I100
; ====================================
; The maximum turning speed (corresponding to the jerk speed in open source firmware), if the actual turning speed of the movement is greater than this value,
; Forces the movement to slow down. During the filling process, there will be a large number of reciprocating motions. This value is large, the noise is large, and it is easy to lose steps.
; This value is small, slow, and print quality will be relatively poor when printing speed is high * 25
M8007 I10
; ====================================
;
; Acceleration, the greater the value, the greater the average speed of actual operation, but the noise is also greater,
; The smaller the value, the smaller the actual speed. * 800
M8008 I400
; ====================================
;
; [Step-related parameters] After setting the parameters, please print a cube, or manually control the movement of each axis, and then measure the size with a ruler to confirm that there is no problem with the parameters
; [Mm value of each step of XY] such as 20 teeth, tooth pitch is 2mm (mxl specification, 2gt tooth data is 2mm), 1.8 degree stepper motor, 16 subdivision, then (20 * 2) / ((360 /1.8)*16)
M8009 S0.00625
; ====================================
;
;
; If you need to set the X and Y stepper motor parameters independently, you can use this command to tick the front box.
; M8009 X0.0127 Y0.0127
; ====================================
;
; Mm value of each step of Z, calculation formula: lead / ((360 / 1.8) * 16),
; The lead is the height of the platform rising when the screw turns
M8010 S0.00125
; ====================================
; E mm value of each step, this value is equal to the circumference of the extrusion gear divided by 3200,
; If there is a reduction gear, it needs to be divided by the reduction ratio.
; If you find that the wire is relatively thin or often faulted, it is recommended to set this value a little smaller than the real value, the wire is better
M8011 S0.005194
; ====================================
;
; The maximum speed of various parameters, in order to ensure the stability of the machine, please set according to the actual measurement results
; Maximum speed of XY movement mm / s * 200
M8012 I150
; ====================================
;
;
; Maximum speed of Z movement mm / s
M8013 I6
; ====================================
;
;
; Maximum speed of extruder mm / s
M8014 I120
; ====================================
; Z return to zero speed,
; makerware slicing software slicing will ignore this zeroing speed, because the zeroing speed is specified in its gcode
; The first zeroing speed when Z is zeroed, the speed is faster
M8015 I6
; ====================================
;
;
; The first zeroing speed when XY zeroing, faster
M8015 S40
; ====================================
;
;
; The second return speed when Z returns to zero, slower
M8016 I4
; ====================================
;
;
; XY return to zero speed for the second time, slower
M8016 S8
; ====================================
; Pre-extrusion before printing
; Pre-extrusion length mm,
; Whether the first layer and the bottom plate are firmly attached directly affects the print quality. A little more pre-extrusion will make the bottom plate stick better.
M8017 I3
; ====================================
;
;
; Extruder maximum pre-extrusion speed mm / s, non-reduction gear feeding, the maximum speed is usually above 100
M8018 I100
; ====================================
; The following two parameters are closely related to the compatibility with Replicator / Makerware software. If you do not plan to be compatible with such software, you can leave it alone.
; Supported maximum withdrawal speed, unit is mm / s, when it is 0, it means the same as E maximum speed.
; The default Makerware double-headed section is very slow, and the withdrawal time is very long.
M8019 I50
; ====================================
; Withdrawal length unit mm, if you do not intend to be compatible with such software, you can leave it alone
Withdrawal distance. If the drawback is too small, it will leak, if the drawback is too large, the pause time is too long, and it is easy to leak.
; Please set reasonably according to your feed type and extrusion head type,
M 8020 S1.5
; ====================================
; makerware software switches the length of the wire when extruding the head,
; makerware slice is very long, and it is easy to get stuck when squeezed back
; If zero, follow slice software settings
M8033 S0
; ====================================
;
; Set the default consumable diameter used by the machine, the unit is mm
; Consumable diameter
M8021 S1.75
; ====================================
; The highest temperature supported by the extrusion head. This temperature is set to prevent the user from accidentally operating the extrusion head temperature and causing damage to the extrusion head.
; Thermal resistance can only reach 260 degrees, peek tube also starts to soften at about 260 degrees
; Extrusion head maximum temperature
M8022 I260
; ====================================
;
; [Consumable interface, the minimum temperature of the wire]
; Consumables interface, minimum temperature required for extruding consumables
M8022 T170
; ====================================
;
; Hot bed maximum temperature
; The highest temperature of hot plate
M8023 I120
; ====================================
; Temperature error detection is prohibited. It is strongly recommended not to disable this function. The default temperature error detection will be when the temperature sensor is not plugged in or
; Warning pops up when heating power is too low 0: Enable temperature detection
; 1: Disable temperature error detection of extrusion head and hot bed 2: Only prohibit temperature error detection of hot bed
M8023 T0
; ====================================
; X, Y, Z maximum stroke, please set according to the actual print size, the unit is mm [Please be sure to set this parameter carefully] If the setting is too small,
; Printing beyond the set stroke is not possible. If the setting is too large, the excess position will not be detected if the slice movement command exceeds the actual machine stroke.
; Limitation will force the motor to collide. X maximum stroke, with the sound of LCD enabled, the buzzer will sound if the motion exceeds the stroke
M8024 I255
; ====================================
;
; Y maximum stroke
M8025 I255
; ====================================
;
; Z maximum travel
M8026 I260
; ====================================
;
; Set the number of extrusion heads, at least 1, currently the motherboard defaults to 1
; Configure the number of extrusion heads
M8027 I1
; ====================================
; Some machines may wish to ban hot beds, possibly by this directive
; 0: Disable Hot Bed
; 1: enable hot bed,
M8027 T1
; ====================================
; advanced settings
; Ejection compensation, machine, extrude after ejection, because of the elastic effect, it will actually retract a little bit from the original position,
; If it does n’t understand, it will be zero
M8028 S0.00
; ====================================
; Limit switch structure type, the limit switch is connected to the default 3 limit interfaces on the motherboard
; 0: Unilateral zero limit (front left), such as mendel, i3 .... 1: Unilateral maximum point limit (rear right), such as makerbot
; 3: Left rear limit (rarely) 4: Right front limit (rarely)
M8029 I0
; ====================================
; [XYZ limit switch wiring type] If this configuration is wrong, when the motor is operated in the manual interface, the motor will not be able to move in a certain direction and the buzzer will make a dripping sound
; In addition, the short-circuit cap next to the Filament seat is used to select the limit voltage (3.3 / 5V), and it must not be left floating. 0: Limit switch is normally open (unrestricted)
; When-and s voltage are high level, low level when limit) 1: limit switch is normally closed (without limit-and s voltage are low level, high when limit)
M8029 T0
; ====================================
; [Z-axis limit switch position]
; 0: The limit when the extrusion head is closest to the platform, the limit is connected to Z-
; 1: Limit when the extrusion head is farthest from the platform, the limit is connected to Z +
M8029 S0
; ====================================
; [Whether the XYZ axis returns to (0,0,0), only for XYZ or hbot models]
; 0: return to XYZ (0,0,0) position, that is, the extrusion head returns to the left front position of the platform;
; 1: stay in limit position
M8029 C0
; ====================================
; [Disable material detection enable] The material limit is connected to the limit of FILAMENT
; 0: Forbid material detection
; 1: enable blank detection
M8029 D1
; ====================================
; FILAMENT limit configuration at the beginning, when the cutout detection function is not enabled, Delta models automatically level the limit switch connected to it,
; Usually this limit is always disabled, even if the switch is triggered, it will not cause the buzzer to drip.
; 1: same as XYZ limit type -1: opposite to XYZ limit type
M8029 P-1
; ====================================
; [Nozzle fan control] This fan dissipates heat to the model. It is recommended to set the fan to turn on and off by the slicing software.
;> 0: If you need to force the extruder to turn on the fan automatically when the temperature is greater than a certain temperature, set a temperature greater than 0.
; 0: If set to 0, fan start is controlled by slicing software
M8030 I0
; ====================================
; [Throat fan control] [M8030 I0 T-1]
; This fan dissipates the nozzle throat. The self-starting temperature must be set after the M8030 I0 command. The parameter after I indicates the temperature.
; When it is 0, it means that the motherboard fan will not change with temperature, otherwise the fan will turn on when the temperature of the extrusion head reaches the specified temperature
M8030 I50 T-1
; ====================================
; SD card support folder display
; 0: not supported
; 1: support
M8034 I1
; ====================================
; Leveling related settings, can take up to 5 points, X, Y are floating point numbers, the unit is mm
; If X and Y are both less than 1, it indicates the ratio of the relative stroke, otherwise it is expressed as the absolute coordinate value of X and Y
; Number of leveling points
M8035 I7
; ====================================
;;;;;;;;;;;;;;; leveling points,
;;;;;;;;;;;;;;;;;;;;;;;;;;; The first three parameters use auto-leveling
M8036 X10 Y10; the first point represents the XY offset of the sensor from the extrusion nozzle,
M8036 X60 Y40; the second point represents the minimum position of the pick point
M8036 X240 Y240; the third point indicates the maximum position of the point
;;;;;;;;;;;;;;;;;;;;;;;; The next four are manual leveling points
M8036 X60 Y240; rear left
M8036 X240 Y240; rear right
M8036 X60 Y40; front left
M8036 X240 Y40; front right
; ====================================
;;;;;;;;;;;;;;;;;;;; auto-leveling increased parameters; ;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;
M8038 X4; number of points in X direction is up to 7
M8038 Y4; number of points in Y direction is up to 7
; ====================================
; Machine type
; 0: XYZ ordinary type
; 2: Hbot type
M8080 I0
; ====================================
; [Thermal resistance type] For the thermal resistance, the thermal resistance of the same parameter is actually slightly different. The different thermal resistances are relatively close at low temperature, and
; The displayed temperature difference can reach 40 degrees. If it is a thermistor, be sure to set the correct thermal resistance type. 0: Ideal NTC 100K 1% 3950 B.
; 1: K-type thermocouple. 2: EPCOS NTC 100K 1% 3950 B, corresponding to Marlin's sensor type 2
;
M8081 I2
; ====================================
; Enable leveling, [if enabled, please tick in the front box of the option below and enter the parameters in the back box]
; 0: Disable leveling enable
; 1: Allow leveling enable On the delta interface, you can enable it through the interface,
M8083 I1
; ====================================
; [Delta machine or automatic leveling XYZ machine] The height difference of the Z leveling limit = Z position of the leveling limit-Z zero point, if the photoelectric leveling limit is usually positive
; If the head is extruded to the motherboard during the limit, it is negative. 0: No offset is allowed. The stroke of Z is set to “Z”. The printed gcod e does not need to add an auto-leveling instruction.
; Use this mode. Non-zero: Z's current position is automatically determined when the leveling limit is triggered. Under the DELTA structure, the G29 automatic leveling command must be connected after G28 returns to zero and before the print command.
M8084 Z1
; ====================================
;
; Logo time
; Boot logo duration, minimum 100ms, maximum 6000ms
M8085 I6000
; ====================================
; [Advanced configuration, do not need to move in most cases]
; The pwm ratio of the motherboard fan when starting, the highest is 256, some motherboard fans have stronger wind and more noise
; You can change fan wind and noise through this parameter
M8489 I255
; ====================================
;
; In the interface of loading consumables, the feeding speed of consumables is loaded in mm / s,
; The wire feeding speed is too fast, and the wire cannot be fed in time, which leads to the extruder being out of step and out of step.
M8489 T3
; ====================================
; Whether to force shut down all motors and heating after printing is completed?
; 0: close all
; 1: Does not work after printing, fully obeys gcode instructions
M8489 P0
; ====================================
; PID parameter setting of temperature, [M301 P22.2 I1.08 D114]
; If you are not an expert and your current temperature control is relatively stable, you do not need to change this parameter
; [If this function is enabled, please tick the box in front of the option below and enter parameters in the box behind]
;M301 P22.2 I1.08 D114
; Autotune -> no-overshoot set
M301 P4.77 I0.8515 D160
;
; ====================================
; Automatically modulate the PID command, this command will block for a long time [M303 E0 S150 C5]
; The temperature is 150 degrees, and the automatic periodic oscillation is 4 times. The parameters after the automatic modulation may be seen through the repetier-host.
; [If this function is enabled, please tick the box in front of the option below and enter parameters in the box behind]
; M303 E0 S150 C5
; ====================================
;
; 0: The related configuration of laser engraving is not supported. The related function is to set the speed in the more button.
; 1: Support related configuration of laser engraving
M8520 I0
; ====================================
; [[[[[[[[Save Parameters]]]]]]]]
; This parameter must not be less, otherwise the parameters cannot be saved to the device
; Parameter default configuration cannot be modified
M8500
;