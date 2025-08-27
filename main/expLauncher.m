%% General experimenter launcher
%  =============================
% By :      Martin SZINTE
% Projet :  pRFexp7T
% With :    Penelope TILSLEY, Jan Patrick STELLMANN

% Version description
% ===================
% Experiment in which we use a square full screen 4 directions (left/right/up/down) 
% bar pass stimuli with an attention task to the bar in order to obtain pRF retinotopy of 
% the occipital, parietal, frontal and subcortical structures.
% Adapted for 7T scanner CRMBM and to the ProPixx projector
% Use circular apperture and cross

% To do
% -----
% - Make a video and keep in mind to crop it for visual design

% To run
% ------
% - Check the position of the screen, adjust mirror to fit the stim
% - Check that the flip of the monitor for the mirror is correct (reversed when looking in the bore) 
% - Check that the button box is working by pressing button while printing in the command window prompt
% - Try the tumb left (print "r") and tumb right (print "b"). 
% - If not printing consider unplugging the USB cable of the Current Design box before replugging and testing anew
% - If not printing the right buttons, check that button box is on USB (not blinking) / HHSC 2x2 / HID KEY BYGRT and if not adjust it



% First settings
% --------------
Screen('CloseAll');clear all;clear mex;clear functions;close all;home;AssertOpenGL;

% General settings
% ----------------
const.expStart          =   1;              % Start of a recording exp                          0 = NO  , 1 = YES
const.checkTrial        =   0;              % Print trial conditions (for debugging)            0 = NO  , 1 = YES
const.genStimuli        =   0;              % Generate the stimuli                              0 = NO  , 1 = YES
const.drawStimuli       =   0;              % Draw stimuli generated                            0 = NO  , 1 = YES
const.mkVideo           =   0;              % Make a video of a run                             0 = NO  , 1 = YES

% External controls
% -----------------
const.scanner           =   1;              % run in MRI scanner                                0 = NO  , 1 = YES
const.scannerTest       =   0;              % run with T returned at TR time                    0 = NO  , 1 = YES
const.room              =   1;              % run in MRI or eye-tracking room                   1 = MRI , 2 = eye-tracking
const.training          =   0;              % training session                                  0 = NO  , 1 = YES

% Run order and number per condition
% ----------------------------------
const.cond_run_order    =   [01;01];
const.cond_run_num      =   [01;02];

% Desired screen setting
% ----------------------
if const.training
    const.desiredFD     =   60;           % Desired refresh rate for training on laptop
else
    const.desiredFD     =   120;            % Desired refresh rate on propixx screen
end
%fprintf(1,'\n\n\tDon''t forget to change before testing\n');
const.desiredRes        =   [1920,1080];    % Desired resolution

% Path
% ----
dir                     =   (which('expLauncher'));
cd(dir(1:end-18));

% Add Matlab path
% ---------------
addpath('config','main','conversion','instructions','trials','stim','stats');

% Subject configuration
% ---------------------
[const]                 =   sbjConfig(const);
                        
% Main run
% --------
main(const);
