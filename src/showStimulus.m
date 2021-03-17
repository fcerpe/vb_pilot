function [onset, duration] = showStimulus(cfg, thisEvent, thisFixation, thisPresentation)

    %% Get parameters

    % Set for how many frames this event will last
    framesLeft = floor(cfg.timing.eventDuration / cfg.screen.ifi); 
    
    % Bigger font size 
    Screen('TextSize', cfg.screen.win, cfg.text.stimSize);
  
    %% Start the dots presentation
    vbl = Screen('Flip', cfg.screen.win);
    onset = vbl;

    while framesLeft
        
        % Cast as double to show braille. A bit brutal but works
        if thisPresentation.alphabet == 'f' % French requires box
            DrawFormattedText(cfg.screen.win, double(thisPresentation.l1.char), thisPresentation.x1, thisPresentation.y6);
            DrawFormattedText(cfg.screen.win, double(thisPresentation.l2.char), thisPresentation.x2, thisPresentation.y5);
            DrawFormattedText(cfg.screen.win, double(thisPresentation.l3.char), thisPresentation.x3, thisPresentation.y4);
            DrawFormattedText(cfg.screen.win, double(thisPresentation.l4.char), thisPresentation.x4, thisPresentation.y3);
            DrawFormattedText(cfg.screen.win, double(thisPresentation.l5.char), thisPresentation.x5, thisPresentation.y2);
            DrawFormattedText(cfg.screen.win, double(thisPresentation.l6.char), thisPresentation.x6, thisPresentation.y1);
            
        else
            
            DrawFormattedText(cfg.screen.win, double(thisPresentation.stimulus), 'center', 'center');
            
        end

        vbl = Screen('Flip', cfg.screen.win, vbl + cfg.screen.ifi);

        %% Update counters

        % Check for end of loop
        framesLeft = framesLeft - 1;

    end

    %% Erase last dots

    drawFixation(thisFixation);
    
    % Revert changes made in 'set parameters' (enlarged text size)
    Screen('TextSize', cfg.screen.win, cfg.text.size);

    Screen('DrawingFinished', cfg.screen.win);

    vbl = Screen('Flip', cfg.screen.win, vbl + cfg.screen.ifi);

    duration = vbl - onset;
