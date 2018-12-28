#fuzzy select a job
function hs_jobs 
    if not command -v hs > /dev/null
        echo "heatseeker not installed" 
    else 
        jobs | hs | cut -f1 
    end
end

#fuzzy foreground
function ffg
    fg %(hs_jobs)
end

#fuzzy background
function fbg
    bg %(hs_jobs)
end

#fuzzy kill
function fkill
    kill -s SIGKILL %(hs_jobs)
end
