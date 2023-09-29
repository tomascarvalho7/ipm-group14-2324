import { useNavigate } from "react-router-dom";
import { Stage } from "./Stage";
import { stages } from "./constants";

export function StageList(props: { showInfo: () => void; }) {
  const navigate = useNavigate();

  function handleStageClick(stageNr: string) {
    const link = `/stages/#stage${stageNr}`;

    navigate(link, { replace: true });
    props.showInfo();
  }

  return (
    <div className="stagelist">
      {stages.map((stageNr) => (
        <Stage key={stageNr.number} stageNr={stageNr.number} onClick={() => handleStageClick(stageNr.number)} />
      ))}
    </div>
  );
}