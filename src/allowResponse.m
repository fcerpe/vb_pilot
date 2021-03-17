function [onset, duration] = allowResponse(cfg, thisEvent, thisFixation, thisPresentation)

    %% Get parameters

    % Set for how many frames this event will last
    framesLeft = floor(cfg.timing.eventDuration / cfg.screen.ifi); 
    
    % Let participant respond now
    getResponse('start', cfg.keyboard.responseBox);
    
    %% Start the dots presentation
    vbl = Screen('Flip', cfg.screen.win);
    onset = vbl;

    while framesLeft

            
        % I simply need to print words on the screen
        %
        % Next: 
        % - second screen with question and wait for answer
        % - add presentation format (when done)
        
        
        DrawFormattedText(cfg.screen.win, cfg.task.responseMessage, 'center', 'center');
        

%         thisFixation.fixation.color = cfg.fixation.color;
%         if thisEvent.target(1) && vbl < (onset + cfg.target.duration)
%             thisFixation.fixation.color = cfg.fixation.colorTarget;
%         end
%         drawFixation(thisFixation);
% 
%         Screen('DrawingFinished', cfg.screen.win);

        vbl = Screen('Flip', cfg.screen.win, vbl + cfg.screen.ifi);

        %% Update counters

        % Check for end of loop
        framesLeft = framesLeft - 1;

    end

    %% Erase last dots

    drawFixation(thisFixation);

    % Revert changes made in 'set parameters' (response recording)
    getResponse('stop', cfg.keyboard.responseBox);
    
    Screen('DrawingFinished', cfg.screen.win);

    vbl = Screen('Flip', cfg.screen.win, vbl + cfg.screen.ifi);

    duration = vbl - onset;
