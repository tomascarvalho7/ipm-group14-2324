import { useState } from "react";
import { useNavigate } from "react-router-dom";

export function StageList(props: { showInfo: () => void; }) {
  const navigate = useNavigate();
  const [timeoutId, setTimeoutId] = useState<number | null>(null);

  function handleStageClick(stageNr: number) {
    navigate(`/`)
    props.showInfo();

    // Cancel any existing timeout
    if (timeoutId !== null) {
      clearTimeout(timeoutId);
    }

    // Set a new timeout to navigate after 500 milliseconds
    const newTimeoutId = setTimeout(() => {
      window.location.href = `/#stage${stageNr}`;
    }, 500);

    // Store the new timeout ID
    setTimeoutId(newTimeoutId);
  }


  return (
    <div className="stagelist">
      {[1, 2, 3].map((stageNr) => (
        <div key={stageNr} className="stage" onClick={() => handleStageClick(stageNr)}>   
          Stage {stageNr}
        </div>
      ))}
    </div>
  );
}